using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Data;
using System.Data.OleDb;

namespace Project
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            string id = ID.Value;
            string password = Password.Value;

            string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\\Users\\ofeka\\OneDrive\\שולחן העבודה\\Project\\Project\\Users.accdb";
            using (OleDbConnection conn = new OleDbConnection(connectionString))
            {
                conn.Open();

                string selectQuery = $"SELECT * FROM users WHERE identification='{id}' AND password='{password}'";
                using (OleDbCommand selectCommand = new OleDbCommand(selectQuery, conn))
                {
                    using (OleDbDataAdapter adapter = new OleDbDataAdapter(selectCommand))
                    {
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);

                        if (dt.Rows.Count != 0)
                        {
                            Session["username"] = id;
                            Server.Transfer("main.aspx");
                        }
                        else
                        {
                            Label1.Text = "Incorrect user ID or password.";
                            Label1.CssClass = "error-label1";
                        }
                    }
                }
            }

        }
    }
}