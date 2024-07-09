using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using Npgsql;

namespace InvoiceBilling
{
    public partial class Billing : System.Web.UI.Page
    {
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyDBConnectionString"].ConnectionString;


        Class1 cd = new Class1();
        DataTable dtt = new DataTable();
        public double item, Tax_exclusive, cname, total;
        bool found;
        int iddd = 1;
        double taxex = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {


                Customerload();

                Productload();


                //cd.command = new SqlCommand("SELECT MAX(bno) AS id FROM invoice", cd.sample());
                //int currentMaxBillNo = (int)cd.command.ExecuteScalar(); // handle null case
                //int newBillNo = currentMaxBillNo + 1;
                //TextBox5.Text = newBillNo.ToString();


                string que = "SELECT MAX(bno) AS id FROM invoice";
                using (NpgsqlConnection conn = new NpgsqlConnection(connectionString))
                {

                    NpgsqlCommand cmd = new NpgsqlCommand(que, conn);
                    conn.Open();
                    int currentMaxBillNo = Convert.ToInt32(cmd.ExecuteScalar());
                    int newBillNo = currentMaxBillNo + 1;
                    TextBox5.Text = newBillNo.ToString();


                }
                //TextBox5.Text = "1";
            }





            //dtt.Columns.Add("name", typeof(string));
            //dtt.Columns.Add("pname", typeof(string));
            //dtt.Columns.Add("qty", typeof(int));
            //dtt.Columns.Add("price", typeof(int));
            //dtt.Columns.Add("tax", typeof(string));
            //dtt.Columns.Add("granttotal", typeof(string));

            DateTime datetime = DateTime.Now;
            Label7.Text = datetime.ToString("dd/MM/yyyy hh:mm:ss tt");

          




        }

        private void Customerload()
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyDBConnectionString"].ConnectionString;

            //cd.command = new SqlCommand("select custid,Customer_Name  from CustomerDetails", cd.sample());
            //SqlDataReader reader = cd.command.ExecuteReader();
            //DropDownList1.DataSource = reader;
            //DropDownList1.DataTextField = "Customer_Name";
            //DropDownList1.DataValueField = "custid";
            //DropDownList1.DataBind();
            //reader.Close();

