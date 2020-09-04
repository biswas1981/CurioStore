using BrownBagService.DataAccess.DataEntity;
using BrownBagService.DataAccess.DataInterfaces;
using BrownBagService.Model;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace BrownBagService.DataAccess.DataContract
{
    public class ProductContract : BaseDataContract, IProductContract
    {
        public List<ProductSummaryModel> GetProducts(SearchProductModel search, string deviceNo, bool isFeaturedProducts)
        {
            try
            {
                CurrencyTypeName currencyTypeName = search.CurrencyName;
                using (var dataContext = new BrownBagDataEntities())
                {
                    var isExclusiveUser = CheckExclusiveUser(dataContext, deviceNo.Trim());
                    var ratings = dataContext.Ratings.GroupBy(g => g.ProductID).Select(s2 => new { ProductId = s2.Key, Average = s2.Average(p => p.Rating1 ?? 0), ReviewCount = s2.Where(w => string.IsNullOrEmpty(w.Review)).Count() }).ToList();
                    var products = dataContext.Products
                         .Where(w => (isFeaturedProducts == false || w.IsRental == (isFeaturedProducts == true ? 1 : 0))
                         && w.Published == 1
                         && (isExclusiveUser == true || w.IsExclusive == (isExclusiveUser == true ? 1 : 0))
                         && (search.CategoryIds.Count == 0 || (search.CategoryIds.Any(k => k == (w.CategoryID ?? 0))))
                         && (search.BrandIds.Count == 0 || (search.BrandIds.Any(k => k == (w.ManufacturerID ?? 0))))
                         && (search.ArtistIds.Count == 0 || (search.ArtistIds.Any(k => k == (w.ArtistID ?? 0))))
                         && (search.VendorIds.Count == 0 || (search.VendorIds.Any(k => k == (w.VendorID ?? 0))))
                         && (search.ProductSearchText == null || search.ProductSearchText == "" || w.FullDescription.Contains(search.ProductSearchText) || w.ShortDescription.Contains(search.ProductSearchText) || w.ProductName.Contains(search.ProductSearchText))
                         ).AsEnumerable()
                         .Select(s => new ProductSummaryModel
                         {
                             Id = s.Id,
                             CategoryId = s.CategoryID ?? 0,
                             ManufacturerId = s.ManufacturerID ?? 0,
                             ArtistId = s.ArtistID ?? 0,
                             VendorId = s.VendorID ?? 0,
                             CurrencyType = currencyTypeName.ToString(),
                             FullDescription = s.FullDescription ?? "",
                             ProductName = s.ProductName ?? "",
                             ShortDescription = s.ShortDescription ?? "",
                             Discount = s.Discount ?? 0,
                             Stock = s.Stock ?? 0,
                             Price = (currencyTypeName == CurrencyTypeName.INR) ? s.CP_INR ?? 0 : (currencyTypeName == CurrencyTypeName.USD) ? s.CP_USD ?? 0 : (currencyTypeName == CurrencyTypeName.EURO) ? s.CP_Euro ?? 0 : s.CP_GBP ?? 0,
                             ProductImages = dataContext.ProductImages.Where(x => x.ProductID == s.Id).Select(s1 => new Model.ProductImage
                             {
                                 Id = s1.Id,
                                 GalleryImageURL = s1.GalleryImageURL,
                                 ImageURL = s1.ImageURL,
                                 ThumbImageURL = s1.ThumbImageURL,
                                 Sequences = s1.Sequences ?? 0
                             }).OrderBy(o => o.Sequences).ToList(),

                             Rating = ratings.Where(w1 => w1.ProductId == s.Id).Count() > 0 ? ratings.Where(w1 => w1.ProductId == s.Id).FirstOrDefault().Average : 0,
                             ReviewCount = ratings.Where(w1 => w1.ProductId == s.Id).Count() > 0 ? ratings.Where(w1 => w1.ProductId == s.Id).FirstOrDefault().ReviewCount : 0,
                         })
                        .ToList();
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
                using (var dataContext = new BrownBagDataEntities())
                {
                    return dataContext.Products.Where(w => (w.Published ?? 0) == 1).Select(s => new ProductBasicModel
                    {
                        Id = s.Id,
                        ProductName = s.ProductName ?? ""
                    }).ToList();
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
                using (var dataContext = new BrownBagDataEntities())
                {
                    var ratings = dataContext.Ratings.Where(a => a.ProductID == productId && a.ReviewStatus == 1).ToList();
                    ratings.ForEach(a =>
                    {
                        if (a.CustomerName.Trim() == "Gaust")
                        {
                            a.CustomerName = "";
                        }
                    });
                    var productInfo = dataContext.ProductAttributes.Where(a => a.ProductID == productId).ToList();

                    var products = dataContext.Products
                         .Where(w => w.Id == productId).AsEnumerable()
                         .Select(s => new ProductDetailsModel
                         {
                             Id = s.Id,
                             CategoryId = s.CategoryID ?? 0,
                             ManufacturerId = s.ManufacturerID ?? 0,
                             ArtistId = s.ArtistID ?? 0,
                             VendorId = s.VendorID ?? 0,
                             CurrencyType = currencyTypeName.ToString(),
                             FullDescription = s.FullDescription ?? "",
                             ProductName = s.ProductName ?? "",
                             ShortDescription = s.ShortDescription ?? "",
                             Discount = s.Discount ?? 0,
                             Stock = s.Stock ?? 0,
                             Price = (currencyTypeName == CurrencyTypeName.INR) ? s.CP_INR ?? 0 : (currencyTypeName == CurrencyTypeName.USD) ? s.CP_USD ?? 0 : (currencyTypeName == CurrencyTypeName.EURO) ? s.CP_Euro ?? 0 : s.CP_GBP ?? 0,
                             ProductImages = dataContext.ProductImages.Where(x => x.ProductID == s.Id).Select(s1 => new Model.ProductImage
                             {
                                 Id = s1.Id,
                                 GalleryImageURL = s1.GalleryImageURL,
                                 ImageURL = s1.ImageURL,
                                 ThumbImageURL = s1.ThumbImageURL,
                                 Sequences = s1.Sequences ?? 0
                             }).OrderBy(o => o.Sequences).ToList(),

                             Rating = (ratings != null && ratings.Count() > 0) ? ratings.Select(s2 => s2.Rating1 ?? 0).Average() : 0,
                             ReviewCount = (ratings != null && ratings.Count() > 0) ? ratings.Where(s3 => s3.CustomerName != "").Count() : 0,
                             Reviewes = (ratings != null && ratings.Count() > 0) ? ratings.Where(s3 => s3.CustomerName != "").Select(s3 => new ProductRatingModel
                             {
                                 CustomerName = s3.CustomerName ?? "",
                                 DislikeCount = s3.DislikeCount ?? 0,
                                 Id = s3.Id,
                                 LikeCount = s3.LikeCount ?? 0,
                                 ProductID = s3.ProductID ?? 0,
                                 Rating = s3.Rating1 ?? 0,
                                 ReviewText = s3.Review ?? "",
                                 ReviewTitle = s3.ReviewTitle ?? ""
                             }).ToList() : new List<ProductRatingModel>(),
                             BrandName = dataContext.Manufacturers.Where(s4 => s4.Id == (s.ManufacturerID ?? 0)).Select(s4 => s4.ManufacturerName).FirstOrDefault() ?? "",
                             ArtistName = dataContext.Artists.Where(s4 => s4.Id == (s.ArtistID ?? 0)).Select(s4 => s4.Artists).FirstOrDefault() ?? "",
                             VendorName = dataContext.Vendors.Where(s4 => s4.Id == (s.VendorID ?? 0)).Select(s4 => s4.VendorName).FirstOrDefault() ?? "",
                             CategoryName = dataContext.Categories.Where(s4 => s4.Id == (s.CategoryID ?? 0)).Select(s4 => s4.Name).FirstOrDefault() ?? "",
                             ProductInformation = (productInfo != null && productInfo.Count() > 0) ? productInfo.Select(s4 => s4.ProductInformation).FirstOrDefault() ?? "" : "",
                             ShippingReturns = "We deliver to over 100 countries around the world. For full details of the delivery options we offer, please view our Delivery information We hope you’ll love every purchase,but if you ever need to return an item you can do so within a month of receipt.For full details of how to make a return, please view our Returns information",
                             SocialMedias = dataContext.SocialMedias.Select(s4 => new SocialMediaModel
                             {
                                 Facebook = s4.Facebook ?? "",
                                 Instagram = s4.Instagram ?? "",
                                 Twitter = s4.Twitter ?? "",
                                 Youtube = s4.Youtube ?? ""
                             }).ToList()
                         })
                        .ToList();
                    return products.FirstOrDefault();
                }
            }
            catch
            {
                throw;
            }
        }

        public List<RootCategoryModel> GetRootCategories()
        {
            using (var dataContext = new BrownBagDataEntities())
            {
                var rootCategories = dataContext.Categories.Where(a => a.Id == a.RootCategory && a.Published == 1).ToList();
                var allCategories = dataContext.Categories.Where(a => a.Published == 1).ToList();
                return rootCategories.Select(s => new RootCategoryModel
                {
                    CategoryId = s.Id,
                    CategoryDescription = s.Description ?? "",
                    CategoryName = s.Name ?? "",
                    DisplayOrder = s.Display_Order ?? 0,
                    ParentCategoryId = s.ParentCategoryId ?? 0,
                    PictureUrl = s.PictureUrl ?? "",
                    RootCategoryId = s.RootCategory ?? 0,
                    RootTree = s.TempPID ?? "",
                    ChildCategories = allCategories.Where(a => a.RootCategory == s.Id).Select(s1 => s1.Id).ToList(),
                }).ToList();
            }
        }





        public List<CategoryModel> GetFilterCategory(List<ProductSummaryModel> products)
        {
            List<int> categoryIds = new List<int>();
            if (products != null && products.Count() > 0)
            {
                categoryIds = products.Select(s => s.CategoryId).Distinct().ToList();
                using (var dataContext = new BrownBagDataEntities())
                {
                    var selectedCategories = dataContext.Categories.Where(a => categoryIds.Any(b => b == a.Id)).ToList();
                    var rootIds = selectedCategories.Select(s => s.RootCategory ?? 0).Distinct().ToList();
                    return dataContext.Categories.Where(w => rootIds.Any(r => r == w.RootCategory))
                        .AsEnumerable()
                        .Select(s => new CategoryModel
                        {
                            CategoryId = s.Id,
                            CategoryDescription = s.Description ?? "",
                            CategoryName = s.Name ?? "",
                            DisplayOrder = s.Display_Order ?? 0,
                            ParentCategoryId = s.ParentCategoryId ?? 0,
                            PictureUrl = s.PictureUrl ?? "",
                            RootCategoryId = s.RootCategory ?? 0,
                            RootTree = s.TempPID ?? "",
                            ProductCount = products.Where(a => a.CategoryId == s.Id).Count()
                        }).ToList();
                }
            }
            else
            {
                return null;
            }
        }

        public List<BrandModel> GetFilterBrand(List<ProductSummaryModel> products)
        {
            List<int> brandIds = new List<int>();
            if (products != null && products.Count() > 0)
            {
                brandIds = products.Select(s => s.ManufacturerId).Distinct().ToList();
                using (var dataContext = new BrownBagDataEntities())
                {
                    var selectedBrands = dataContext.Manufacturers.Where(a => brandIds.Any(b => b == a.Id))
                        .AsEnumerable()
                        .Select(s => new BrandModel
                        {
                            BrandId = s.Id,
                            Description = s.Description ?? "",
                            BrandName = s.ManufacturerName ?? "",
                            DisplayOrder = s.DisplayOrder ?? 0,
                            PictureURL = s.PictureURL ?? "",
                            ProductCount = products.Where(a => a.ManufacturerId == s.Id).Count()
                        }).ToList();
                    return selectedBrands;
                }
            }
            else
            {
                return null;
            }
        }

        public List<ArtistsModel> GetFilterArtists(List<ProductSummaryModel> products)
        {
            List<int> artistIds = new List<int>();
            if (products != null && products.Count() > 0)
            {
                artistIds = products.Select(s => s.ArtistId).Distinct().ToList();
                using (var dataContext = new BrownBagDataEntities())
                {
                    var selectedArtists = dataContext.Artists.Where(a => artistIds.Any(b => b == a.Id))
                         .AsEnumerable()
                        .Select(s => new ArtistsModel
                        {
                            ArtistsId = s.Id,
                            Description = s.Description ?? "",
                            ArtistName = s.Artists ?? "",
                            PictureURL = s.PictureURL ?? "",
                            ProductCount = products.Where(a => a.ArtistId == s.Id).Count()
                        }).ToList();
                    return selectedArtists;
                }
            }
            else
            {
                return null;
            }
        }

        public List<VendorsModel> GetFilterVendors(List<ProductSummaryModel> products)
        {
            List<int> vendorIds = new List<int>();
            if (products != null && products.Count() > 0)
            {
                vendorIds = products.Select(s => s.VendorId).Distinct().ToList();
                using (var dataContext = new BrownBagDataEntities())
                {
                    var selectedArtists = dataContext.Vendors.Where(a => vendorIds.Any(b => b == a.Id))
                         .AsEnumerable()
                        .Select(s => new VendorsModel
                        {
                            VendorId = s.Id,
                            Description = s.Description ?? "",
                            VendorName = s.VendorName ?? "",
                            PictureURL = s.PictureURL ?? "",
                            VendorAddress = s.VendorAddress ?? "",
                            VendorEmail = s.VendorEmail ?? "",
                            ProductCount = products.Where(a => a.VendorId == s.Id).Count()
                        }).ToList();
                    return selectedArtists;
                }
            }
            else
            {
                return null;
            }
        }

        public bool AddToWishList(int productId, CurrencyTypeName currencyTypeName, string deviceNumber)
        {
            try
            {
                using (var dataContext = new BrownBagDataEntities())
                {
                    var userInfo = dataContext.DeviceRegistrations.Where(a => a.IMEI_Number == deviceNumber).FirstOrDefault();
                    if (userInfo != null && userInfo.RefCustomerGuid != null)
                    {
                        var product = dataContext.Products.Where(a => a.Id == productId).FirstOrDefault();
                        if (product != null)
                        {
                            var itemPrice = (currencyTypeName == CurrencyTypeName.INR) ? product.CP_INR ?? 0 : (currencyTypeName == CurrencyTypeName.USD) ? product.CP_USD ?? 0 : (currencyTypeName == CurrencyTypeName.EURO) ? product.CP_Euro ?? 0 : product.CP_GBP ?? 0;
                            Wishlist wishlistItem = new Wishlist
                            {
                                CreatedOnUtc = DateTime.Now.ToUniversalTime(),
                                UpdatedOnUtc = DateTime.Now.ToUniversalTime(),
                                Currency = currencyTypeName.ToString(),
                                CustomerGUID = userInfo.RefCustomerGuid.Value.ToString(),
                                ProductID = productId,
                                ProductPrice = itemPrice
                            };
                            dataContext.Wishlists.Add(wishlistItem);
                            return dataContext.SaveChanges() > 0 ? true : false;
                        }
                        else
                        {
                            return false;
                        }
                    }
                    else
                    {
                        return false;
                    }
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
                using (var dataContext = new BrownBagDataEntities())
                {
                    var userInfo = dataContext.DeviceRegistrations.Where(a => a.IMEI_Number == deviceNumber).FirstOrDefault();
                    if (userInfo != null && userInfo.RefCustomerGuid != null)
                    {
                        var product = dataContext.Products.Where(a => a.Id == productId).FirstOrDefault();
                        if (product != null)
                        {
                            var item = dataContext.Wishlists.Where(a => a.ProductID == productId && a.CustomerGUID == userInfo.RefCustomerGuid.Value.ToString()).FirstOrDefault();
                            if (item != null)
                            {
                                dataContext.Wishlists.Remove(item);
                                return dataContext.SaveChanges() > 0 ? true : false;
                            }
                            return false;
                        }
                        else
                        {
                            return false;
                        }
                    }
                    else
                    {
                        return false;
                    }
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
                List<WishListItem> items = new List<WishListItem>();
                using (var dataContext = new BrownBagDataEntities())
                {
                    var userInfo = dataContext.DeviceRegistrations.Where(a => a.IMEI_Number == deviceNumber).FirstOrDefault();
                    if (userInfo != null && userInfo.RefCustomerGuid != null)
                    {
                        var wishListItems = dataContext.Wishlists.Where(a => a.CustomerGUID == userInfo.RefCustomerGuid.ToString()).ToList();
                        if (wishListItems != null && wishListItems.Count() > 0)
                        {
                            wishListItems.ForEach(x =>
                            {
                                var product = dataContext.Products.Where(a => a.Id == x.ProductID).FirstOrDefault();
                                if (product != null)
                                {
                                    items.Add(new WishListItem
                                    {
                                        CurrencyType = x.Currency ?? "",
                                        Price = x.ProductPrice ?? 0,
                                        ProductId = x.ProductID ?? 0,
                                        ProductName = product.ProductName ?? "",
                                        Stock = product.Stock ?? 0,
                                        StockStatus = (product.Stock ?? 0) > 1 ? StockStatus.InStock.GetDescription() : (product.Stock ?? 0) == 1 ? StockStatus.LowStock.GetDescription() : StockStatus.OutOfStock.GetDescription(),
                                        ProductImages = dataContext.ProductImages.Where(b => b.ProductID == product.Id).Select(s => new Model.ProductImage
                                        {
                                            Id = s.Id,
                                            GalleryImageURL = s.GalleryImageURL ?? "",
                                            ImageURL = s.ImageURL ?? "",
                                            Sequences = s.Sequences ?? 0,
                                            ThumbImageURL = s.ThumbImageURL ?? ""
                                        }).ToList()
                                    });
                                }
                            });
                            return items;
                        }
                        else
                        {
                            return null;
                        }
                    }
                    else
                    {
                        return null;
                    }
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
                using (var dataContext = new BrownBagDataEntities())
                {
                    var userInfo = dataContext.DeviceRegistrations.Where(a => a.IMEI_Number == deviceNumber).FirstOrDefault();
                    if (userInfo != null && userInfo.RefCustomerGuid != null)
                    {
                        var product = dataContext.Products.Where(a => a.Id == productId).FirstOrDefault();
                        if (product != null)
                        {
                            if (product.Stock > 0)
                            {
                                var itemPrice = (currencyTypeName == CurrencyTypeName.INR) ? product.CP_INR ?? 0 : (currencyTypeName == CurrencyTypeName.USD) ? product.CP_USD ?? 0 : (currencyTypeName == CurrencyTypeName.EURO) ? product.CP_Euro ?? 0 : product.CP_GBP ?? 0;
                                ShoppingCartItem cartItem = new ShoppingCartItem
                                {
                                    CreatedOnUtc = DateTime.Now.ToUniversalTime(),
                                    UpdatedOnUtc = DateTime.Now.ToUniversalTime(),
                                    Currency = currencyTypeName.ToString(),
                                    Customer_Id = userInfo.RefCustomerGuid.Value,
                                    ProductId = productId,
                                    ProductPrice = itemPrice,
                                    Quantity = 1,
                                    RevisedPrice = 0
                                };
                                dataContext.ShoppingCartItems.Add(cartItem);
                                return dataContext.SaveChanges() > 0 ? true : false;
                            }
                            else
                            {
                                return false;
                            }
                        }
                        else
                        {
                            return false;
                        }
                    }
                    else
                    {
                        return false;
                    }
                }
            }
            catch
            {
                throw;
            }
        }

        public bool RemoveFromCart(int productId, string deviceNumber)
        {
            try
            {
                using (var dataContext = new BrownBagDataEntities())
                {
                    var userInfo = dataContext.DeviceRegistrations.Where(a => a.IMEI_Number == deviceNumber).FirstOrDefault();
                    if (userInfo != null && userInfo.RefCustomerGuid != null)
                    {
                        var product = dataContext.Products.Where(a => a.Id == productId).FirstOrDefault();
                        if (product != null)
                        {
                            var item = dataContext.ShoppingCartItems.Where(a => a.ProductId == productId && a.Customer_Id == userInfo.RefCustomerGuid.Value).FirstOrDefault();
                            if (item != null)
                            {
                                dataContext.ShoppingCartItems.Remove(item);
                                return dataContext.SaveChanges() > 0 ? true : false;
                            }
                            return false;
                        }
                        else
                        {
                            return false;
                        }
                    }
                    else
                    {
                        return false;
                    }
                }
            }
            catch
            {
                throw;
            }
        }

        public CartItemSummary ShowCartItems(string deviceNumber, string cuponCode)
        {
            try
            {
                var items = new List<CartItemDetails>();
                using (var dataContext = new BrownBagDataEntities())
                {
                    var userInfo = dataContext.DeviceRegistrations.Where(a => a.IMEI_Number == deviceNumber).FirstOrDefault();
                    if (userInfo != null && userInfo.RefCustomerGuid != null)
                    {
                        var cartListItems = dataContext.ShoppingCartItems.Where(a => a.Customer_Id == userInfo.RefCustomerGuid).ToList();
                        if (cartListItems != null && cartListItems.Count() > 0)
                        {
                            cartListItems.ForEach(x =>
                            {
                                var product = dataContext.Products.Where(a => a.Id == x.ProductId).FirstOrDefault();
                                if (product != null)
                                {
                                    items.Add(new CartItemDetails
                                    {
                                        CurrencyType = x.Currency ?? "",
                                        Price = x.ProductPrice ?? 0,
                                        ProductId = x.ProductId ?? 0,
                                        ProductName = product.ProductName ?? "",
                                        Stock = product.Stock ?? 0,
                                        StockStatus = (product.Stock ?? 0) > 1 ? StockStatus.InStock.GetDescription() : (product.Stock ?? 0) == 1 ? StockStatus.LowStock.GetDescription() : StockStatus.OutOfStock.GetDescription(),
                                        ProductImages = dataContext.ProductImages.Where(b => b.ProductID == product.Id).Select(s => new Model.ProductImage
                                        {
                                            Id = s.Id,
                                            GalleryImageURL = s.GalleryImageURL ?? "",
                                            ImageURL = s.ImageURL ?? "",
                                            Sequences = s.Sequences ?? 0,
                                            ThumbImageURL = s.ThumbImageURL ?? ""
                                        }).ToList()
                                    });
                                }
                            });
                            return new CartItemSummary
                            {
                                CartItems = items,
                                CartCalculation = CalculateCartPrice(items, cuponCode, userInfo.RefCustomerGuid.Value, dataContext)
                            };
                        }
                        else
                        {
                            return null;
                        }
                    }
                    else
                    {
                        return null;
                    }
                }
            }
            catch
            {
                throw;
            }
        }

        private bool CheckExclusiveUser(BrownBagDataEntities dataContext, string deviceNo)
        {
            bool IsExclusiveUser = false;
            var deviceInfo = dataContext.DeviceRegistrations.Where(a => a.IMEI_Number == deviceNo).FirstOrDefault();
            if (deviceInfo != null && deviceInfo.RefCustomerGuid != null)
            {
                var userInfo = dataContext.Customers.Where(a => a.CustomerGuid == deviceInfo.RefCustomerGuid).FirstOrDefault();
                if (userInfo != null)
                {
                    IsExclusiveUser = (userInfo.IsSystemAccount ?? 0) > 0 ? true : false;
                }
            }
            return IsExclusiveUser;
        }

        private CartCalculationModel CalculateCartPrice(List<CartItemDetails> items, string cuponCode, Guid customerId, BrownBagDataEntities dataContext)
        {
            var taxHead = dataContext.TaxCategories.Where(x => x.IsActive.Value == 1).Select(s => new TaxComponant
            {
                TaxHeadId = s.Id,
                TaxHeadName = s.TaxCategory1,
                TaxPercentage = s.Percentage ?? 0
            }).ToList();
            var shippingValueRate = 0.05M;
            var subTotalPrice = items.Where(a => a.Stock > 0).Sum(s => s.Price);
            var totalTax = taxHead.Sum(s => (s.TaxPercentage / 100) * subTotalPrice);
            var shippingValue = subTotalPrice * shippingValueRate;
            var discount = GetDiscountValue(items, customerId.ToString(), cuponCode, dataContext);
            var calculation = new CartCalculationModel
            {
                Discount = discount,
                SubTotal = subTotalPrice,
                TaxHeads = taxHead,
                TaxTotal = totalTax,
                ShippingValue = shippingValue,
                TotalAmount = subTotalPrice + totalTax + shippingValue - discount
            };
            return calculation;
        }

        private decimal GetDiscountValue(List<CartItemDetails> items, string customerId, string cuponCode, BrownBagDataEntities dataContext)
        {
            var discountItems = dataContext.Coupons
                .Where(a =>
                a.Coupon1 == cuponCode
                && a.CustomerGUID == customerId
                && (a.ProductID == null || items.Where(w => w.Stock > 0).Any(b => b.ProductId == a.ProductID)))
                .Select(s => new { ItemId = s.ProductID, DiscountValue = s.CouponValue ?? 0 }).ToList();
            var totalDiscountValue = (discountItems != null && discountItems.Count() > 0) ? discountItems.Sum(s => s.DiscountValue) : 0;
            return totalDiscountValue;
        }

    }
}
