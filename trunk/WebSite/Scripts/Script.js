var AjaxConst = { };
AjaxConst.GetRequest = 'GET';
AjaxConst.PostRequest = 'POST';

function callAjaxHandler(divId, url, entryData, requestType, successCallBack) {
    var divLoading = $('#' + divId);
    var isDisplayed = divLoading.css('display') == 'none';
    if (isDisplayed)
        divLoading.css('display', 'block');
    divLoading.html('<div id="loading-center-helper"></div><div id="loading-center" style="display: block"></div>');
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
                if (isDisplayed) {
                    divLoading.css('display', 'none');
                } else {
                    divLoading.empty();
                }
                if (data.error == "error") {
                    var datetimeNow = new Date();
                    var formattedDate = datetimeNow.getDate() + "/" + (datetimeNow.getMonth() + 1) + "/" + datetimeNow.getFullYear() + " " + datetimeNow.getHours() + ":" + datetimeNow.getMinutes() + ":" + datetimeNow.getSeconds();
                    alert("errorMessage: " + formattedDate);
                    //if (typeof (errorCallBack) === 'function') {
                    //    errorCallBack(data);
                    //}
                } else if (data.error == "timeout") {
                    alert("Timeout");
                }
                return;
            }
            if (isDisplayed)
                divLoading.css('display', 'none');
            successCallBack(data);
        },
        error: function (xhr, status, error) {
            if (isDisplayed)
                divLoading.css('display', 'none');
            else {
                divLoading.empty();
            }
            if (error.length == 0)
                return;
            if (error === 'timeout')
                alert("msgAjaxTimeout");
            else
                alert("unknownErrorMessage");
        }
    });
}

$(document).ready(function() {
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

function ShowPopupTemplate(w, h, title, divContainer, divTemplate) {
    var wnd;
    var container = "#" + divContainer;
    var template = "#" + divTemplate;
    h = h > 0 ? h : "auto";
    if (wnd) wnd.refresh();
    wnd = $(container).kendoWindow({
        modal: true,
        visible: false,
        resizable: false,
        close: function (e) {
            $(this.element).empty();
        },
        actions: ["Close"],
        width: w,
        height: h,
    }).data("kendoWindow");
    wnd.title(title);
    var detailsTemplate = kendo.template($(template).html());
    wnd.content(detailsTemplate);
    wnd.center().open();
    $(".k-window-action").removeClass("k-window-action").addClass("k-link-wnd");
    $("a.k-link-wnd").click(function () {
        ClosePopup(wnd);
    });
    return wnd;
}

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

function bindTemplate(elmId, templateId, dataSource) {
    elmId = '#' + elmId;
    templateId = '#' + templateId;
    if ($(elmId) == null || $(templateId) == null)
        return;
    var template = kendo.template($(templateId).html());
    $(elmId).html(template(dataSource));
}

function dropdownBinding(data, ddl, textfield, valuefield) {
    var dropdown = "#" + ddl;
    $(dropdown).kendoDropDownList({
        dataTextField: textfield,
        dataValueField: valuefield,
        dataSource: data
    });
}

function dropdownSeletedValue(ddl, value) {
    var dropdown = "#" + ddl;
    var dropdownlist = $(dropdown).data("kendoDropDownList");
    dropdownlist.value(value);
}