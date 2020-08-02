using BrownBagService.Business.Interfaces;
using BrownBagService.DataAccess.DataContract;
using BrownBagService.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BrownBagService.Business.Implementation
{
    public class BannerServices : IBannerServices
    {
        public List<BannerModel> GetAllBanners()
        {
            try
            {
                using (var bannerContract = new BannerContract())
                {
                    return bannerContract.GetAllBanners();
                }
            }
            catch
            {
                throw;
            }
        }
    }
}
