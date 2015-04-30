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
    public class TestimonialModel
    {
        [DisplayName("Testimonials")]
        public string Testimonials{ get; set; }

        [Required]
        [DisplayName("Content")]
        public string Content { get; set; }
    }

}
