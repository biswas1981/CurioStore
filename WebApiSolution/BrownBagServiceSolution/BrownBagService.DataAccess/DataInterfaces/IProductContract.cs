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
        bool AddToWishList(int productId, CurrencyTypeName currencyTypeName, string deviceNumber);
        List<WishListItem> ShowWishListItems(string deviceNumber);
        List<ProductBasicModel> GetProductSuggestions();
        bool RemoveFromWishList(int productId, string deviceNumber);
        bool AddToCart(int productId, CurrencyTypeName currencyTypeName, string deviceNumber);
        bool RemoveFromCart(int productId, string deviceNumber);
    }
}
