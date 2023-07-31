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
    public partial class addx : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                for (int i = 1; i <= 120; i++)
                {
                    Age.Items.Add(i.ToString());
                }
                if (Session["username"] != null)
                {
                    loginLink.Visible = false;
                    signInLink.Visible = false;


                }
                else
                    logout.Visible = false;

                label1.Visible = false;
            }
        }
        protected void Logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Server.Transfer("main.aspx");
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            string name = Name.Text;
            string address = Address.Text;
            string age = Age.SelectedValue;
            string id = ID.Text;
            string gender = "Male";
            if (GenderFemale.Checked == true)
                gender = "Female";

            if (!ValidateForm())
                return;

            int socialCreditScore = ScoreCalc();
            string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\\Users\\ofeka\\OneDrive\\שולחן העבודה\\Project\\Project\\Users.accdb";
            using (OleDbConnection conn = new OleDbConnection(connectionString))
            {
                conn.Open();
                string selectQuery = $"SELECT * FROM citi WHERE didi='{id}'";
                using (OleDbCommand selectCommand = new OleDbCommand(selectQuery, conn))
                {
                    using (OleDbDataAdapter adapter = new OleDbDataAdapter(selectCommand))
                    {
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);

                        if (dt.Rows.Count != 0)
                        {
                            label1.Text = string.Format("Citizen [{0}] has already registered", id);
                            label1.CssClass = "result-label1";
                            label1.Visible = true;
                        }
                        else
                        {
                            string insertQuery = $"INSERT INTO citi (Nama, address, age, gender, didi, Credit) " +
                                $"VALUES('{name}','{address}','{age}','{gender}','{id}','{socialCreditScore}')";

                            using (OleDbCommand insertCommand = new OleDbCommand(insertQuery, conn))
                            {
                                insertCommand.ExecuteNonQuery();
                            }

                            Name.Text = String.Empty;
                            ID.Text = String.Empty;
                            Age.SelectedIndex = 0;
                            GenderMale.Checked = false;
                            GenderFemale.Checked = false;
                            Donation.Checked = false;
                            SocialMedia.Checked = false;
                            ChineseHan.Checked = false;
                            Job.Checked = false;
                            CCPVote.Checked = false;
                            Protest.Checked = false;
                            none.Checked = false;

                            
                            label1.Text = string.Format("Citizen [{0}] has registered to the system", id);
                            label1.Visible = true;
                            label1.CssClass = "result-label1";
                        }
                    }
                }
            }
        }

        public bool ValidateForm()
        {
            string name = Name.Text;
            string address = Address.Text;
            string age = Age.SelectedValue;
            string id = ID.Text;
            RadioButton genderMale = (RadioButton)FindControl("GenderMale");
            RadioButton genderFemale = (RadioButton)FindControl("GenderFemale");
            CheckBox[] checkboxes = CheckBoxList1.Controls.OfType<CheckBox>().ToArray();
            int checkedCount = checkboxes.Count(checkbox => checkbox.Checked);

            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(address) || string.IsNullOrEmpty(age) || string.IsNullOrEmpty(id) || (genderFemale.Checked && genderMale.Checked) || checkedCount < 1)
            {
                label1.Text = "Please fill in all the fields";
                label1.Visible = true;
                return false;
            }

            if (id.Length != 17)
            {
                label1.Text = "ID must contain 17 numbers.";
                label1.Visible = true;
                return false;
            }

            if (!id.All(char.IsDigit))
            {
                label1.Text = "ID must contain only numbers.";
                label1.Visible = true;
                return false;
            }

            return true;
        }
        public int ScoreCalc()
        {
            CheckBox[] checkboxes = CheckBoxList1.Controls.OfType<CheckBox>().ToArray();
            bool noneChecked = checkboxes.Any(checkbox => checkbox.ID == "NoneCheckBox" && checkbox.Checked);

            if (noneChecked)
                return 0;

            int checkedCount = checkboxes.Count(checkbox => checkbox.Checked);
            return 100 + (checkedCount * 20);
        }
    }
}
