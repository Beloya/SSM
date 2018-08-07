layui.use(['element', 'layer', 'form', 'util', 'flow', 'layedit'], function () {
    var element = layui.element();
    var layer = layui.layer;
    var form = layui.form();
    var util = layui.util;
    var flow = layui.flow;
    var $ = layui.jquery;

    var layedit = layui.layedit;
    var editIndex = layedit.build('remarkEditor', {
        height: 150,
        tool: ['face', '|', 'left', 'center', 'right', '|', 'link'],
    }); //建立编辑器
    //工具块
    util.fixbar({
        bar1: '&#xe641;',
        click: function (type) {
            if (type === 'bar1') {
                var sear = new RegExp('layui-hide');
                if (sear.test($('.blog-share').attr('class'))) {
                    shareIn();
                } else {
                    shareOut();
                }
            }
        }
    });
    $(function () {
        playAnnouncement();
    });
    function playAnnouncement() {
        var index = 0;
        var $announcement = $('.home-tips-container>span');
        //自动轮换
        setInterval(function () {
            index++;    //下标更新
            if (index >= $announcement.length) {
                index = 0;
            }
            $announcement.eq(index).stop(true, true).fadeIn().siblings('span').fadeOut();  //下标对应的图片显示，同辈元素隐藏
        }, 5000);
    }
    //监听导航点击
    element.on('nav(nav)', function (elem) {
    });

    //Hash地址的定位
    var layid = location.hash.replace(/^#tabIndex=/, '');
    if (layid == "") {
        element.tabChange('tabAbout', 1);
    }
    element.tabChange('tabAbout', layid);

    element.on('tab(tabAbout)', function (elem) {
        location.hash = 'tabIndex=' + $(this).attr('lay-id');
    });

    //监听评论提交
    form.on('submit(formRemark)', function (data) {
        var index = layer.load(1);
        $.ajax({
            contentType: "application/json",
            type: 'post',
            async: false,
            url: '/Article/RemarkArticle',
            data: JSON.stringify(data.field),
            success: function (outResult) {
                layer.close(index);
                if (outResult.Success) {
                    layer.msg(outResult.Message, { icon: 6 });
                    location.reload(true);
                } else {
                    if (outResult.Message != undefined) {
                        layer.msg(outResult.Message, { icon: 5 });
                    } else {
                        layer.msg('程序异常，请重试或联系作者', { icon: 5 });
                    }
                }
            },
            error: function (outResult) {
                layer.close(index);
                layer.msg("请求异常", { icon: 2 });
            }
        });
        return false;
    });

    //监听搜索提交
    form.on('submit(formSearch)', function (data) {
        document.location.href = "/Article/Search?keywords=" + escape(data.field.keywords);
        return false;
    });

    //自定义验证规则
    form.verify({
        content: function (value) {
            value = $.trim(layedit.getText(editIndex));
            if (value == "") return "自少得有一个字吧";
            layedit.sync(editIndex);
        },
        replyContent: function (value) {
            if (value == "") return "自少得有一个字吧";
        }
    });

    $(".blog-user img").hover(function () {
        var tips = layer.tips('点击退出', '.blog-user', {
            tips: [3, '#009688'],
        });
    }, function () {
        layer.closeAll('tips');
    })

    $('.blog-navicon').click(function () {
        var sear = new RegExp('layui-hide');
        if (sear.test($('.blog-nav-left').attr('class'))) {
            leftIn();
        } else {
            leftOut();
        }
    });

    $('.blog-mask').click(function () {
        leftOut();
    });

    $('.blog-body,.blog-footer').click(function () {
        shareOut();
        categoryOut();
    });

    $('.category-toggle').click(function (e) {
        e.stopPropagation();
        categroyIn();
    });

    $('.article-category').click(function () {
        categoryOut();
    });

    $('.article-category > a').click(function (e) {
        e.stopPropagation();
    });

    function categroyIn() {
        $('.category-toggle').addClass('layui-hide');
        $('.article-category').unbind('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend');

        $('.article-category').removeClass('categoryOut');
        $('.article-category').addClass('categoryIn');
        $('.article-category').addClass('layui-show');
    }

    function categoryOut() {
        $('.article-category').on('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function () {
            $('.article-category').removeClass('layui-show');
            $('.category-toggle').removeClass('layui-hide');
        });

        $('.article-category').removeClass('categoryIn');
        $('.article-category').addClass('categoryOut');
    }

    function shareIn() {
        $('.blog-share').unbind('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend');
        $('.blog-share').removeClass('shareOut');
        $('.blog-share').addClass('shareIn');
        $('.blog-share').removeClass('layui-hide');
        $('.blog-share').addClass('layui-show');
    }

    function shareOut() {
        $('.blog-share').on('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function () {
            $('.blog-share').addClass('layui-hide');
        });
        $('.blog-share').removeClass('shareIn');
        $('.blog-share').addClass('shareOut');
        $('.blog-share').removeClass('layui-show');
    }

    function leftIn() {
        $('.blog-mask').unbind('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend');
        $('.blog-nav-left').unbind('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend');

        $('.blog-mask').removeClass('maskOut');
        $('.blog-mask').addClass('maskIn');
        $('.blog-mask').removeClass('layui-hide');
        $('.blog-mask').addClass('layui-show');

        $('.blog-nav-left').removeClass('leftOut');
        $('.blog-nav-left').addClass('leftIn');
        $('.blog-nav-left').removeClass('layui-hide');
        $('.blog-nav-left').addClass('layui-show');
    }

    function leftOut() {
        $('.blog-mask').on('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function () {
            $('.blog-mask').addClass('layui-hide');
        });
        $('.blog-nav-left').on('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function () {
            $('.blog-nav-left').addClass('layui-hide');
        });

        $('.blog-mask').removeClass('maskIn');
        $('.blog-mask').addClass('maskOut');
        $('.blog-mask').removeClass('layui-show');

        $('.blog-nav-left').removeClass('leftIn');
        $('.blog-nav-left').addClass('leftOut');
        $('.blog-nav-left').removeClass('layui-show');
    }
});


