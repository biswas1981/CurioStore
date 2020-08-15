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
        bool AddToWishList(int productId, CurrencyTypeName currencyTypeName, string deviceNumber);
        List<WishListItem> ShowWishListItems(string deviceNumber);
        List<ProductBasicModel> GetProductSuggestions();
        bool RemoveFromWishList(int productId, string deviceNumber);
        bool AddToCart(int productId, CurrencyTypeName currencyTypeName, string deviceNumber);
        Tuple<bool, CartItemSummary> RemoveFromCart(int productId, string deviceNumber, string cuponCode = "");
        CartItemSummary ShowCartItems(string deviceNumber, string cuponCode = "");
    }
}
