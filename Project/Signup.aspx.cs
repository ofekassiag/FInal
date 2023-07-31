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
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                for (int i = 1; i <= 120; i++)
                {
                    Age.Items.Add(i.ToString());
                }
            }
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            string email = Email.Value;
            string id = ID.Value;
            string password = Password.Value;
            string age = Age.Value;
            string gender = "Female";
            bool isGenderMale = GenderMale.Checked;
            if (isGenderMale == true)
                gender = "Male";


            string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\\Users\\ofeka\\OneDrive\\שולחן העבודה\\Project\\Project\\Users.accdb";



            using (OleDbConnection conn = new OleDbConnection(connectionString))
            {
                conn.Open();

                string selectQuery = $"SELECT * FROM users WHERE identification='{id}'";
                using (OleDbCommand selectCommand = new OleDbCommand(selectQuery, conn))
                {
                    using (OleDbDataAdapter adapter = new OleDbDataAdapter(selectCommand))
                    {
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);

                        if (dt.Rows.Count != 0)
                        {
                            Label1.Text = string.Format("User [{0}] has already signed up", id);
                            Label1.CssClass = "result-label1";
                        }
                        else
                        {
                            string insertQuery = $"INSERT INTO users (email, identification, age, gender, [password]) " +
                                $"VALUES('{email}','{id}','{age}','{gender}','{password}')";

                            using (OleDbCommand insertCommand = new OleDbCommand(insertQuery, conn))
                            {
                                insertCommand.ExecuteNonQuery();
                            }
                            Email.Value = String.Empty;
                            ID.Value = String.Empty;
                            Password.Value = String.Empty;
                            ConPassword.Value = String.Empty;
                            Age.Value = String.Empty;
                            GenderMale.Checked = false;
                            GenderFemale.Checked = false;

                            Label1.Text = string.Format("User [{0}] has signed up", id);
                            Label1.CssClass = "result-label1";
                        }
                    }
                }
            }
        }
    }
}