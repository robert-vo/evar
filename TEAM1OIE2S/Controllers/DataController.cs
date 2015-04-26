using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;
using EvilDICOM.Core;
using EvilDICOM.Core.Helpers;
using TEAM1OIE2S.Models;

namespace SEProj.Controllers
{
    public class DataController : Controller
    {
        //
        // GET: /Data/

        public ActionResult Index()
        {
            ViewData["Message"] = "Welcome to ASP.NET MVC!";
            return View();
        }

        public ActionResult UploadAndStoreEVARMetaData()
        {
            return View();
        }

        [HttpPost]
        public ActionResult UploadAndStoreEVARMetaData(HttpPostedFileBase file)
        {
            if (file.ContentLength > 0)
            {
                var fileName = Path.GetFileName(file.FileName);
                var path = Path.Combine(Server.MapPath("~/App_Data/"), fileName);
                file.SaveAs(path);
                var dcm = DICOMObject.Read(@"C:\Users\dropbox\Desktop\export\DICOM\I0");
                var allDescendants = dcm.AllElements;
                System.Diagnostics.Debug.WriteLine(dcm.FindFirst("00100010")); //Patient's name NONE^NONE
                System.Diagnostics.Debug.WriteLine(dcm.FindFirst("00080020")); 
                System.Diagnostics.Debug.WriteLine(dcm.FindFirst("00100030"));
            }
            return RedirectToAction("UploadAndStoreEVARMetaData");
        }
    }
}