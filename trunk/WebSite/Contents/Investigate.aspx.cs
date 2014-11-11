using System;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using WebSite.Common;

namespace WebSite.Contents
{
    public partial class Investigate : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            SendEmail();
        }
        private void SendEmail()
        {
            var htmlBody =
                "<center><H3>PHIẾU ĐIỀU TRA<H3></center>" +
                "<center><i>(Quý khách vui lòng điền đầy đủ thông tin vào phiếu điều tra)<i></center>" +
                "<br/><H4>THÔNG TIN KHÁCH HÀNG<H4>" +
                "<br/>Họ và Tên:  " + ddl.SelectedItem.Text + " " + tbName.Text +
                "<br/>Số điện thoại:  " + tbPhone.Text +
                "<br/>Email:  " + tbEmail.Text +
                "<br/>Địa chỉ:  " + tbAddress.Text +
                "<br/>Thành phố:  " + tbCity.Text +
                "<br/><H4>THÔNG TIN CÔNG TRÌNH<H4>" +
                "<br/>Kích thước mảnh đất: Đơn vị: mét, chiều rộng X chiều dài... :  " + tbSize.Text +
                "<br/>Hướng nhà :  " + tbDirection.Text +
                "<br/>Số tiền dự định đầu tư xây dựng (Triệu VNĐ) :   " + tbCost.Text +
                "<br/>Ngày tháng năm sinh người đứng chủ: (Mong quý vị gửi ngày sinh âm lịch chính xác để chúng tôi xem xét phương án thiết kế) :  " + tbDateOfBirthday.Text +
                "<br/>Số người trong gia đình: (Nên ghi cụ thể, Ví dụ: 2 người già, 2 người lớn, 1 trẻ em) :  " + tbNumberOfPerson.Text +
                "<br/>Số phòng định xây: (Nên ghi cụ thể, Ví dụ: 3 phòng ngủ, 1 phòng khách, 1 phòng ăn) :  " + tbNumberOfRoom.Text +
                "<br/>Yêu cầu khác :  " + tbOther.Text +
                "<br/><H4>THÔNG TIN SỞ THÍCH CÁ NHÂN<H4>" +
                "<br/>Màu sắc cho ngôi nhà (Ví dụ: Hồng đỏ tím vàng):  " + tbColor.Text +
                "<br/>Đường nét yêu thích (Ví dụ: Nét cong, thẳng, kết hợp):  " + tbLineStyle.Text +
                "<br/>Kiểu nhà yêu thích (Ví dụ: Lệch tầng, thẳng tầng, nhà biệt thự cổ, nhà vườn...:  " + tbStyle.Text +
                "<br/>Yêu cầu khác (Không gian giải trí, làm việc, thể dục thể thao):  " + tbOtherPersonal.Text +
                "</a> <br/><br/><br/><br/> Cảm ơn, ";
            var attachment = fileUpload.FileBytes;
            var fileName = fileUpload.FileName;   
            Utils.SendEmail(htmlBody, true, attachment, fileName);
        }  
        
    }
}