            string query2 = "select custid,Customer_Name  from CustomerDetails";
            using (NpgsqlConnection conn = new NpgsqlConnection(connectionString))
            {

                NpgsqlCommand cmd = new NpgsqlCommand(query2, conn);
                conn.Open();
                NpgsqlDataReader reader = cmd.ExecuteReader();
                DropDownList1.DataSource = reader;
                DropDownList1.DataTextField = "Customer_Name";
                DropDownList1.DataValueField = "custid";
                DropDownList1.DataBind();
                reader.Close();
            }
        }
        private void Productload()
        {
            //cd.command = new SqlCommand("select id,Product_name  from product", cd.sample());
            //SqlDataReader reader1 = cd.command.ExecuteReader();
            //DropDownList2.DataSource = reader1;
            //DropDownList2.DataTextField = "Product_name";
            //DropDownList2.DataValueField = "id";
            //DropDownList2.DataBind();
            //reader1.Close();

            string query1 = "select id,Product_name  from product";
            using (NpgsqlConnection conn = new NpgsqlConnection(connectionString))
            {

                NpgsqlCommand cmd = new NpgsqlCommand(query1, conn);
                conn.Open();
                NpgsqlDataReader reader1 = cmd.ExecuteReader();
                DropDownList2.DataSource = reader1;
                DropDownList2.DataTextField = "Product_name";
                DropDownList2.DataValueField = "id";
                DropDownList2.DataBind();
                reader1.Close();
            }

        }
            protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged2(object sender, EventArgs e)
        {

        }

        private DataTable DataTable
        {
            get
            {
                if (ViewState["DataTable"] == null)
                {
                    DataTable dt = new DataTable();
                    dt.Columns.Add("bno");

                    dt.Columns.Add("name");
                    dt.Columns.Add("pname");
                    dt.Columns.Add("qty");
                    dt.Columns.Add("price");
                    dt.Columns.Add("tax");
                    dt.Columns.Add("Tax_exclusive");
                    ViewState["DataTable"] = dt;
                }
                return (DataTable)ViewState["DataTable"];
            }
            set { ViewState["DataTable"] = value; }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            TextBox1.Text = string.Empty;
            TextBox2.Text = string.Empty;
           // TextBox3.Text = string.Empty;
            Panel2.Controls.Clear();
            Panel2.BorderStyle = BorderStyle.None;

            //DropDownList1.SelectedItem.Text = string.Empty;
            //DropDownList2.SelectedItem.Text = string.Empty;
            Label10.Text = string.Empty;
            Label11.Text = string.Empty;
            Label9.Text = string.Empty;
            GridView1.DataBind();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            item = item + 1;
            double amt = (Convert.ToDouble(double.Parse(TextBox1.Text)) * Convert.ToDouble(double.Parse(TextBox2.Text)));
            if (dtt.Rows.Count > 0)
            {
                bool found = false;

                for (int i = 0; i < dtt.Rows.Count; i++)
                {
                    string n = dtt.Rows[i][1].ToString();
                    if (n == DropDownList2.Text)
                    {
                        dtt.Rows[i][2] = Convert.ToInt32(dtt.Rows[i][2]) + Convert.ToInt32(TextBox1.Text);
                        double p1 = Convert.ToDouble(dtt.Rows[i][4]);
                        double p2 = p1 + amt;
                        dtt.Rows[i][4] = p2;
                        found = true;
                        // MessageBox.Show(p2.ToString());
                    }
                    if (!found)
                    {
                        dtt.Rows.Add(DropDownList1.Text, DropDownList2.Text, TextBox1.Text, TextBox2.Text, TextBox3.Text, amt.ToString());
                        GridView1.DataSource = dtt;

                    }

                }
            }
            else
            {
                // int colscount = dtt.Columns.Count;
                //  //dtt.Columns.Add("amt", typeof(string));
                //  granttotal = amt;
                //  TextBox4.Text = granttotal.ToString();


                //    DataRow row =  dtt.Rows.Add(DropDownList1.Text, DropDownList2.Text, TextBox1.Text, TextBox2.Text, TextBox3.Text,TextBox4.Text, amt.ToString());
                ////GridView1.DataSource = dtt;
                //dtt.Rows.Add(row);
                //BindGridView();


                //dtt.Rows.Add(DropDownList1.Text, DropDownList2.Text, TextBox1.Text, TextBox2.Text, TextBox3.Text, TextBox4.Text, amt.ToString());
                //GridView1.DataSource = dtt.Rows;
                //  dtt.Rows.Add(DropDownList1.Text, DropDownList2.Text, TextBox1.Text, TextBox2.Text, TextBox3.Text, TextBox4.Text, amt.ToString());



              
                string textBox5Value = TextBox5.Text;

                string selectedValue1 = DropDownList1.SelectedItem.Text;
                string selectedValue2 = DropDownList2.SelectedItem.Text;
                string textBox1Value = TextBox1.Text;
                string textBox2Value = TextBox2.Text;
                string textBox3Value = TextBox3.Text;

                taxex = (Convert.ToDouble(double.Parse(TextBox1.Text)) * Convert.ToDouble(double.Parse(TextBox2.Text)));

                // Add the values to the DataTable
                DataRow row = DataTable.NewRow();
                row["bno"] = textBox5Value;

                row["name"] = selectedValue1;
                row["pname"] = selectedValue2;
                row["qty"] = textBox1Value;
                row["price"] = textBox2Value;
                row["tax"] = textBox3Value;
                row["Tax_exclusive"] = taxex;
                DataTable.Rows.Add(row);
                BindGridView();

            }


            // total = amt;
            // TextBox4.Text = granttotal.ToString();
            //  cd.command = new SqlCommand("insert into invoice values(@bno,@name,@pname,@qty,@price,@tax,@granttotal,@Total)", cd.sample());
            //  cd.command.Parameters.AddWithValue("@bno", TextBox5.Text);
            //  cd.command.Parameters.AddWithValue("@name", DropDownList1.SelectedValue);

            //  cd.command.Parameters.AddWithValue("@pname", DropDownList2.SelectedValue);
            //  cd.command.Parameters.AddWithValue("@qty", TextBox1.Text);
            //  cd.command.Parameters.AddWithValue("@price", TextBox2.Text);
            //  cd.command.Parameters.AddWithValue("@tax", 15);
            //  cd.command.Parameters.AddWithValue("@granttotal", TextBox4.Text);
            ////  cd.command.Parameters.AddWithValue("@Total", 0);
            //  cd.command.ExecuteNonQuery();
            // MessageBox.Show("grand total : " + TextBox4.Text);
            //  GridView1.DataSource = dtt;
            // GridView1.DataBind();



            TextBox1.Text = string.Empty;
            TextBox2.Text = string.Empty;
            //TextBox3.Text = string.Empty;
            
           // DropDownList1.SelectedItem.Text = string.Empty;
           // DropDownList2.SelectedItem.Text = string.Empty;



        }

        private void BindGridView()
        {
            GridView1.DataSource = DataTable;
            GridView1.DataBind();


            //cd.command = new SqlCommand("insert into invoice(bno,name,pname,qty,price,tax,Tax_exclusive)values(" + TextBox5.Text+",'"+ DropDownList1.SelectedItem.Text + "','" + DropDownList2.SelectedItem.Text + "',"+TextBox1.Text+","+TextBox2.Text+",'"+TextBox3.Text+"',"+ taxex + ")", cd.sample());
            //cd.command.ExecuteNonQuery();

            string qr = "insert into invoice(bno,name,pname,qty,price,tax,Tax_exclusive)values(" + TextBox5.Text + ",'" + DropDownList1.SelectedItem.Text + "','" + DropDownList2.SelectedItem.Text + "'," + TextBox1.Text + "," + TextBox2.Text + ",'" + TextBox3.Text + "'," + taxex + ")";
            using (NpgsqlConnection conn = new NpgsqlConnection(connectionString))
            {
                NpgsqlCommand cmd = new NpgsqlCommand(qr, conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }

            CalculateAndDisplaySums(DataTable);
        }

        private void CalculateAndDisplaySums(DataTable dt)
        {
            // Initialize sums for each column
            int untaxed = 0;

            double tax = 0;
            double total = 0;


            // Iterate through each row in the DataTable to calculate sums
            foreach (DataRow row in dt.Rows)
            {
                untaxed += Convert.ToInt32(row["Tax_exclusive"]);

            }

            tax = untaxed * 15 / 100;
            total = untaxed + tax;

            // Display or use the sums as needed
            Label9.Text = "Untaxed Amount: " + untaxed.ToString();
            Label10.Text = "Tax 15% : " + tax.ToString();
            Label11.Text = "Total : " + total.ToString();


           

        }


    }
}