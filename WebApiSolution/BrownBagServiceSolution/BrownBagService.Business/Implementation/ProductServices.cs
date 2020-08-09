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



        public ProductDetailsModel GetProductDetails(int productId, CurrencyTypeName currencyTypeName)
        {
            try
            {
                System.Configuration.AppSettingsReader settingsReader = new AppSettingsReader();
                string host = (string)settingsReader.GetValue("WebHostName", typeof(String));
                using (var productContract = new ProductContract())
                {
                    var product = productContract.GetProductDetails(productId, currencyTypeName);
                    if (product != null && product.ProductImages != null && product.ProductImages.Count() > 0)
                    {
                        product.ProductImages.ForEach(y =>
                        {
                            y.GalleryImageURL = y.GalleryImageURL.Replace("..", host);
                            y.ImageURL = y.ImageURL.Replace("..", host);
                            y.ThumbImageURL = y.ThumbImageURL.Replace("..", host);
                        });
                    }
                    return product;
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
                    if (objProduct.FilterCategories != null)
                    {
                        objProduct.FilterCategories.ForEach(x =>
                        {
                            x.PictureUrl = x.PictureUrl.Replace("..", host);
                        });
                    }
                    if (objProduct.FilterBrands != null)
                    {
                        objProduct.FilterBrands.ForEach(x =>
                        {
                            x.PictureURL = x.PictureURL.Replace("..", host);
                        });
                    }
                    if (objProduct.FilterArtists != null)
                    {
                        objProduct.FilterArtists.ForEach(x =>
                        {
                            x.PictureURL = x.PictureURL.Replace("..", host);
                        });
                    }
                    if (objProduct.FilterVendors != null)
                    {
                        objProduct.FilterVendors.ForEach(x =>
                        {
                            x.PictureURL = x.PictureURL.Replace("..", host);
                        });
                    }
                    return objProduct;
                }
            }
            catch
            {
                throw;
            }
        }
        public bool AddToWishList(int productId, CurrencyTypeName currencyTypeName, string deviceNumber)
        {
            try
            {
                using (var productContract = new ProductContract())
                {
                    var product = productContract.AddToWishList(productId, currencyTypeName, deviceNumber);
                    return product;
                }
            }
            catch
            {
                throw;
            }
        }

        public bool RemoveFromWishList(int productId, string deviceNumber)
        {
            try
            {
                using (var productContract = new ProductContract())
                {
                    var product = productContract.RemoveFromWishList(productId, deviceNumber);
                    return product;
                }
            }
            catch
            {
                throw;
            }
        }

        public List<WishListItem> ShowWishListItems(string deviceNumber)
        {
            try
            {
                System.Configuration.AppSettingsReader settingsReader = new AppSettingsReader();
                string host = (string)settingsReader.GetValue("WebHostName", typeof(String));
                using (var productContract = new ProductContract())
                {
                    var products = productContract.ShowWishListItems(deviceNumber);
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


        public bool AddToCart(int productId, CurrencyTypeName currencyTypeName, string deviceNumber)
        {
            try
            {
                using (var productContract = new ProductContract())
                {
                    var product = productContract.AddToCart(productId, currencyTypeName, deviceNumber);
                    return product;
                }
            }
            catch
            {
                throw;
            }
        }

        public Tuple<bool,CartItemSummary> RemoveFromCart(int productId, string deviceNumber)
        {
            try
            {
                using (var productContract = new ProductContract())
                {
                    var isRemoved = productContract.RemoveFromCart(productId, deviceNumber);
                    if (isRemoved == true)
                    {
                        return Tuple.Create(true, ShowCartItems(deviceNumber));
                    }
                    return Tuple.Create(false, new CartItemSummary());
                }
            }
            catch
            {
                throw;
            }
        }



        public CartItemSummary ShowCartItems(string deviceNumber)
        {
            try
            {
                System.Configuration.AppSettingsReader settingsReader = new AppSettingsReader();
                string host = (string)settingsReader.GetValue("WebHostName", typeof(String));
                using (var productContract = new ProductContract())
                {
                    var products = productContract.ShowCartItems(deviceNumber);
                    products.CartItems.ForEach(x =>
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



        public List<ProductBasicModel> GetProductSuggestions()
        {
            try
            {
                using (var productContract = new ProductContract())
                {
                    var products = productContract.GetProductSuggestions();
                    return products;
                }
            }
            catch
            {
                throw;
            }
        }
    }
}
