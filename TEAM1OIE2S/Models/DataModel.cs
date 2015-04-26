using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace TEAM1OIE2S.Models
{
    #region Models
    public class SurgeonUploadModel
    {
        [DisplayName("Date Of Surgery")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:MM/dd/yyyy}")]
        public DateTime DateOfSurgery { get; set; }

        [Required]
        [DisplayName("Brand")]
        public string Brand { get; set; }

        [Required]
        [DisplayName("Endograft Body Diameter")]
        public string EndograftBodyDiameter { get; set; }

        [Required]
        [DisplayName("Endograft Body Length")]
        public string EndograftBodyLength { get; set; }

        [Required]
        [DisplayName("Unilateral Leg Diameter")]
        public string UnilateralLegDiameter { get; set; }

        [Required]
        [DisplayName("Unilateral Leg Length")]
        public string UnilateralLegLength { get; set; }

        [Required]
        [DisplayName("Contralateral Leg Diameter")]
        public string ContralateralLegDiameter { get; set; }

        [Required]
        [DisplayName("Contralateral Leg Length")]
        public string ContralateralLegLength { get; set; }

        [Required]
        [DisplayName("Entry Point")]
        public string EntryPoint { get; set; }
    }
    #endregion

    #region Validation
    public static class DataValidation
    {
        public static string ErrorCodeToString(MembershipCreateStatus createStatus)
        {
            // See http://go.microsoft.com/fwlink/?LinkID=177550 for
            // a full list of status codes.
            switch (createStatus)
            {
                case MembershipCreateStatus.DuplicateUserName:
                    return "Username already exists. Please enter a different user name.";

                case MembershipCreateStatus.DuplicateEmail:
                    return "A username for that e-mail address already exists. Please enter a different e-mail address.";

                case MembershipCreateStatus.InvalidPassword:
                    return "The password provided is invalid. Please enter a valid password value.";

                case MembershipCreateStatus.InvalidEmail:
                    return "The e-mail address provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidAnswer:
                    return "The password retrieval answer provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidQuestion:
                    return "The password retrieval question provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidUserName:
                    return "The user name provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.ProviderError:
                    return "The authentication provider returned an error. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

                case MembershipCreateStatus.UserRejected:
                    return "The user creation request has been canceled. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

                default:
                    return "An unknown error occurred. Please verify your entry and try again. If the problem persists, please contact your system administrator.";
            }
        }
    }
    #endregion

}
