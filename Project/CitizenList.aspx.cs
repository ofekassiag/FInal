using System;
using System.Data;
using System.Data.OleDb;
using System.Web.UI;

namespace Project
{
    public partial class CitizenList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindUserList();


                if (Session["username"] != null)
                {
                    loginLink.Visible = false;
                    signInLink.Visible = false;


                }
                else
                    logout.Visible = false;
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
            string connectionString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\Users\ofeka\OneDrive\שולחן העבודה\Project\Project\Users.accdb";

            using (OleDbConnection conn = new OleDbConnection(connectionString))
            {
                conn.Open();

                string selectQuery = "SELECT * FROM citi";

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
