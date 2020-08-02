using BrownBagService.DataAccess.DataEntity;
using BrownBagService.DataAccess.DataInterfaces;
using BrownBagService.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BrownBagService.DataAccess.DataContract
{
    public class BannerContract : BaseDataContract, IBannerContract
    {
        public List<BannerModel> GetAllBanners()
        {
            try
            {
                using (var dataContext = new BrownBagDataEntities())
                {
                   var banners = dataContext.Banners
                        .Select(s => new BannerModel
                        {
                            Id = s.Id,
                            Sequences = s.Sequences == null ? 0 : s.Sequences.Value,
                            BannerLink = s.BannerLink ?? "",
                            BannerText = s.BannerText ?? "",
                            BannerURL = s.BannerURL ?? ""
                        })
                        .OrderBy(o => o.Sequences).ToList();

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
