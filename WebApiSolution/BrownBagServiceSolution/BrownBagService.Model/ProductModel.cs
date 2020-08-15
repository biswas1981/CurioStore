using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace BrownBagService.Model
{

    public class ProductBasicModel
    {
        public int Id { get; set; }
        public string ProductName { get; set; }
    }

    public class ProductSummaryModel : ProductBasicModel
    {

        public int CategoryId { get; set; }
        public int ManufacturerId { get; set; }
        public int ArtistId { get; set; }
        public int VendorId { get; set; }

        public string ShortDescription { get; set; }
        public string FullDescription { get; set; }
        public decimal Price { get; set; }
        public decimal Discount { get; set; }
        public string CurrencyType { get; set; }
        public int Stock { get; set; }
        public double Rating { get; set; }
        public int ReviewCount { get; set; }
        public List<ProductImage> ProductImages { get; set; }

    }

    public class SocialMediaModel
    {
        public string Facebook { get; set; }
        public string Twitter { get; set; }
        public string Youtube { get; set; }
        public string Instagram { get; set; }
    }

    public class ProductDetailsModel : ProductSummaryModel
    {
        public string ShippingReturns { get; set; }
        public string ProductInformation { get; set; }
        public string CategoryName { get; set; }
        public string VendorName { get; set; }
        public string ArtistName { get; set; }
        public string BrandName { get; set; }
        public List<ProductRatingModel> Reviewes { get; set; }
        public List<SocialMediaModel> SocialMedias { get; set; }

    }

    public class ProductRatingModel
    {
        public int Id { get; set; }
        public int ProductID { get; set; }
        public string CustomerName { get; set; }
        public double Rating { get; set; }
        public string ReviewTitle { get; set; }
        public string ReviewText { get; set; }
        public int LikeCount { get; set; }
        public int DislikeCount { get; set; }
    }

    public class ProductDetailsSummaryModel
    {
        public List<ProductSummaryModel> ProductList { get; set; }
        public List<CategoryModel> FilterCategories { get; set; }
        public List<BrandModel> FilterBrands { get; set; }
        public List<ArtistsModel> FilterArtists { get; set; }
        public List<VendorsModel> FilterVendors { get; set; }
    }


    public class VendorsModel
    {
        public int VendorId { get; set; }
        public string VendorName { get; set; }
        public string Description { get; set; }
        public string PictureURL { get; set; }
        public string VendorEmail { get; set; }
        public string VendorAddress { get; set; }
        public int ProductCount { get; set; }
    }



    public class ArtistsModel
    {
        public int ArtistsId { get; set; }
        public string ArtistName { get; set; }
        public string Description { get; set; }
        public string PictureURL { get; set; }
        public int ProductCount { get; set; }
    }

    public class BrandModel
    {
        public int BrandId { get; set; }
        public string BrandName { get; set; }
        public string Description { get; set; }
        public string PictureURL { get; set; }
        public int DisplayOrder { get; set; }
        public int ProductCount { get; set; }
    }


    public class BaseCategoryModel
    {
        public int CategoryId { get; set; }
        public int RootCategoryId { get; set; }
        public int ParentCategoryId { get; set; }
        public string CategoryName { get; set; }
        public string CategoryDescription { get; set; }
        public string PictureUrl { get; set; }
        public int DisplayOrder { get; set; }
        public string RootTree { get; set; }

    }

    public class CategoryModel : BaseCategoryModel
    {
        public int ProductCount { get; set; }
    }
    public class RootCategoryModel : BaseCategoryModel
    {
        public List<int> ChildCategories { get; set; }
    }


    public class ProductImage
    {
        public int Id { get; set; }
        public string ImageURL { get; set; }
        public string ThumbImageURL { get; set; }
        public string GalleryImageURL { get; set; }
        public int Sequences { get; set; }
    }

    public class SearchProductModel
    {
        public SearchProductModel()
        {
            this.ArtistIds = new List<int>();
            this.BrandIds = new List<int>();
            this.CategoryIds = new List<int>();
            this.VendorIds = new List<int>();
        }

        [Required(ErrorMessage = "Must mention currency type name")]
        public CurrencyTypeName CurrencyName { get; set; }
        public List<int> CategoryIds { get; set; }
        public List<int> BrandIds { get; set; }
        public List<int> ArtistIds { get; set; }
        public List<int> VendorIds { get; set; }
        public string ProductSearchText { get; set; }

    }

    public class WishListItem
    {
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public List<ProductImage> ProductImages { get; set; }
        public decimal Price { get; set; }
        public string CurrencyType { get; set; }
        public int Stock { get; set; }
        public string StockStatus { get; set; }
    }


    public class CartItemSummary
    {
        public List<CartItemDetails> CartItems { get; set; }
        public CartCalculationModel CartCalculation { get; set; }
    }
    public class CartItemDetails
    {
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public List<ProductImage> ProductImages { get; set; }
        public decimal Price { get; set; }
        public string CurrencyType { get; set; }
        public int Stock { get; set; }
        public string StockStatus { get; set; }
        

    }

    public enum CurrencyTypeName
    {
        INR = 1,
        USD = 2,
        EURO = 3,
        GBP = 4
    }
    public enum StockStatus
    {
        [Description("In Stock")]
        InStock = 1,
        [Description("Low Stock")]
        LowStock = 2,
        [Description("Out Of Stock")]
        OutOfStock = 3

    }
    public static class EnumDescription
    {
        public static string GetDescription(this Enum value)
        {
            FieldInfo field = value.GetType().GetField(value.ToString());
            object[] attribs = field.GetCustomAttributes(typeof(DescriptionAttribute), true);
            if (attribs.Length > 0)
            {
                return ((DescriptionAttribute)attribs[0]).Description;
            }
            return string.Empty;
        }
    }

    public abstract class c1 : CartItemDetails
    {
        public abstract void f1();
    }
}
