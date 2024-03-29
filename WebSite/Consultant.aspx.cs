﻿using System;
using System.Web.UI;
using BLL;

namespace WebSite
{
    public partial class Consultant : Page
    {
        private int Id
        {
            get { return Page.RouteData.Values["id"] == null ? 0 : int.Parse(Page.RouteData.Values["id"].ToString()); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;
            BindContent();
        }

        private void BindContent()
        {
            if (Id == 0)
            {
                const string defaultContent = @"<p style='font-size: 13pt;'>Chuyên trang thiết kế nhà ở</p>
                                    <p>
                                        Kiến trúc và nội thất nhà ở có lẽ là lĩnh vực được nhiều sự quan tâm nhất. Bạn cũng như
                                        chúng tôi, mỗi người đều có một mái nhà và dù chúng là những ngôi biệt thự sang trọng hay những
                                        căn hộ bình dị thì chúng vẫn thật gần gũi với tất cả chúng ta.
                                    </p>
                                    <p>
                                        Cùng với sự phát triển về kinh tế xã hội, khi nhu cầu của mỗi người không chỉ dừng ở 'ăn no, mặc ấm' mà đang chuyển thành 'ăn ngon, mặc đẹp' thì một ngôi nhà không chỉ cần bền chắc mà còn phải đẹp và thật sự tiện nghi. Để làm được điều đó không thể thiếu vai trò của các Kiến trúc sư. Một bản thiết kế tốt sẽ đem lại cho bạn cái Đẹp sự Tiện nghi, giúp bạn Tiết kiệm chi phí đầu tư, hạn chế phát sinh chi phí khi thi công... </p>";
                ltContents.Text = defaultContent;
                return;
            }
            var bo = new NewsBO();
            Entities.News res = bo.GetNewsById(Id);
            ltContents.Text = res.Contents ?? string.Empty;
        }
    }
}