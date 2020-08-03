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
    public class ProductServices : IProductServices
    {
        public List<ProductSummaryModel> GetFeaturedProducts(CurrencyTypeName currencyTypeName, string deviceNo)
        {
            try
            {
                System.Configuration.AppSettingsReader settingsReader = new AppSettingsReader();
                string host = (string)settingsReader.GetValue("WebHostName", typeof(String));
                var search = new SearchProductModel
                {
                    CurrencyName = currencyTypeName,
                };
                using (var productContract = new ProductContract())
                {
                    var products = productContract.GetProducts(search, deviceNo, true);
                    products.ForEach(x =>
                    {
                        x.ProductImages.ForEach(y =>
                        {
                            y.GalleryImageURL = y.GalleryImageURL.Replace("..", host);
                            y.ImageURL = y.ImageURL.Replace("..", host);
                            y.ThumbImageURL = y.ThumbImageURL.Replace("..", host);
                        });
                    });
                    return products;
                }
            }
            catch
            {
                throw;
            }
        }

        public List<RootCategoryModel> GetRootCategories()
        {
            try
            {
                System.Configuration.AppSettingsReader settingsReader = new AppSettingsReader();
                string host = (string)settingsReader.GetValue("WebHostName", typeof(String));
                using (var productContract = new ProductContract())
                {
                    var categories = productContract.GetRootCategories();
                    categories.ForEach(x =>
                    {
                        x.PictureUrl = x.PictureUrl.Replace("..", host);
                    });
                    return categories;
                }
            }
            catch
            {
                throw;
            }
        }






        public ProductDetailsSummaryModel GetAllProducts(SearchProductModel search, string deviceNo)
        {
            try
            {
                ProductDetailsSummaryModel objProduct = new ProductDetailsSummaryModel();
                System.Configuration.AppSettingsReader settingsReader = new AppSettingsReader();
                string host = (string)settingsReader.GetValue("WebHostName", typeof(String));
                using (var productContract = new ProductContract())
                {
                    var products = productContract.GetProducts(search, deviceNo, false);
                    objProduct.ProductList = products;
                    objProduct.FilterCategories = productContract.GetFilterCategory(products);
                    objProduct.FilterBrands = productContract.GetFilterBrand(products);
                    objProduct.FilterArtists = productContract.GetFilterArtists(products);
                    objProduct.FilterVendors = productContract.GetFilterVendors(products);

                    objProduct.ProductList.ForEach(x =>
                    {
                        x.ProductImages.ForEach(y =>
                        {
                            y.GalleryImageURL = y.GalleryImageURL.Replace("..", host);
                            y.ImageURL = y.ImageURL.Replace("..", host);
                            y.ThumbImageURL = y.ThumbImageURL.Replace("..", host);
                        });
                    });

                    objProduct.FilterCategories.ForEach(x =>
                    {
                        x.PictureUrl = x.PictureUrl.Replace("..", host);
                    });
                    objProduct.FilterBrands.ForEach(x =>
                    {
                        x.PictureURL = x.PictureURL.Replace("..", host);
                    });
                    objProduct.FilterArtists.ForEach(x =>
                    {
                        x.PictureURL = x.PictureURL.Replace("..", host);
                    });
                    objProduct.FilterVendors.ForEach(x =>
                    {
                        x.PictureURL = x.PictureURL.Replace("..", host);
                    });

                    return objProduct;
                }
            }
            catch
            {
                throw;
            }
        }
    }
}
