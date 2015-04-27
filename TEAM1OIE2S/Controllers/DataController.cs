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
using System.Reflection;
using Microsoft.Office.Interop.Excel;

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


        public ActionResult SurgeonDataAnalysisInputForm()
        {
            System.Diagnostics.Debug.WriteLine("in constructor");
            return View();
        }

        [HttpPost]
        public ActionResult SurgeonDataAnalysisInputForm(SurgeonUploadModel model)
        {
            System.Diagnostics.Debug.WriteLine("httppost");
            return View("SurgeonDataAnalysisInputForm");
        }

        public ActionResult UploadAndStoreEVARMetaData()
        {
            SurgeonUploadModel model = new SurgeonUploadModel();
            return View();
        }

        [HttpPost]
        public ActionResult UploadAndStoreEVARMetaData(HttpPostedFileBase file, SurgeonUploadModel model)
        {
            
            //for(int i = 0; i < 489; i++)
                //ParseDICOMFiles(DICOMObject.Read(@"C:\Users\dropbox\Desktop\export\DICOM\I" + i));
            //ParseDICOMFiles(DICOMObject.Read(@"C:\Users\dropbox\Desktop\export\DICOM\I0"));
            //ParseDICOMFiles(DICOMObject.Read(@"C:\Users\dropbox\Desktop\export\DICOMDIR"));
            /*
            int brandManufacturerID = getBr andID(model.BrandName);
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
            */

            return RedirectToAction("UploadAndStoreEVARMetaData");
        }

        public void createExcel() //add reference to microsoft excel. project->add reference->com->microsoft excel 
        {
            Microsoft.Office.Interop.Excel.Application xlApp = new Microsoft.Office.Interop.Excel.Application();

            if (xlApp == null)
            {
                Console.WriteLine("EXCEL could not be started. Check that your office installation and project references are correct.");
            }
            xlApp.Visible = true;

            Workbook wb = xlApp.Workbooks.Add(XlWBATemplate.xlWBATWorksheet);
            Worksheet ws = (Worksheet)wb.Worksheets[1];

            if (ws == null)
            {
                Console.WriteLine("Worksheet could not be created. Check that your office installation and project references are correct.");
            }

            // Select the Excel cells, in the range c1 to c7 in the worksheet.
            Range aRange = ws.get_Range("C1", "C7");

            if (aRange == null)
            {
                Console.WriteLine("Could not get a range. Check to be sure you have the correct versions of the office DLLs.");
            }

            // Fill the cells in the C1 to C7 range of the worksheet with the number 6.
            Object[] args = new Object[1];
            args[0] = 6;
            aRange.GetType().InvokeMember("Value", BindingFlags.SetProperty, null, aRange, args);

            // Change the cells in the C1 to C7 range of the worksheet to the number 8.
            aRange.Value2 = 8;

        }
        public void ParseDICOMFiles(DICOMObject dcm)
        {
            //ParseDICOMFiles(DICOMObject.Read(@"C:\Users\dropbox\Desktop\export\DICOM\I0"));
            System.Diagnostics.Debug.WriteLine("in parse dicom");
            //var dcm = DICOMObject.Read(@"C:\Users\dropbox\Desktop\export\DICOM\I0");
            var allDescendants = dcm.AllElements;

            System.Diagnostics.Debug.WriteLine("Stored in db for patient");
            System.Diagnostics.Debug.WriteLine(dcm.FindFirst("00100020"));
            System.Diagnostics.Debug.WriteLine(dcm.FindFirst("00100010"));
            System.Diagnostics.Debug.WriteLine(dcm.FindFirst("00100010"));
            System.Diagnostics.Debug.WriteLine(dcm.FindFirst("00100030"));
            System.Diagnostics.Debug.WriteLine(dcm.FindFirst("00101010"));
            System.Diagnostics.Debug.WriteLine(dcm.FindFirst("00100040"));
            /*
            System.Diagnostics.Debug.WriteLine("Stored for each CT Scan for a patient. It is manually entered.");
            System.Diagnostics.Debug.WriteLine("stored for the study");
            System.Diagnostics.Debug.WriteLine(dcm.FindFirst("00200010"));
            System.Diagnostics.Debug.WriteLine(dcm.FindFirst("00081030"));
            System.Diagnostics.Debug.WriteLine(dcm.FindFirst("00080060"));
            System.Diagnostics.Debug.WriteLine(dcm.FindFirst("00080020"));
            System.Diagnostics.Debug.WriteLine(dcm.FindFirst("00080030"));
            System.Diagnostics.Debug.WriteLine(dcm.FindFirst("00080090"));
            System.Diagnostics.Debug.WriteLine(dcm.FindFirst("00080080"));
            System.Diagnostics.Debug.WriteLine(dcm.FindFirst("001021B0"));
            
            System.Diagnostics.Debug.WriteLine("stored for the series");
            System.Diagnostics.Debug.WriteLine(dcm.FindFirst("00200011"));
            System.Diagnostics.Debug.WriteLine(dcm.FindFirst("0008103E"));

            System.Diagnostics.Debug.WriteLine("stored for the slice");
            System.Diagnostics.Debug.WriteLine(dcm.FindFirst("00180050"));
            System.Diagnostics.Debug.WriteLine(dcm.FindFirst("00201208"));
            */
            //(0018,0050) slice thickness
            //00201208 number of study related images
        }

        public int getBrandID(string brand)
        {
            int id = 0;
            switch (brand)
            {
                case "Cook":
                    id = 1;
                    break;
                case "Boston Scientific":
                    id = 2;
                    break;
                case "Medtronic":
                    id = 3;
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
                case "April":
                    num = 04;
                    break;
                case "May":
                    num = 05;
                    break;
                case "June":
                    num = 07;
                    break;
                case "July":
                    num = 08;
                    break;
                case "August":
                    num = 09;
                    break;
                case "September":
                    num = 09;
                    break;
                case "October":
                    num = 10;
                    break;
                case "November":
                    num = 11;
                    break;
                case "December":
                    num = 12;
                    break;
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
