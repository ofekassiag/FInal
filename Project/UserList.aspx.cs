using System;
using System.Data;
using System.Data.OleDb;

namespace Project
{
    public partial class UserList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] != null)
                {
                    loginLink.Visible = false;
                    signInLink.Visible = false;
                    BindUserList();

                }
                else
                    Server.Transfer("Signup.aspx");
            }
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Server.Transfer("main.aspx");
        }
        private void BindUserList()
        {
            string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\\Users\\ofeka\\OneDrive\\שולחן העבודה\\Project\\Project\\Users.accdb";

            using (OleDbConnection conn = new OleDbConnection(connectionString))
            {
                conn.Open();

                string selectQuery = "SELECT * FROM users";

                using (OleDbCommand selectCommand = new OleDbCommand(selectQuery, conn))
                {
                    using (OleDbDataAdapter adapter = new OleDbDataAdapter(selectCommand))
                    {
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);

                        UserGridView.DataSource = dt;
                        UserGridView.DataBind();
                    }
                }
            }
        }
    }
}
