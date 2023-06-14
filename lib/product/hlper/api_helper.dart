
import 'dart:convert';

import 'package:advanc_p1/product/model/offer_model.dart';
import 'package:advanc_p1/product/model/product_model.dart';
import 'package:http/http.dart' as http;

class ApiClling
{
  static ApiClling apiClling=ApiClling();
  Future<ProductModel> Product_Api()
  async {
    String link="https://real-time-product-search.p.rapidapi.com/search?q=Nike%20shoes&country=us&language=en";
    var responce=await http.get(Uri.parse(link),headers: {
      "X-RapidAPI-Key":"12dd88f577msh44f44d4113bb7ebp166c90jsn93bf45a939ff",
      "X-RapidAPI-Host":"real-time-product-search.p.rapidapi.com"
    });
    var json=jsonDecode(responce.body);
    ProductModel productModele;
    productModele=ProductModel.fromJson(json);
    return productModele;
  }


  Future<OfferModele> Offer_Api(String id)
  async {
    String link =
        'https://real-time-product-search.p.rapidapi.com/product-offers?product_id=$id&country=us&language=en';
    var response = await http.get(Uri.parse(link), headers: {
      "X-RapidAPI-Key": "12dd88f577msh44f44d4113bb7ebp166c90jsn93bf45a939ff",
      "X-RapidAPI-Host": "real-time-product-search.p.rapidapi.com"
    });
    var json=jsonDecode(response.body);
    OfferModele offerModele=OfferModele.fromJson(json);
    return offerModele;
  }
}