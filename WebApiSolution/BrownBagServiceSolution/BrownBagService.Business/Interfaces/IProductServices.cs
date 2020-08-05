using BrownBagService.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BrownBagService.Business.Interfaces
{
    public interface IProductServices
    {
        List<ProductSummaryModel> GetFeaturedProducts(CurrencyTypeName currencyTypeName, string deviceNo);
        ProductDetailsSummaryModel GetAllProducts(SearchProductModel search, string deviceNo);
        List<RootCategoryModel> GetRootCategories();
        ProductDetailsModel GetProductDetails(int productId, CurrencyTypeName currencyTypeName);
    }
}
