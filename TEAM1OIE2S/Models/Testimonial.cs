using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
namespace TEAM1OIE2S.Models
{
    public class Testimonial
    {
        private string quote1 = "test";// premade quote
        private string quote2 = "test";// premade quote
        private string quote3 = "test";// premade quote
        
        private string quote = "";
        private string name = "";



        public Testimonial()
        {
            
        }

        public Testimonial(string myQuote, string myName)
        {
            quote = myQuote;
            myName = name;
        }

        public string addTestimonial(string body)
        {
            SqlConnection connection = new SqlConnection(@"Data Source=sqlserver.cs.uh.edu,1044; User ID = TEAM1OIE2S; Password = TEAM1OIE2S#; Initial Catalog = TEAM1OIE2S; Trusted_Connection = Yes");
            //establishing a connection to sqlserver.cs.uh.edu at port 1044 with the credentials TEAM1OIE2S and password TEAM1OIE2S#. 
            //Initial Catalog refers to the default database, since sqlserver.cs.uh.edu has multiple databases.
            connection.Open();
            string sql = "INSERT INTO TESTIMONIALS(testimonial_id, content) Values(0, 'Testing')";
            SqlCommand cmd = new SqlCommand(sql, connection);
            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();

            return "Hello";
        }
    }
}