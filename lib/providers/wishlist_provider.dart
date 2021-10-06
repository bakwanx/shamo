import 'package:flutter/cupertino.dart';
import 'package:shamo/models/product_model.dart';

class WishListProvider with ChangeNotifier{

  List<ProductModel> _wishlist = [];

  List<ProductModel> get wishList => _wishlist;

  set wishList(List<ProductModel> wishlist){
    _wishlist = wishlist;
    notifyListeners();
  }

  setProduct(ProductModel product){

    if(!isWishlist(product)){
      _wishlist.add(product);
    }else{
      _wishlist.removeWhere(
              (element) => element.id == product.id);
    }
    notifyListeners();

  }

  //check apakah product nya udah ada di wishlist atau belum
  isWishlist(ProductModel product){
    
    if(_wishlist.indexWhere((element) => element.id == product.id) == -1){
      return false;
    }else{
      return true;
    }
    
  }
}