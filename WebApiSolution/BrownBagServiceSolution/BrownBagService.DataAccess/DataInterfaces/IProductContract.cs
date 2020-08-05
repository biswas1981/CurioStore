using BrownBagService.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BrownBagService.DataAccess.DataInterfaces
{
    public interface IProductContract
    {
        List<ProductSummaryModel> GetProducts(SearchProductModel search, string deviceNo, bool isFeaturedProducts);
        List<CategoryModel> GetFilterCategory(List<ProductSummaryModel> products);
        List<BrandModel> GetFilterBrand(List<ProductSummaryModel> products);
        List<ArtistsModel> GetFilterArtists(List<ProductSummaryModel> products);
        List<VendorsModel> GetFilterVendors(List<ProductSummaryModel> products);
        List<RootCategoryModel> GetRootCategories();
        ProductDetailsModel GetProductDetails(int productId, CurrencyTypeName currencyTypeName);
    }
}
