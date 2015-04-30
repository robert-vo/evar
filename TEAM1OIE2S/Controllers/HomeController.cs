using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;
using TEAM1OIE2S.Models;
using System.Data.SqlClient;
using System.Web.Security;
using System.Data;

namespace SEProj.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewData["Message"] = "Welcome to ASP.NET MVC!";

            return View();
        }

        public ActionResult About()
        {
            return View();
        }

        public ActionResult ContactUs()
        {
            return View();
        }

        public ActionResult Testimonials()
        {
            try
            {
                var currentUser = Membership.GetUser(User.Identity.Name);
                string userEmail = currentUser.Email.ToString();
                string userOccupation = "";
                SqlConnection connection = new SqlConnection(@"Data Source=sqlserver.cs.uh.edu,1044; User ID = TEAM1OIE2S; Password = TEAM1OIE2S#; Initial Catalog = TEAM1OIE2S");
                string sql = "SELECT * FROM Surgeons WHERE email = @email";
                SqlCommand cmd = new SqlCommand(sql, connection);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@email", userEmail);
                connection.Open();
                SqlDataReader myReader = cmd.ExecuteReader();
                while (myReader.Read())
                {
                    userOccupation = myReader["accessLevel"].ToString();
                }
                if (userOccupation == "Surgeon" || userOccupation == "Administrator" || userOccupation == "Super Administrator")
                    return View("Testimonials");
                else
                    return View("Error");
            }
            catch (SystemException e)
            {
                return View("Error");
            }
        }

        [HttpPost]
        public ActionResult Testimonials(TestimonialModel model)
        {
            SqlConnection connection = new SqlConnection(@"Data Source=sqlserver.cs.uh.edu,1044; User ID = TEAM1OIE2S; Password = TEAM1OIE2S#; Initial Catalog = TEAM1OIE2S");
            string sql = "INSERT INTO Testimonial(content, date, surgeonID) Values (@content, @date, @surgeonID)";
            SqlCommand cmd = new SqlCommand(sql, connection);
            cmd.CommandType = CommandType.Text;
            SqlParameter p1 = new SqlParameter("content", model.Content);
            SqlParameter p2 = new SqlParameter("date", DateTime.Now);
            int surgeonID = getSurgeonID();
            SqlParameter p3 = new SqlParameter("surgeonID", surgeonID);
            cmd.Parameters.Add(p1);
            cmd.Parameters.Add(p2);
            cmd.Parameters.Add(p3);
            connection.Open();
            cmd.ExecuteNonQuery();

            return View();
        }

        public int getSurgeonID()
        {
            var currentUser = Membership.GetUser(User.Identity.Name);
            string userEmail = currentUser.Email.ToString();
            int surgeonID = 0;
            SqlConnection connection = new SqlConnection(@"Data Source=sqlserver.cs.uh.edu,1044; User ID = TEAM1OIE2S; Password = TEAM1OIE2S#; Initial Catalog = TEAM1OIE2S");
            string sql = "SELECT * FROM Surgeons WHERE email = @email";
            SqlCommand cmd = new SqlCommand(sql, connection);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@email", userEmail);
            connection.Open();
            SqlDataReader myReader = cmd.ExecuteReader();
            while (myReader.Read())
            {
                surgeonID = Convert.ToInt32(myReader["surgeonID"].ToString());
            }
            return surgeonID;
        }

        public ActionResult Anonymize()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Anonymize(HttpPostedFileBase file)
        {
            if (file.ContentLength > 0)
            {
                var fileName = Path.GetFileName(file.FileName);
                var path = Path.Combine(Server.MapPath("~/Images/"), fileName);
                file.SaveAs(path);
            }
            return RedirectToAction("Index");
        }
        public List<TEAM1OIE2S.Models.TestimonialModel> getAudits()
        {
            try
            {
                List<TEAM1OIE2S.Models.TestimonialModel> audits = new List<TEAM1OIE2S.Models.TestimonialModel>();
                SqlConnection con = new SqlConnection(@"Data Source=sqlserver.cs.uh.edu,1044; User ID = TEAM1OIE2S; Password = TEAM1OIE2S#; Initial Catalog = TEAM1OIE2S");
                string sql = "SELECT * FROM Testimonials";
                con.Open();
                SqlDataReader rdr;
                SqlCommand cmdGet = new SqlCommand(sql, con);
                //For reading from database
                using (cmdGet = new SqlCommand(sql, con))
                {
                    rdr = cmdGet.ExecuteReader();
                    while (rdr.Read())
                    {
                        audits.Add(new TEAM1OIE2S.Models.TestimonialModel()
                        {
                            Content = rdr["Content"].ToString(),
                        });
                    }
                }
                con.Close();
                return audits;
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e);
                return null;
            }
        }

    }
}
