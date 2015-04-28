using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.ComponentModel;

namespace TEAM1OIE2S.Models
{
    public class AuditModel : Controller
    {
        //
        // GET: /AuditModel/

        [DisplayName("Audits")]
        public string Audits { get; set; }

        public string Type { get; set; }
        public string TableName { get; set; }
        public string FieldName { get; set; }
        public string OldValue { get; set; }
        public string NewValue { get; set; }
        public DateTime UpdateDate { get; set; }



        public ActionResult Index()
        {
            return View();
        }

    }
}
