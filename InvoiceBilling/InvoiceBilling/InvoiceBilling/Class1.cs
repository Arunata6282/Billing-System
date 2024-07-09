using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace InvoiceBilling
{
    public class Class1
    {
        public SqlConnection connection;
        public SqlCommand command;
        public SqlDataReader reader;

        public SqlConnection sample()
        {
            connection = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\100823\Documents\BillingSystem.mdf;Integrated Security=True;Connect Timeout=30");
            connection.Open();
            return connection;

        }
    }
}