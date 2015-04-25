using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;
using ICSharpCode.SharpZipLib.Zip;

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

            }
            return RedirectToAction("UploadAndStoreEVARMetaData");
        }
        
        public static void UnZip(string SrcFile, string DstFile, int BufferSize)
        {
        FileStream fileStreamIn = new FileStream(SrcFile, FileMode.Open, FileAccess.Read);
        ZipInputStream zipInStream = new ZipInputStream(fileStreamIn);
        ZipEntry entry = zipInStream.GetNextEntry();
        FileStream fileStreamOut = new FileStream
		(DstFile + @"\" + entry.Name, FileMode.Create, FileAccess.Write);
        int size;
        byte[] buffer = new byte[BufferSize];
        do
        {
            size = zipInStream.Read(buffer, 0, buffer.Length);
            fileStreamOut.Write(buffer, 0, size);
        } while (size > 0);
        zipInStream.Close();
        fileStreamOut.Close();
        fileStreamIn.Close();
        }

    }
}
