<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebSite.Contact" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContainer" runat="server">
    <div class="container_12 primary_content_wrap clearfix">
        <div id="content">
            <div id="post-14" class="post-14 page type-page status-publish hentry page">
                <div class="grid_8 ">
                    <h2>Contact information</h2>
                    <div class="google-map">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.8736005821547!2d105.82702340000003!3d20.9977033!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ac8871297549%3A0xb2a892bf045f4851!2zNjQgTmd1eeG7hW4gVmnhur90IFh1w6JuLCBLaMawxqFuZyBNYWksIFRoYW5oIFh1w6JuLCBIw6AgTuG7mWksIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1405071611175" width="600" height="450" frameborder="0" style="border: 0"></iframe>
                    </div>
                    <%--<h5>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore.</h5>
                <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque la udantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia.</p>
                <dl class="address">
                    <dt>The Company Name Inc.<br>
                        9870 St Vincent Place,<br>
                        Glasgow, DC 45 Fr 45.</dt>
                    <dd>
                        <ul>
                            <li><span>Telephone:</span>+1 800 603 6035</li>
                            <li><span>FAX:</span>+1 800 889 9898</li>
                            <li>E-mail: <a href="#">mail@demolink.org<script type="text/javascript">
                                                                         /* <![CDATA[ */
                                                                         (function () { try { var s, a, i, j, r, c, l, b = document.getElementsByTagName("script"); l = b[b.length - 1].previousSibling; a = l.getAttribute('data-cfemail'); if (a) { s = ''; r = parseInt(a.substr(0, 2), 16); for (j = 2; a.length - j; j += 2) { c = parseInt(a.substr(j, 2), 16) ^ r; s += String.fromCharCode(c); } s = document.createTextNode(s); l.parentNode.replaceChild(s, l); } } catch (e) { } })();
                                                                         /* ]]> */
                            </script></a></li>
                        </ul>
                    </dd>
                </dl>--%>
                </div>
                <div class="grid_4 ">
                    <h2>Contact form</h2>

                    <p class="field">
                        <input type="text" name="your-name" value="" placeholder="your-name" size="40">
                    </p>
                    <p class="field">
                        <input type="text" name="your-email" value="" placeholder="your-email" size="40">
                    </p>
                    <%--<p class="field">
                            <input type="text" name="your-phone" value="" placeholder="your-phone" size="40" >
                        </p>--%>
                    <p class="field">
                        <textarea name="your-message" placeholder="your-message" cols="42" rows="10"></textarea>
                    </p>
                    <p class="submit-wrap">
                        <input type="reset" value="clear" /><input type="submit" value="send" />
                    </p>

                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        jQuery(function () {
            $('.sf-menu #menu-item-6').addClass('current_page_item');
        });
    </script>
</asp:Content>

<%--
<div id='cssmenu'>
<ul>
   <li class='has-sub'><a href='#'><span>Biệt thự</span></a>
      <ul>
         <li><a href='#'><span>Hiện đại</span></a></li>
         <li><a href='#'><span>Cổ điển</span></a></li>
         <li class='last'><a href='#'><span>Khác</span></a></li>
      </ul>
   </li>
   <li class='has-sub last'><a href='#'><span>Nhà lô</span></a>
      <ul>
         <li><a href='#'><span>Hiện đại</span></a></li>
         <li><a href='#'><span>Cổ điển</span></a></li>
         <li class='last'><a href='#'><span>Khác</span></a></li>
      </ul>
   </li>
</ul>
</div>
--%>


<%--$(document).ready(function(){

$('#cssmenu > ul > li ul').each(function(index, e){
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
  if((checkElement.is('ul')) && (checkElement.is(':visible'))) {
    $(this).closest('li').removeClass('active');
    checkElement.slideUp('normal');
  }
  if((checkElement.is('ul')) && (!checkElement.is(':visible'))) {
    $('#cssmenu ul ul:visible').slideUp('normal');
    checkElement.slideDown('normal');
  }
  if($(this).closest('li').find('ul').children().length == 0) {
    return true;
  } else {
    return false;	
  }		
});

});--%>
