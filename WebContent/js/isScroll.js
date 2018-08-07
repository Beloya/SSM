/*
*v:1000
*t:Created by 2018/4/15 
*e:910547462@qq.com
*/
/*滚动添加css*/
var isScroll = {
    /*初始化*/
    init: function (_el) {
        this.start(_el);
        $(window).on('scroll', function () {
            isScroll.start(_el)
        });
    },
    /*开始*/
    start: function (_el) {
        var self = this;
        $(_el).each(function () {
            var _self = $(this);
            /*滚动高度*/
            var isScrollTop = $(window).scrollTop();
            /*滚动视度*/
            var isWindowHeiget = $(window).height() * 0.8;
            /**/
            var _class = $(this).data('animation');
            if (isScrollTop + isWindowHeiget > $(this).offset().top) {
                _self.addClass(_class);
            }
        });
    }
}