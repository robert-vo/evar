using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;

using EvilDICOM.Core;
using EvilDICOM.Core.Helpers;
using ICSharpCode.SharpZipLib.Core;
using ICSharpCode.SharpZipLib.Zip;

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
            SurgeonUploadModel model = new SurgeonUploadModel();
            return View();
        }

        [HttpPost]
        public ActionResult UploadAndStoreEVARMetaData(HttpPostedFileBase file, SurgeonUploadModel model)
        {
            System.Diagnostics.Debug.WriteLine("in evar meta data upload");
            System.Diagnostics.Debug.WriteLine(model.DateOfSurgery);
            System.Diagnostics.Debug.WriteLine(model.Brand);
            System.Diagnostics.Debug.WriteLine(model.EndograftBodyDiameter);
            System.Diagnostics.Debug.WriteLine(model.EndograftBodyLength);
            System.Diagnostics.Debug.WriteLine(model.UnilateralLegDiameter);
            System.Diagnostics.Debug.WriteLine(model.UnilateralLegLength);
            System.Diagnostics.Debug.WriteLine(model.ContralateralLegDiameter);
            System.Diagnostics.Debug.WriteLine(model.ContralateralLegLength);
            System.Diagnostics.Debug.WriteLine(model.EntryPoint);


            var fileName = Path.GetFileName(file.FileName);
            var path = Path.Combine(Server.MapPath("~/App_Data/"), fileName);
            file.SaveAs(path);
            var dcm = DICOMObject.Read(@"C:\Users\dropbox\Desktop\export\DICOM\I0");
            var allDescendants = dcm.AllElements;
            System.Diagnostics.Debug.WriteLine(dcm.FindFirst("00100010")); //Patient's name NONE^NONE
            System.Diagnostics.Debug.WriteLine(dcm.FindFirst("00080020"));
            System.Diagnostics.Debug.WriteLine(dcm.FindFirst("00100030"));
            //ExtractZipFile(path, null, "C://unzip");
            return RedirectToAction("UploadAndStoreEVARMetaData");
        }
        public void ExtractZipFile(string archiveFilenameIn, string password, string outFolder)
        {
            ZipFile zf = null;
            try
            {
                FileStream fs = System.IO.File.OpenRead(archiveFilenameIn);
                zf = new ZipFile(fs);
                if (!String.IsNullOrEmpty(password))
                {
                    zf.Password = password;     // AES encrypted entries are handled automatically
                }
                foreach (ZipEntry zipEntry in zf)
                {
                    if (!zipEntry.IsFile)
                    {
                        continue;           // Ignore directories
                    }
                    String entryFileName = zipEntry.Name;
                    // to remove the folder from the entry:- entryFileName = Path.GetFileName(entryFileName);
                    // Optionally match entrynames against a selection list here to skip as desired.
                    // The unpacked length is available in the zipEntry.Size property.

                    byte[] buffer = new byte[4096];     // 4K is optimum
                    Stream zipStream = zf.GetInputStream(zipEntry);

                    // Manipulate the output filename here as desired.
                    String fullZipToPath = Path.Combine(outFolder, entryFileName);
                    string directoryName = Path.GetDirectoryName(fullZipToPath);
                    if (directoryName.Length > 0)
                        Directory.CreateDirectory(directoryName);

                    // Unzip file in buffered chunks. This is just as fast as unpacking to a buffer the full size
                    // of the file, but does not waste memory.
                    // The "using" will close the stream even if an exception occurs.
                    using (FileStream streamWriter = System.IO.File.Create(fullZipToPath))
                    {
                        StreamUtils.Copy(zipStream, streamWriter, buffer);
                    }
                }
            }
            finally
            {
                if (zf != null)
                {
                    zf.IsStreamOwner = true; // Makes close also shut the underlying stream
                    zf.Close(); // Ensure we release resources
                }
            }
        }
    }
}