//百度分享插件
window._bd_share_config = {
    "common": {
        "bdSnsKey": {},
        "bdText": "",
        "bdStyle": "0",
        "bdSize": "32"
    },
    "share": {}
};
with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];



//时间格式化
Date.prototype.Format = function (formatStr) {
    var str = formatStr;
    var Week = ['日', '一', '二', '三', '四', '五', '六'];

    str = str.replace(/yyyy|YYYY/, this.getFullYear());
    str = str.replace(/yy|YY/, (this.getYear() % 100) > 9 ? (this.getYear() % 100).toString() : '0' + (this.getYear() % 100));
    str = str.replace(/MM/, (this.getMonth() + 1) > 9 ? (this.getMonth() + 1).toString() : '0' + (this.getMonth() + 1));
    str = str.replace(/M/g, (this.getMonth() + 1));

    str = str.replace(/w|W/g, Week[this.getDay()]);

    str = str.replace(/dd|DD/, this.getDate() > 9 ? this.getDate().toString() : '0' + this.getDate());
    str = str.replace(/d|D/g, this.getDate());

    str = str.replace(/hh|HH/, this.getHours() > 9 ? this.getHours().toString() : '0' + this.getHours());
    str = str.replace(/h|H/g, this.getHours());
    str = str.replace(/mm/, this.getMinutes() > 9 ? this.getMinutes().toString() : '0' + this.getMinutes());
    str = str.replace(/m/g, this.getMinutes());

    str = str.replace(/ss|SS/, this.getSeconds() > 9 ? this.getSeconds().toString() : '0' + this.getSeconds());
    str = str.replace(/s|S/g, this.getSeconds());

    return str;
}