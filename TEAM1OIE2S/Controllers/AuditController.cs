using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.SqlClient;

namespace TEAM1OIE2S.Controllers
{
    public class AuditController : Controller
    {
        //
        // GET: /Audit/

        

        public List<TEAM1OIE2S.Models.AuditModel> getAudits()
        {
            try
            {
                List<TEAM1OIE2S.Models.AuditModel> audits = new List<TEAM1OIE2S.Models.AuditModel>();
                SqlConnection con = new SqlConnection(@"Data Source=sqlserver.cs.uh.edu,1044; User ID = TEAM1OIE2S; Password = TEAM1OIE2S#; Initial Catalog = TEAM1OIE2S");
                string sql = "SELECT * FROM Audit";
                con.Open();
                SqlDataReader rdr;
                SqlCommand cmdGet = new SqlCommand(sql, con);
                //For reading from database
                using (cmdGet = new SqlCommand(sql, con))
                {
                    rdr = cmdGet.ExecuteReader();
                    while (rdr.Read())
                    {
                            audits.Add(new TEAM1OIE2S.Models.AuditModel() { 
                            Type = rdr["Type"].ToString(),
                            TableName = rdr["TableName"].ToString(),
                            FieldName = rdr["FieldName"].ToString(),
                            OldValue = rdr["OldValue"].ToString(),
                            NewValue = rdr["NewValue"].ToString(),
                            UpdateDate = Convert.ToDateTime(rdr["UpdateDate"])
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

		public ActionResult Index()
        {
            return View();
        }

        public ActionResult DatabaseAudit()
        {
          	var list = getAudits();
            ViewData["auditsList"] = list;
            return View();
        }
    }
}
