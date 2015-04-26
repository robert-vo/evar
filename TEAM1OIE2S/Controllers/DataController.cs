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
using System.Data.SqlClient;
using System.Data;

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
            int brandManufacturerID = getBrandID(model.BrandName);
            int month = getMonthFromString(model.MonthOfSurgery);
            try //if a file is uploaded...
            {
                var fileName = Path.GetFileName(file.FileName);
                var path = Path.Combine(Server.MapPath("~/App_Data/"), fileName);
                if (fileName.Split('.')[1] == "zip") //if the file uploaded is a "~.zip" file
                {
                    file.SaveAs(path); //save it to the ~/App_Data path
                    ExtractZipFile(path, null, "C://unzip"); //extract zip to C:/unzip
                    //establishes a sql connection and inserts the values into the endograft table.
                    SqlConnection connection = new SqlConnection(@"Data Source=sqlserver.cs.uh.edu,1044; User ID = TEAM1OIE2S; Password = TEAM1OIE2S#; Initial Catalog = TEAM1OIE2S");
                    string sql = "INSERT INTO Endograft(diameter, length, unilateralLegDiameter, unilateralLegLength, controlateralLegDiameter, controlateralLegLength, entryPoint, brandID) Values (@diameter, @length, @UnilateralLegDiameter, @UnilateralLegLength, @ContralateralLegDiameter, @ContralateralLegLength, @EntryPoint, @brandID)";
                    SqlCommand cmd = new SqlCommand(sql, connection);
                    cmd.CommandType = CommandType.Text;
                    SqlParameter p1 = new SqlParameter("diameter", model.EndograftBodyDiameter);
                    SqlParameter p2 = new SqlParameter("length", model.EndograftBodyLength);
                    SqlParameter p3 = new SqlParameter("UnilateralLegDiameter", model.UnilateralLegDiameter);
                    SqlParameter p4 = new SqlParameter("UnilateralLegLength", model.UnilateralLegLength);
                    SqlParameter p5 = new SqlParameter("ContralateralLegDiameter", model.ContralateralLegDiameter);
                    SqlParameter p6 = new SqlParameter("ContralateralLegLength", model.ContralateralLegLength);
                    SqlParameter p7 = new SqlParameter("EntryPoint", model.EntryPoint);
                    SqlParameter p8 = new SqlParameter("brandID", brandManufacturerID);
                    cmd.Parameters.Add(p1);
                    cmd.Parameters.Add(p2);
                    cmd.Parameters.Add(p3);
                    cmd.Parameters.Add(p4);
                    cmd.Parameters.Add(p5);
                    cmd.Parameters.Add(p6);
                    cmd.Parameters.Add(p7);
                    cmd.Parameters.Add(p8);
                    connection.Open();
                    cmd.ExecuteNonQuery();
                }
                else //not a zip
                {
                    System.Diagnostics.Debug.Write(fileName + " is NOT a zip!!");
                }
            }
            catch (System.NullReferenceException e) //a file isn't uploaded
            {
                System.Diagnostics.Debug.WriteLine(e.Message);
            }

            return RedirectToAction("UploadAndStoreEVARMetaData");
        }

        public void ParseDICOMFiles(DICOMObject dcm)
        {
            //ParseDICOMFiles(DICOMObject.Read(@"C:\Users\dropbox\Desktop\export\DICOM\I0"));
            System.Diagnostics.Debug.WriteLine("in parse dicom");
            //var dcm = DICOMObject.Read(@"C:\Users\dropbox\Desktop\export\DICOM\I0");
            var allDescendants = dcm.AllElements;
            System.Diagnostics.Debug.WriteLine(allDescendants);
            System.Diagnostics.Debug.WriteLine(allDescendants[1]);
            System.Diagnostics.Debug.WriteLine(dcm.FindFirst("00100010")); //Patient's name NONE^NONE
            System.Diagnostics.Debug.WriteLine(dcm.FindFirst("00080020"));
            System.Diagnostics.Debug.WriteLine(dcm.FindFirst("00100030"));
        }

        public int getBrandID(string brand)
        {
            int id = 0;
            switch (brand)
            {
                case "Brand 1":
                    id = 1;
                    break;
                case "Brand 2":
                    id = 2;
                    break;
                case "Brand 3":
                    id = 3;
                    break;
                case "Brand 4":
                    id = 4;
                    break;
                case "Brand 5":
                    id = 5;
                    break;
                default:
                    break;
            }
            return id;
        }
        public int getMonthFromString(string month)
        {
            int num = 0;
            switch (month)
            {
                case "January":
                    num = 01;
                    break;
                case "February":
                    num = 02;
                    break;
                case "March":
                    num = 03;
                    break;
                //add for other months.....
                default:
                    System.Diagnostics.Debug.WriteLine("NOT A VALID MONTH");
                    break;
            }
            return num;
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
