var AjaxConst = { };
AjaxConst.GetRequest = 'GET';
AjaxConst.PostRequest = 'POST';

function callAjaxHandler(url, entryData, requestType, successCallBack) {
    $.ajax({
        url: url,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        //timeout: 20000,
        data: entryData,
        async: true,
        cache: false,
        type: requestType,
        responseType: "json",
        success: function(data) {
            if (data == null)
                return;
            if (data.error != null) {
                return;
            }
            successCallBack(data);
        },
        error: function(xhr, status, error) {
            if (error.length == 0)
                return;
            if (error === 'timeout')
                alert("msgAjaxTimeout");
        }
    });
}

$(document).ready(function() {
    $('#cssmenu > ul > li ul').each(function(index, e) {
        var count = $(e).find('li').length;
        var content = '<span class="cnt">' + count + '</span>';
        $(e).closest('li').children('a').append(content);
    });
    $('#cssmenu ul ul li:odd').addClass('odd');
    $('#cssmenu ul ul li:even').addClass('even');
    $('#cssmenu > ul > li > a').click(function() {
        $('#cssmenu li').removeClass('active');
        $(this).closest('li').addClass('active');
        var checkElement = $(this).next();
        if ((checkElement.is('ul')) && (checkElement.is(':visible'))) {
            $(this).closest('li').removeClass('active');
            checkElement.slideUp('normal');
        }
        if ((checkElement.is('ul')) && (!checkElement.is(':visible'))) {
            $('#cssmenu ul ul:visible').slideUp('normal');
            checkElement.slideDown('normal');
        }
        if ($(this).closest('li').find('ul').children().length == 0) {
            return true;
        } else {
            return false;
        }
    });
});

function ShowPopupIframe(w, h, title, divContainer, url) {
    var wnd;
    var container = "#" + divContainer;
    h = h > 0 ? h : "auto";
    //if (wnd) wnd.refresh();
    wnd = $(container).kendoWindow({
        modal: true,
        visible: false,
        resizable: false,
        close: function(e) {
            $(this.element).empty();
        },
        actions: ["Close"],
        width: w,
        height: h,
        content: url,
        iframe: true
    }).data("kendoWindow");
    wnd.title(title);
    wnd.center().open();

    $(".k-window-action").removeClass("k-window-action").addClass("k-link-wnd");
    $("a.k-link-wnd").click(function() {
        ClosePopup(wnd);
    });
    return wnd;
}

function ClosePopup(wnd) {
    if (wnd != null) {
        wnd.close();
    }
}

function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results == null ? "0" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

function getRouteParameter(index) {
    var pathname = window.location.pathname;
    var result = pathname.split('/')[index];
    return result;
}