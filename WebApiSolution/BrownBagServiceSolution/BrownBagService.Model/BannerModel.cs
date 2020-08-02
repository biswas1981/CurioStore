using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BrownBagService.Model
{
    public class BannerModel
    {
        public int Id { get; set; }
        public string BannerURL { get; set; }
        public int Sequences { get; set; }
        public string BannerText { get; set; }
        public string BannerLink { get; set; }
    }
}
