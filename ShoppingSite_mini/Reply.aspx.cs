using System;
using System.Configuration;
using System.Net.Mail;
using System.Text;
using System.Web.UI;

namespace ShoppingSite_mini
{
    public partial class Reply : System.Web.UI.Page
    {
        Connectionclass obj = new Connectionclass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int uid = Convert.ToInt32(Session["reply_uid"]);

                
                string q = "SELECT email FROM User_table WHERE user_id = " + uid;
                txtToEmail.Text = obj.Fn_Scalar(q);
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            int uid = Convert.ToInt32(Session["reply_uid"]);
            string toEmail = txtToEmail.Text;
            string subject = txtSubject.Text;
            string body = txtReplyBody.Text;

            // Admin credentials read securely from Web.config appSettings
            string adminGmail = ConfigurationManager.AppSettings["AdminEmail"];
            string adminAppPassword = ConfigurationManager.AppSettings["AdminAppPassword"];

            try
            {
                SendEmail("GamesHopper Admin", adminGmail, adminAppPassword, "Customer", toEmail, subject, body);
                string update = "UPDATE Feedback_table SET rep_msg = '" + body + "', fdbk_status = 0 WHERE user_id = " + uid;
                obj.Fn_Nonquery(update);

                lblMsg.Text = "Email Sent Successfully!";
            }
            catch (Exception ex)
            {
                lblMsg.Text = "Error: " + ex.Message;
            }
        }

        public static void SendEmail(string yourName, string yourGmailUserName, string yourGmailPassword, string toName, string toEmail, string subject, string body)
        {
            string to = toEmail;
            string from = yourGmailUserName;
            MailMessage message = new MailMessage(from, to);

            string mailbody = body;
            message.Subject = subject;
            message.Body = mailbody;
            message.BodyEncoding = Encoding.UTF8;
            message.IsBodyHtml = true;

            SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
            System.Net.NetworkCredential basicCredential1 = new System.Net.NetworkCredential(yourGmailUserName, yourGmailPassword);

            client.EnableSsl = true;
            client.UseDefaultCredentials = false;
            client.Credentials = basicCredential1;

            try
            {
                client.Send(message);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
