using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FlexipleTask
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void BtnRegister_Click(object sender, EventArgs e)
        {
            string UserName = txtName.Text.Trim();
            string Pwd = TxtPassword.Text.Trim();
            string Email = TxtEmail.Text.Trim();
            
            if (Email.ToLower().EndsWith(".in"))
            {
                using (DataClasses1DataContext dc = new DataClasses1DataContext())
                {
                    if (dc.UserCredentioals.Where(a => a.UserName.ToLower() == UserName.ToLower()).FirstOrDefault() == null)
                    {
                        UserCredentioal uc = new UserCredentioal();
                        uc.UserName = UserName;
                        uc.Pwd = Pwd;
                        uc.EmailAddress = Email;
                        dc.UserCredentioals.InsertOnSubmit(uc);
                        dc.SubmitChanges();
                        Response.Redirect("Home.aspx");
                    }
                    else
                    {
                        lblRegisterMsg.ForeColor = System.Drawing.Color.Red;
                        lblRegisterMsg.Text = "Username already exist";

                        lblMsg.ForeColor = System.Drawing.Color.Red;
                        lblMsg.Text = "Username already exist";
                    }
                }
            }
            else
            {
                lblMsg.ForeColor = System.Drawing.Color.Red;
                lblMsg.Text = "Please enter email address with .in  Domain";
                
                lblRegisterMsg.ForeColor = System.Drawing.Color.Red;
                lblRegisterMsg.Text = "Please enter email address with .in  Domain";
            }
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            string UserName = txtUserName.Text.Trim().ToLower();
            string Pwd = txtPwd.Text.Trim();
            if (!string.IsNullOrEmpty(UserName) && !string.IsNullOrEmpty(Pwd))
            {
                using (DataClasses1DataContext dc = new DataClasses1DataContext())
                {
                    var User = dc.UserCredentioals.Where(a => a.UserName.ToLower() == UserName.ToLower() && a.Pwd == Pwd).FirstOrDefault();
                    if (User != null)
                    {
                        Response.Redirect("Home.aspx");
                    }
                    else
                    {
                        lblMsg.ForeColor = System.Drawing.Color.Red;
                        lblMsg.Text = "Please enter valid credentioals";
                    }
                }
            }
        }
    }
}