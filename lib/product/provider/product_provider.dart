import 'package:advanc_p1/product/hlper/api_helper.dart';
import 'package:advanc_p1/product/model/offer_model.dart';
import 'package:advanc_p1/product/model/product_model.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider extends ChangeNotifier
{
  Future<ProductModel> productApi()
  async {
    return await ApiClling.apiClling.Product_Api();
  }

  // Future<OfferModele> offerApi()
  // async {
  //   return await ApiClling.apiClling.Offer_Api(id);
  // }
}