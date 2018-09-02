<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>可视化音乐</title>
<style type="text/css">
* {
  margin: 0;
  padding: 0;
}

body {
  /*   background: linear-gradient(-135deg, #FC656C, #11879E); */
  overflow: hidden;
  width: 100%;
  height: 100%;
}

.color {
  background: linear-gradient(-45deg, #48dfda, #20a0a4);
}

.black {
  background: #000;
}

.wrapper .file {
  position: absolute;
  top: 20px;
  left: 20px;
  padding: 10px;
  box-sizing: border-box;
  border: 2px solid #fff;
  letter-spacing: 0.01em;
  color: #fff;
  cursor: pointer;
  transition: opacity .4s;
  z-index: 2;
}
.wrapper .file:hover {
  opacity: .8;
}
.wrapper .file input {
  display: none;
}
.wrapper canvas {
  vertical-align: bottom;
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
}

</style>
</head>

<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/84/three.js"></script>
<div class="wrapper" id="wrapper">
  <label class="file" for="file">
    打开您本地音频文件
    <input id="file" type="file">
  </label>
</div>
<script type="text/javascript">
THREE.OrbitControls = function ( object, domElement ) {
	this.object = object;
	this.domElement = ( domElement !== undefined ) ? domElement : document;
	// Set to false to disable this control
	this.enabled = true;
	// "target" sets the location of focus, where the object orbits around
	this.target = new THREE.Vector3();
	// How far you can dolly in and out ( PerspectiveCamera only )
	this.minDistance = 0;
	this.maxDistance = Infinity;

	// How far you can zoom in and out ( OrthographicCamera only )
	this.minZoom = 0;
	this.maxZoom = Infinity;

	// How far you can orbit vertically, upper and lower limits.
	// Range is 0 to Math.PI radians.
	this.minPolarAngle = 0; // radians
	this.maxPolarAngle = Math.PI; // radians

	// How far you can orbit horizontally, upper and lower limits.
	// If set, must be a sub-interval of the interval [ - Math.PI, Math.PI ].
	this.minAzimuthAngle = - Infinity; // radians
	this.maxAzimuthAngle = Infinity; // radians

	// Set to true to enable damping (inertia)
	// If damping is enabled, you must call controls.update() in your animation loop
	this.enableDamping = false;
	this.dampingFactor = 0.25;

	// This option actually enables dollying in and out; left as "zoom" for backwards compatibility.
	// Set to false to disable zooming
	this.enableZoom = true;
	this.zoomSpeed = 1.0;

	// Set to false to disable rotating
	this.enableRotate = true;
	this.rotateSpeed = 1.0;

	// Set to false to disable panning
	this.enablePan = true;
	this.keyPanSpeed = 7.0;	// pixels moved per arrow key push

	// Set to true to automatically rotate around the target
	// If auto-rotate is enabled, you must call controls.update() in your animation loop
	this.autoRotate = false;
	this.autoRotateSpeed = 2.0; // 30 seconds per round when fps is 60

	// Set to false to disable use of the keys
	this.enableKeys = true;

	// The four arrow keys
	this.keys = { LEFT: 37, UP: 38, RIGHT: 39, BOTTOM: 40 };

	// Mouse buttons
	this.mouseButtons = { ORBIT: THREE.MOUSE.LEFT, ZOOM: THREE.MOUSE.MIDDLE, PAN: THREE.MOUSE.RIGHT };

	// for reset
	this.target0 = this.target.clone();
	this.position0 = this.object.position.clone();
	this.zoom0 = this.object.zoom;

	//
	// public methods
	//

	this.getPolarAngle = function () {

		return spherical.phi;

	};

	this.getAzimuthalAngle = function () {

		return spherical.theta;

	};

	this.reset = function () {

		scope.target.copy( scope.target0 );
		scope.object.position.copy( scope.position0 );
		scope.object.zoom = scope.zoom0;

		scope.object.updateProjectionMatrix();
		scope.dispatchEvent( changeEvent );

		scope.update();

		state = STATE.NONE;

	};

	// this method is exposed, but perhaps it would be better if we can make it private...
	this.update = function () {

		var offset = new THREE.Vector3();

		// so camera.up is the orbit axis
		var quat = new THREE.Quaternion().setFromUnitVectors( object.up, new THREE.Vector3( 0, 1, 0 ) );
		var quatInverse = quat.clone().inverse();

		var lastPosition = new THREE.Vector3();
		var lastQuaternion = new THREE.Quaternion();

		return function update() {

			var position = scope.object.position;

			offset.copy( position ).sub( scope.target );

			// rotate offset to "y-axis-is-up" space
			offset.applyQuaternion( quat );

			// angle from z-axis around y-axis
			spherical.setFromVector3( offset );

			if ( scope.autoRotate && state === STATE.NONE ) {

				rotateLeft( getAutoRotationAngle() );

			}

			spherical.theta += sphericalDelta.theta;
			spherical.phi += sphericalDelta.phi;

			// restrict theta to be between desired limits
			spherical.theta = Math.max( scope.minAzimuthAngle, Math.min( scope.maxAzimuthAngle, spherical.theta ) );

			// restrict phi to be between desired limits
			spherical.phi = Math.max( scope.minPolarAngle, Math.min( scope.maxPolarAngle, spherical.phi ) );

			spherical.makeSafe();


			spherical.radius *= scale;

			// restrict radius to be between desired limits
			spherical.radius = Math.max( scope.minDistance, Math.min( scope.maxDistance, spherical.radius ) );

			// move target to panned location
			scope.target.add( panOffset );

			offset.setFromSpherical( spherical );

			// rotate offset back to "camera-up-vector-is-up" space
			offset.applyQuaternion( quatInverse );

			position.copy( scope.target ).add( offset );

			scope.object.lookAt( scope.target );

			if ( scope.enableDamping === true ) {

				sphericalDelta.theta *= ( 1 - scope.dampingFactor );
				sphericalDelta.phi *= ( 1 - scope.dampingFactor );

			} else {

				sphericalDelta.set( 0, 0, 0 );

			}

			scale = 1;
			panOffset.set( 0, 0, 0 );

			// update condition is:
			// min(camera displacement, camera rotation in radians)^2 > EPS
			// using small-angle approximation cos(x/2) = 1 - x^2 / 8

			if ( zoomChanged ||
				lastPosition.distanceToSquared( scope.object.position ) > EPS ||
				8 * ( 1 - lastQuaternion.dot( scope.object.quaternion ) ) > EPS ) {

				scope.dispatchEvent( changeEvent );

				lastPosition.copy( scope.object.position );
				lastQuaternion.copy( scope.object.quaternion );
				zoomChanged = false;

				return true;

			}

			return false;

		};

	}();

	this.dispose = function () {

		scope.domElement.removeEventListener( 'contextmenu', onContextMenu, false );
		scope.domElement.removeEventListener( 'mousedown', onMouseDown, false );
		scope.domElement.removeEventListener( 'wheel', onMouseWheel, false );

		scope.domElement.removeEventListener( 'touchstart', onTouchStart, false );
		scope.domElement.removeEventListener( 'touchend', onTouchEnd, false );
		scope.domElement.removeEventListener( 'touchmove', onTouchMove, false );

		document.removeEventListener( 'mousemove', onMouseMove, false );
		document.removeEventListener( 'mouseup', onMouseUp, false );

		window.removeEventListener( 'keydown', onKeyDown, false );

		//scope.dispatchEvent( { type: 'dispose' } ); // should this be added here?

	};

	//
	// internals
	//

	var scope = this;

	var changeEvent = { type: 'change' };
	var startEvent = { type: 'start' };
	var endEvent = { type: 'end' };

	var STATE = { NONE: - 1, ROTATE: 0, DOLLY: 1, PAN: 2, TOUCH_ROTATE: 3, TOUCH_DOLLY: 4, TOUCH_PAN: 5 };

	var state = STATE.NONE;

	var EPS = 0.000001;

	// current position in spherical coordinates
	var spherical = new THREE.Spherical();
	var sphericalDelta = new THREE.Spherical();

	var scale = 1;
	var panOffset = new THREE.Vector3();
	var zoomChanged = false;

	var rotateStart = new THREE.Vector2();
	var rotateEnd = new THREE.Vector2();
	var rotateDelta = new THREE.Vector2();

	var panStart = new THREE.Vector2();
	var panEnd = new THREE.Vector2();
	var panDelta = new THREE.Vector2();

	var dollyStart = new THREE.Vector2();
	var dollyEnd = new THREE.Vector2();
	var dollyDelta = new THREE.Vector2();

	function getAutoRotationAngle() {

		return 2 * Math.PI / 60 / 60 * scope.autoRotateSpeed;

	}

	function getZoomScale() {

		return Math.pow( 0.95, scope.zoomSpeed );

	}

	function rotateLeft( angle ) {

		sphericalDelta.theta -= angle;

	}

	function rotateUp( angle ) {

		sphericalDelta.phi -= angle;

	}

	var panLeft = function () {

		var v = new THREE.Vector3();

		return function panLeft( distance, objectMatrix ) {

			v.setFromMatrixColumn( objectMatrix, 0 ); // get X column of objectMatrix
			v.multiplyScalar( - distance );

			panOffset.add( v );

		};

	}();

	var panUp = function () {

		var v = new THREE.Vector3();

		return function panUp( distance, objectMatrix ) {

			v.setFromMatrixColumn( objectMatrix, 1 ); // get Y column of objectMatrix
			v.multiplyScalar( distance );

			panOffset.add( v );

		};

	}();

	// deltaX and deltaY are in pixels; right and down are positive
	var pan = function () {

		var offset = new THREE.Vector3();

		return function pan( deltaX, deltaY ) {

			var element = scope.domElement === document ? scope.domElement.body : scope.domElement;

			if ( scope.object instanceof THREE.PerspectiveCamera ) {

				// perspective
				var position = scope.object.position;
				offset.copy( position ).sub( scope.target );
				var targetDistance = offset.length();

				// half of the fov is center to top of screen
				targetDistance *= Math.tan( ( scope.object.fov / 2 ) * Math.PI / 180.0 );

				// we actually don't use screenWidth, since perspective camera is fixed to screen height
				panLeft( 2 * deltaX * targetDistance / element.clientHeight, scope.object.matrix );
				panUp( 2 * deltaY * targetDistance / element.clientHeight, scope.object.matrix );

			} else if ( scope.object instanceof THREE.OrthographicCamera ) {

				// orthographic
				panLeft( deltaX * ( scope.object.right - scope.object.left ) / scope.object.zoom / element.clientWidth, scope.object.matrix );
				panUp( deltaY * ( scope.object.top - scope.object.bottom ) / scope.object.zoom / element.clientHeight, scope.object.matrix );

			} else {

				// camera neither orthographic nor perspective
				console.warn( 'WARNING: OrbitControls.js encountered an unknown camera type - pan disabled.' );
				scope.enablePan = false;

			}

		};

	}();

	function dollyIn( dollyScale ) {

		if ( scope.object instanceof THREE.PerspectiveCamera ) {

			scale /= dollyScale;

		} else if ( scope.object instanceof THREE.OrthographicCamera ) {

			scope.object.zoom = Math.max( scope.minZoom, Math.min( scope.maxZoom, scope.object.zoom * dollyScale ) );
			scope.object.updateProjectionMatrix();
			zoomChanged = true;

		} else {

			console.warn( 'WARNING: OrbitControls.js encountered an unknown camera type - dolly/zoom disabled.' );
			scope.enableZoom = false;

		}

	}

	function dollyOut( dollyScale ) {

		if ( scope.object instanceof THREE.PerspectiveCamera ) {

			scale *= dollyScale;

		} else if ( scope.object instanceof THREE.OrthographicCamera ) {

			scope.object.zoom = Math.max( scope.minZoom, Math.min( scope.maxZoom, scope.object.zoom / dollyScale ) );
			scope.object.updateProjectionMatrix();
			zoomChanged = true;

		} else {

			console.warn( 'WARNING: OrbitControls.js encountered an unknown camera type - dolly/zoom disabled.' );
			scope.enableZoom = false;

		}

	}

	//
	// event callbacks - update the object state
	//

	function handleMouseDownRotate( event ) {

		//console.log( 'handleMouseDownRotate' );

		rotateStart.set( event.clientX, event.clientY );

	}

	function handleMouseDownDolly( event ) {

		//console.log( 'handleMouseDownDolly' );

		dollyStart.set( event.clientX, event.clientY );

	}

	function handleMouseDownPan( event ) {

		//console.log( 'handleMouseDownPan' );

		panStart.set( event.clientX, event.clientY );

	}

	function handleMouseMoveRotate( event ) {

		//console.log( 'handleMouseMoveRotate' );

		rotateEnd.set( event.clientX, event.clientY );
		rotateDelta.subVectors( rotateEnd, rotateStart );

		var element = scope.domElement === document ? scope.domElement.body : scope.domElement;

		// rotating across whole screen goes 360 degrees around
		rotateLeft( 2 * Math.PI * rotateDelta.x / element.clientWidth * scope.rotateSpeed );

		// rotating up and down along whole screen attempts to go 360, but limited to 180
		rotateUp( 2 * Math.PI * rotateDelta.y / element.clientHeight * scope.rotateSpeed );

		rotateStart.copy( rotateEnd );

		scope.update();

	}

	function handleMouseMoveDolly( event ) {

		//console.log( 'handleMouseMoveDolly' );

		dollyEnd.set( event.clientX, event.clientY );

		dollyDelta.subVectors( dollyEnd, dollyStart );

		if ( dollyDelta.y > 0 ) {

			dollyIn( getZoomScale() );

		} else if ( dollyDelta.y < 0 ) {

			dollyOut( getZoomScale() );

		}

		dollyStart.copy( dollyEnd );

		scope.update();

	}

	function handleMouseMovePan( event ) {

		//console.log( 'handleMouseMovePan' );

		panEnd.set( event.clientX, event.clientY );

		panDelta.subVectors( panEnd, panStart );

		pan( panDelta.x, panDelta.y );

		panStart.copy( panEnd );

		scope.update();

	}

	function handleMouseUp( event ) {

		// console.log( 'handleMouseUp' );

	}

	function handleMouseWheel( event ) {

		// console.log( 'handleMouseWheel' );

		if ( event.deltaY < 0 ) {

			dollyOut( getZoomScale() );

		} else if ( event.deltaY > 0 ) {

			dollyIn( getZoomScale() );

		}

		scope.update();

	}

	function handleKeyDown( event ) {

		//console.log( 'handleKeyDown' );

		switch ( event.keyCode ) {

			case scope.keys.UP:
				pan( 0, scope.keyPanSpeed );
				scope.update();
				break;

			case scope.keys.BOTTOM:
				pan( 0, - scope.keyPanSpeed );
				scope.update();
				break;

			case scope.keys.LEFT:
				pan( scope.keyPanSpeed, 0 );
				scope.update();
				break;

			case scope.keys.RIGHT:
				pan( - scope.keyPanSpeed, 0 );
				scope.update();
				break;

		}

	}

	function handleTouchStartRotate( event ) {

		//console.log( 'handleTouchStartRotate' );

		rotateStart.set( event.touches[ 0 ].pageX, event.touches[ 0 ].pageY );

	}

	function handleTouchStartDolly( event ) {

		//console.log( 'handleTouchStartDolly' );

		var dx = event.touches[ 0 ].pageX - event.touches[ 1 ].pageX;
		var dy = event.touches[ 0 ].pageY - event.touches[ 1 ].pageY;

		var distance = Math.sqrt( dx * dx + dy * dy );

		dollyStart.set( 0, distance );

	}

	function handleTouchStartPan( event ) {

		//console.log( 'handleTouchStartPan' );

		panStart.set( event.touches[ 0 ].pageX, event.touches[ 0 ].pageY );

	}

	function handleTouchMoveRotate( event ) {

		//console.log( 'handleTouchMoveRotate' );

		rotateEnd.set( event.touches[ 0 ].pageX, event.touches[ 0 ].pageY );
		rotateDelta.subVectors( rotateEnd, rotateStart );

		var element = scope.domElement === document ? scope.domElement.body : scope.domElement;

		// rotating across whole screen goes 360 degrees around
		rotateLeft( 2 * Math.PI * rotateDelta.x / element.clientWidth * scope.rotateSpeed );

		// rotating up and down along whole screen attempts to go 360, but limited to 180
		rotateUp( 2 * Math.PI * rotateDelta.y / element.clientHeight * scope.rotateSpeed );

		rotateStart.copy( rotateEnd );

		scope.update();

	}

	function handleTouchMoveDolly( event ) {

		//console.log( 'handleTouchMoveDolly' );

		var dx = event.touches[ 0 ].pageX - event.touches[ 1 ].pageX;
		var dy = event.touches[ 0 ].pageY - event.touches[ 1 ].pageY;

		var distance = Math.sqrt( dx * dx + dy * dy );

		dollyEnd.set( 0, distance );

		dollyDelta.subVectors( dollyEnd, dollyStart );

		if ( dollyDelta.y > 0 ) {

			dollyOut( getZoomScale() );

		} else if ( dollyDelta.y < 0 ) {

			dollyIn( getZoomScale() );

		}

		dollyStart.copy( dollyEnd );

		scope.update();

	}

	function handleTouchMovePan( event ) {

		//console.log( 'handleTouchMovePan' );

		panEnd.set( event.touches[ 0 ].pageX, event.touches[ 0 ].pageY );

		panDelta.subVectors( panEnd, panStart );

		pan( panDelta.x, panDelta.y );

		panStart.copy( panEnd );

		scope.update();

	}

	function handleTouchEnd( event ) {

		//console.log( 'handleTouchEnd' );

	}

	//
	// event handlers - FSM: listen for events and reset state
	//

	function onMouseDown( event ) {

		if ( scope.enabled === false ) return;

		event.preventDefault();

		if ( event.button === scope.mouseButtons.ORBIT ) {

			if ( scope.enableRotate === false ) return;

			handleMouseDownRotate( event );

			state = STATE.ROTATE;

		} else if ( event.button === scope.mouseButtons.ZOOM ) {

			if ( scope.enableZoom === false ) return;

			handleMouseDownDolly( event );

			state = STATE.DOLLY;

		} else if ( event.button === scope.mouseButtons.PAN ) {

			if ( scope.enablePan === false ) return;

			handleMouseDownPan( event );

			state = STATE.PAN;

		}

		if ( state !== STATE.NONE ) {

			document.addEventListener( 'mousemove', onMouseMove, false );
			document.addEventListener( 'mouseup', onMouseUp, false );

			scope.dispatchEvent( startEvent );

		}

	}

	function onMouseMove( event ) {

		if ( scope.enabled === false ) return;

		event.preventDefault();

		if ( state === STATE.ROTATE ) {

			if ( scope.enableRotate === false ) return;

			handleMouseMoveRotate( event );

		} else if ( state === STATE.DOLLY ) {

			if ( scope.enableZoom === false ) return;

			handleMouseMoveDolly( event );

		} else if ( state === STATE.PAN ) {

			if ( scope.enablePan === false ) return;

			handleMouseMovePan( event );

		}

	}

	function onMouseUp( event ) {

		if ( scope.enabled === false ) return;

		handleMouseUp( event );

		document.removeEventListener( 'mousemove', onMouseMove, false );
		document.removeEventListener( 'mouseup', onMouseUp, false );

		scope.dispatchEvent( endEvent );

		state = STATE.NONE;

	}

	function onMouseWheel( event ) {

		if ( scope.enabled === false || scope.enableZoom === false || ( state !== STATE.NONE && state !== STATE.ROTATE ) ) return;

		event.preventDefault();
		event.stopPropagation();

		handleMouseWheel( event );

		scope.dispatchEvent( startEvent ); // not sure why these are here...
		scope.dispatchEvent( endEvent );

	}

	function onKeyDown( event ) {

		if ( scope.enabled === false || scope.enableKeys === false || scope.enablePan === false ) return;

		handleKeyDown( event );

	}

	function onTouchStart( event ) {

		if ( scope.enabled === false ) return;

		switch ( event.touches.length ) {

			case 1:	// one-fingered touch: rotate

				if ( scope.enableRotate === false ) return;

				handleTouchStartRotate( event );

				state = STATE.TOUCH_ROTATE;

				break;

			case 2:	// two-fingered touch: dolly

				if ( scope.enableZoom === false ) return;

				handleTouchStartDolly( event );

				state = STATE.TOUCH_DOLLY;

				break;

			case 3: // three-fingered touch: pan

				if ( scope.enablePan === false ) return;

				handleTouchStartPan( event );

				state = STATE.TOUCH_PAN;

				break;

			default:

				state = STATE.NONE;

		}

		if ( state !== STATE.NONE ) {

			scope.dispatchEvent( startEvent );

		}

	}

	function onTouchMove( event ) {

		if ( scope.enabled === false ) return;

		event.preventDefault();
		event.stopPropagation();

		switch ( event.touches.length ) {

			case 1: // one-fingered touch: rotate

				if ( scope.enableRotate === false ) return;
				if ( state !== STATE.TOUCH_ROTATE ) return; // is this needed?...

				handleTouchMoveRotate( event );

				break;

			case 2: // two-fingered touch: dolly

				if ( scope.enableZoom === false ) return;
				if ( state !== STATE.TOUCH_DOLLY ) return; // is this needed?...

				handleTouchMoveDolly( event );

				break;

			case 3: // three-fingered touch: pan

				if ( scope.enablePan === false ) return;
				if ( state !== STATE.TOUCH_PAN ) return; // is this needed?...

				handleTouchMovePan( event );

				break;

			default:

				state = STATE.NONE;

		}

	}

	function onTouchEnd( event ) {

		if ( scope.enabled === false ) return;

		handleTouchEnd( event );

		scope.dispatchEvent( endEvent );

		state = STATE.NONE;

	}

	function onContextMenu( event ) {

		event.preventDefault();

	}

	//

	scope.domElement.addEventListener( 'contextmenu', onContextMenu, false );

	scope.domElement.addEventListener( 'mousedown', onMouseDown, false );
	scope.domElement.addEventListener( 'wheel', onMouseWheel, false );

	scope.domElement.addEventListener( 'touchstart', onTouchStart, false );
	scope.domElement.addEventListener( 'touchend', onTouchEnd, false );
	scope.domElement.addEventListener( 'touchmove', onTouchMove, false );

	window.addEventListener( 'keydown', onKeyDown, false );

	// force an update at start

	this.update();

};

THREE.OrbitControls.prototype = Object.create( THREE.EventDispatcher.prototype );
THREE.OrbitControls.prototype.constructor = THREE.OrbitControls;

Object.defineProperties( THREE.OrbitControls.prototype, {

	center: {

		get: function () {

			console.warn( 'THREE.OrbitControls: .center has been renamed to .target' );
			return this.target;

		}

	},

	// backward compatibility

	noZoom: {

		get: function () {

			console.warn( 'THREE.OrbitControls: .noZoom has been deprecated. Use .enableZoom instead.' );
			return ! this.enableZoom;

		},

		set: function ( value ) {

			console.warn( 'THREE.OrbitControls: .noZoom has been deprecated. Use .enableZoom instead.' );
			this.enableZoom = ! value;

		}

	},

	noRotate: {

		get: function () {

			console.warn( 'THREE.OrbitControls: .noRotate has been deprecated. Use .enableRotate instead.' );
			return ! this.enableRotate;

		},

		set: function ( value ) {

			console.warn( 'THREE.OrbitControls: .noRotate has been deprecated. Use .enableRotate instead.' );
			this.enableRotate = ! value;

		}

	},

	noPan: {

		get: function () {

			console.warn( 'THREE.OrbitControls: .noPan has been deprecated. Use .enablePan instead.' );
			return ! this.enablePan;

		},

		set: function ( value ) {

			console.warn( 'THREE.OrbitControls: .noPan has been deprecated. Use .enablePan instead.' );
			this.enablePan = ! value;

		}

	},

	noKeys: {
		get: function () {
			console.warn( 'THREE.OrbitControls: .noKeys has been deprecated. Use .enableKeys instead.' );
			return ! this.enableKeys;
		},
		set: function ( value ) {
			console.warn( 'THREE.OrbitControls: .noKeys has been deprecated. Use .enableKeys instead.' );
			this.enableKeys = ! value;
		}

	},

	staticMoving: {

		get: function () {
			console.warn( 'THREE.OrbitControls: .staticMoving has been deprecated. Use .enableDamping instead.' );
			return ! this.enableDamping;
		},

		set: function ( value ) {

			console.warn( 'THREE.OrbitControls: .staticMoving has been deprecated. Use .enableDamping instead.' );
			this.enableDamping = ! value;

		}

	},

	dynamicDampingFactor: {

		get: function () {

			console.warn( 'THREE.OrbitControls: .dynamicDampingFactor has been renamed. Use .dampingFactor instead.' );
			return this.dampingFactor;

		},
		set: function ( value ) {

			console.warn( 'THREE.OrbitControls: .dynamicDampingFactor has been renamed. Use .dampingFactor instead.' );
			this.dampingFactor = value;
		}
	}
} );

var windowW = window.innerWidth, windowH = Math.max(600, window.innerHeight);
var body = document.body;
body.classList.add("color");

window.onload = function(){
  var webgl = new Webgl();
  var audio = new Audio(webgl);
}

class Audio{
  constructor(_webgl){
    this.webgl = _webgl;
    this.source;
    this.audioContext = (window.AudioContext) ? new AudioContext : new webkitAudioContext;
    this.fileReader  = new FileReader;
    this.init();
    this.isReady = false;
    this.count = 0;
    this.render();
  }
  
  init(){
    this.analyser = this.audioContext.createAnalyser();
    this.analyser.fftSize = 2048;
    this.analyser.minDecibels = -70;
    this.analyser.maxDecibels = 10;
    this.analyser.smoothingTimeConstant = .75;
    
    document.getElementById('file').addEventListener('change', function(e){
      this.fileReader.readAsArrayBuffer(e.target.files[0]);
    }.bind(this));
    
    var _this = this;
    
    this.fileReader.onload = function(){
      _this.audioContext.decodeAudioData(_this.fileReader.result, function(buffer){
        if(_this.source) {
          _this.source.stop();
        }
        _this.source = _this.audioContext.createBufferSource();
        _this.source.buffer = buffer;
        
        _this.source.loop = true;

        _this.source.connect(_this.analyser);

        _this.gainNode = _this.audioContext.createGain();

        _this.source.connect(_this.gainNode);
        _this.gainNode.connect(_this.audioContext.destination);
        _this.source.start(0);
        
        _this.frequencyArray = _this.webgl.sphereG.attributes.aFrequency.array;
        _this.indexPosArray = _this.webgl.indexPosArray;
        _this.indexPosLength = _this.webgl.indexPosArray.length;
        _this.isReady = true;
      });
    };
  }
  
  _render(){
    if(!this.isReady) return;
    this.count++;
    
    this.spectrums = new Uint8Array(this.analyser.frequencyBinCount);
    this.analyser.getByteFrequencyData(this.spectrums);
    
    var num, mult, frequency, maxNum = 255, frequencyAvg = 0;
    
    for(var i = 0; i < this.indexPosLength; i++){
      mult = Math.floor(i / maxNum);
      
      if(mult % 2 === 0){
        num = i - maxNum * mult;
      } else {
        num = maxNum - (i - maxNum * mult);
      }
      
      var spectrum = (num > 150) ? 0 : this.spectrums[num + 20];
      frequencyAvg += spectrum * 1.2;

        var indexPos = this.indexPosArray[i];
        spectrum = Math.max(0, spectrum - i/80);
        
        for(var j = 0, len = indexPos.length; j < len; j++){
          var vectorNum = indexPos[j];
          this.frequencyArray[vectorNum] = spectrum;
        }
    }
    
    frequencyAvg /= this.indexPosLength;
    frequencyAvg*= 1.7;
    this.webgl.sphereM.uniforms["uScale"].value = this.webgl.sphereM_2.uniforms["uScale"].value = frequencyAvg * 1.7;
    this.webgl.sphereM.uniforms["uTime"].value += 0.015;
    
    this.webgl.mesh_2.scale.x = 1 + frequencyAvg / 290;
    this.webgl.mesh_2.scale.y = 1 + frequencyAvg / 290;
    this.webgl.mesh_2.scale.z = 1 + frequencyAvg / 290;
    
  }
  
  render(){
    this._render();
    this.webgl.render();
    requestAnimationFrame(this.render.bind(this))
  }
}

class Webgl{
  constructor(){
    this.scene = new THREE.Scene();
    this.camera = new THREE.PerspectiveCamera(45, windowW / windowH, 0.1, 10000);
    this.camera.position.set(0, 200, -100);
    this.camera.lookAt(this.scene.position);
    this.renderer = new THREE.WebGLRenderer({
      antialias: true,
      alpha: true
    });
    
    this.renderer.setPixelRatio(1.5);
    
    this.renderer.setClearColor(0x20c5d4, 0);
    this.renderer.setSize(windowW, windowH);
    var div = document.getElementById("wrapper");
    div.appendChild(this.renderer.domElement);
    div.style.width = windowW + "px";
    div.style.height = window.innerHeight + "px";
    
    this.renderer.domElement.style.width = windowW + "px";
    this.renderer.domElement.style.height = windowH + "px";
    
    
    
    var orbit = new THREE.OrbitControls(this.camera, this.renderer.domElement);
    this.windowW = windowW;
    this.windowH = window.innerHeight;
    
    this.mouse = {
      x: 0,
      y: 0,
      old_x: 0,
      old_y : 0
    }
    
//     document.addEventListener( 'mousemove', function(event){
//       this.mouse.old_x = this.mouse.x;
//       this.mouse.old_y = this.mouse.y;
      
//       this.mouse.x = event.clientX - this.windowW / 2;
//       this.mouse.y = event.clientY - this.windowH / 2;
//     }.bind(this), false );
    
    window.onresize = function() {
      this.windowW = document.body.clientWidth;
      this.windowH = window.innerHeight;
      var _height = Math.max(600, this.windowH);
      this.renderer.setSize(this.windowW, _height);
      this.camera.aspect = this.windowW / _height;
      this.camera.updateProjectionMatrix();
      
      div.style.width = this.windowW + "px";
      div.style.height = window.innerHeight + "px";
      
    }.bind(this);
    
    this.createSphere();
    
    
  }
  
  
  
  createSphere(){
    this.createShader();
    
    this.sphereG = new THREE.IcosahedronBufferGeometry(40, 4);
    this.sphereM = new THREE.ShaderMaterial({
      vertexShader: this.vertex,
      fragmentShader: this.fragment,
      uniforms: {
        uTime: {type: "f", value: 0},
        uScale: {type: "f", value: 0},
        isBlack : {type: "i", value: 1}
        
      },
      wireframe: true,
      transparent: true
    });
    
    
    this.detectIndex();
    this.sphereG.addAttribute("aFrequency", new THREE.BufferAttribute(new Float32Array(this.indexArray.length), 1));
    
    this.mesh = new THREE.Mesh(this.sphereG, this.sphereM);
    
    this.scene.add(this.mesh);
    
    this.createSphere2();
  }
  
  
  createSphere2(){
    this.sphereG_2 = new THREE.IcosahedronBufferGeometry(39.5, 4);
    this.sphereG_2.addAttribute("aFrequency", new THREE.BufferAttribute(new Float32Array(this.indexArray.length), 1));
    this.sphereM_2 =  new THREE.ShaderMaterial({
      vertexShader: this.vertex_2,
      fragmentShader: this.fragment_2,
      uniforms: {
        uScale: {type: "f", value: 0},
        isBlack: {type: "i", value: 1}
      },

      shading: THREE.FlatShading
    });
    
    this.mesh_2 = new THREE.Mesh(this.sphereG_2, this.sphereM_2);
    this.scene.add(this.mesh_2);
  }
  
  
  detectIndex(){
    this.verticesArray = this.sphereG.attributes.position.array;
    var arrayLength = this.verticesArray.length;
    
    this.vecCount = 0;
    this.indexCount = 0;
    this.vec3Array = [];
    this.allVec3Array = [];
    this.indexArray = [];
    this.indexPosArray = []; 
    this.frequencyNumArray = [];
    
    for(var i = 0; i < arrayLength; i+= 3){
      var vec3 = {};
      vec3.x = this.verticesArray[i];
      vec3.y = this.verticesArray[i + 1];
      vec3.z = this.verticesArray[i + 2];
      var detect = this.detectVec(vec3);
      this.allVec3Array.push(vec3);
      
      if(detect === 0 || detect > 0){
        this.indexArray[this.indexCount] = detect;
        this.indexPosArray[detect].push(this.indexCount);
        
      } else {
        this.vec3Array[this.vecCount] = vec3;
        this.indexArray[this.indexCount] = this.vecCount;
        
        this.indexPosArray[this.vecCount] = [];
        this.indexPosArray[this.vecCount].push(this.indexCount);
        
        this.vecCount++;
        
      }

      this.indexCount++;
    }
  }
  
  
  detectVec(vec3){
    if(this.vecCount === 0) return false;
  
    for(var i = 0, len = this.vec3Array.length; i < len; i++){
      var _vec3 = this.vec3Array[i];
      var isExisted = vec3.x === _vec3.x && vec3.y === _vec3.y && vec3.z === _vec3.z;
      if(isExisted) {
        return i;
      }
    }

    return false;
  }
  
  createShader(){
    this.vertex = [
      "uniform float uTime;",
      "uniform float uScale;",
      
      "attribute float aFrequency;",
      "varying float vFrequency;",
      "varying float vResolution;",
      
      
      "const float frequencyNum = 256.0;",
      "const float radius = 40.0;",
      "const float PI = 3.14159265;",
      "const float _sin15 = sin(PI / 10.0);",
      "const float _cos15 = cos(PI / 10.0);",
      
      "void main(){",
      
      "float frequency;",
      "float SquareF = aFrequency * aFrequency;",
      
      "frequency = smoothstep(16.0, 7200.0, SquareF) * SquareF / (frequencyNum * frequencyNum);",
      
      "vFrequency = frequency;",
      
      "float _uScale = (1.0 - uScale * 0.5 / frequencyNum) * 3.0;",
      
      "float _sin = sin(uTime * .5);",
      "float _cos = cos(uTime * .5);",
      
      
      "mat2 rot = mat2(_cos, -_sin, _sin, _cos);",
      "mat2 rot15 = mat2(_cos15, -_sin15, _sin15, _cos15);",
      
      "vec2 _pos = rot * position.xz;",
      "vec3 newPos = vec3(_pos.x, position.y, _pos.y);",
      "newPos.xy = rot15 * newPos.xy;",
      
      "newPos = (1.0 + uScale / (frequencyNum * 2.0) ) * newPos;",
      
      "vResolution = (newPos.x + newPos.y + newPos.z) / (3.0 * 120.0);",
      
      
      "gl_Position = projectionMatrix * modelViewMatrix * vec4(newPos + vFrequency * newPos * _uScale, 1.0);",
      "}"
    ].join("\n");
    
    this.fragment = [
      "uniform float uTime;",
      "uniform float uScale;",
      
      "uniform int isBlack;",
      
      "varying float vFrequency;",
      "varying float vResolution;",
      
      "const float frequencyNum = 256.0;",
      
      "void main(){",
      "float f = smoothstep(0.0, 0.00002, vFrequency * vFrequency) * vFrequency;",
      "float red = min(1.0, 0.95 + f * 1.9);",
      "float green = min(1.0, 0.25 + f * 3.6);",
      "float blue = min(1.0, 0.3 + f* 0.01);",
      "float sum = red + blue + green;",

      "blue = min(1.0, blue + 0.3);",
      "green = max(0.0, green - 0.1);",
      
      "float offsetSum = (sum - (red + blue + green) / 3.0) / 3.0;",
      
      "blue += offsetSum + min(vResolution * 2.0, -0.2);",
      "red += offsetSum + min(vResolution * 0.5, 0.2);",
      "green += offsetSum - vResolution * max(0.3, vFrequency * 2.0);",
      
      "vec3 color;",
      "if(isBlack > 0){",
      "color = vec3(red, green, blue);",
      "} else {",
      "color = vec3((red + green + blue) * (red + green + blue) * (red + green + blue)/ 27.0);",
      " }",
      
      // "float _uScale = uScale / (frequencyNum * 8.0);",
      
      
      
      "gl_FragColor = vec4(color, 1.0);",
      "}"
    ].join("\n");
    
    //color: 0xff6673,
    this.vertex_2 = [
      "varying vec3 vPosition;",
      
      "void main(){",
      "vPosition = position;",
      "gl_Position =projectionMatrix * modelViewMatrix * vec4(position, 1.0);", 
      "}"
    ].join("\n");
    this.fragment_2 = [
      "uniform float uScale;",
      "uniform int isBlack;",
      
      
      "varying vec3 vPosition;",
      "const float frequencyNum = 256.0;",
      
      "const float radius = 40.0;",
      "const vec3 color = vec3(1.0, 102.0 / 255.0, 115.0 / 255.0);",
      
      "void main(){",
      "vec3 pos = vec3(vPosition.x, -vPosition.y, vPosition.z);",
      "vec3 resolut = pos / (radius * 10.0) + 0.05;",
      
      "vec3 _color;",
      "if(isBlack < 0){",
      "_color = vec3(0.0);",
      "} else {",
      "_color = color + resolut;",
      "}",
      
      // "float _uScale = uScale / (frequencyNum * 5.0);",
      
      "gl_FragColor = vec4(_color, 1.0);",
      "}"
      
    ].join("\n")
  }
  
  render(){
    this.sphereG.attributes.aFrequency.needsUpdate = true;
    // var d = this.mouse.x - this.mouse.old_x;
    // var theta = d * 0.1;
    // var sin = Math.sin(theta);
    // var cos = Math.cos(theta);
    
    // var x = this.camera.position.x;
    // var z = this.camera.position.z;
    
    
    // this.camera.position.x = x * cos - z * sin;
   //  this.camera.position.z = x * sin + z * cos;

    // this.camera.lookAt( this.scene.position );
    
    this.renderer.render(this.scene, this.camera);
  }
}
</script>
</body>
</html>