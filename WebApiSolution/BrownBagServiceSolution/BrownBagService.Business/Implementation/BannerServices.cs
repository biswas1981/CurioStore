using BrownBagService.Business.Interfaces;
using BrownBagService.DataAccess.DataContract;
using BrownBagService.Model;
using System;
using System.Collections.Generic;
using System.Configuration;
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
                System.Configuration.AppSettingsReader settingsReader = new AppSettingsReader();
                string host = (string)settingsReader.GetValue("WebHostName", typeof(String));
                using (var bannerContract = new BannerContract())
                {
                    var banners = bannerContract.GetAllBanners();
                    banners.ForEach(x => {
                         x.BannerURL = x.BannerURL.Replace("..", host);
                    });
                    return banners;
                }
            }
            catch
            {
                throw;
            }
        }
    }
}
