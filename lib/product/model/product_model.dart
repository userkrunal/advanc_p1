import 'package:flutter/material.dart';

// class ProductModel
// {
//   List<dynamic>? dataList;
//
//   ProductModel({this.dataList});
//   factory ProductModel.fromjson(Map m1)
//   {
//     return ProductModel(dataList:m1["data"].map((e)=>Data.fromjson(e)).toList());
//   }
//
//
// }
//
// class Data
// {
//   String? productId;
//   String? productIdV2;
//   String? productTitle;
//   String? productDescription;
//   List? productPhotos;
//   double? productRating;
//   // String? offer;
//
//   Data(
//       {this.productId,
//       this.productIdV2,
//       this.productTitle,
//       this.productDescription,
//       this.productPhotos,
//         this.offer,
//       this.productRating});
//   factory Data.fromjson(Map m1)
//   {
//     return Data(productId:m1["productId"],productDescription: m1["productDescription"],productTitle: m1["productTitle"],productPhotos: m1["productPhotos"]);
//   }
// }
// class Offer
// ,offer: m1["offer"].map((e)=>Offer.fromjson(e)).toList()
// {
//   String? storeName;
//   double? storeRating;
//   String? price;
//   String? shipping;
//   String? tax;
//   bool? onSale;
//
//   Offer(
//       {this.storeName,
//       this.storeRating,
//       this.price,
//       this.shipping,
//       this.tax,
//       this.onSale});
//   factory Offer.fromjson(Map m1)
//   {
//     return Offer(price: m1["price"],storeName: m1["storeName"],tax: m1["tax"]);
//   }
// }



// class
// To parse this JSON data, do
//
//     final ProductModel = ProductModelFromJson(jsonString);

import 'dart:convert';

ProductModel ProductModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String ProductModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  String? status;
  String? requestId;
  List<Datum>? data;

  ProductModel({
    this.status,
    this.requestId,
    this.data,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    status: json["status"],
    requestId: json["request_id"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "request_id": requestId,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? productId;
  String? productIdV2;
  String? productTitle;
  String? productDescription;
  List<String>? productPhotos;
  ProductAttributes? productAttributes;
  double? productRating;
  String? productPageUrl;
  String? productOffersPageUrl;
  String? productSpecsPageUrl;
  String? productReviewsPageUrl;
  int? productNumReviews;
  List<String>? typicalPriceRange;
  Offer? offer;

  Datum({
    this.productId,
    this.productIdV2,
    this.productTitle,
    this.productDescription,
    this.productPhotos,
    this.productAttributes,
    this.productRating,
    this.productPageUrl,
    this.productOffersPageUrl,
    this.productSpecsPageUrl,
    this.productReviewsPageUrl,
    this.productNumReviews,
    this.typicalPriceRange,
    this.offer,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    productId: json["product_id"],
    productIdV2: json["product_id_v2"],
    productTitle: json["product_title"],
    productDescription: json["product_description"],
    productPhotos: json["product_photos"] == null ? [] : List<String>.from(json["product_photos"]!.map((x) => x)),
    // productAttributes: json["product_attributes"] == null ? null : ProductAttributes.fromJson(json["product_attributes"]),
    productRating: json["product_rating"]?.toDouble(),
    productPageUrl: json["product_page_url"],
    productOffersPageUrl: json["product_offers_page_url"],
    productSpecsPageUrl: json["product_specs_page_url"],
    productReviewsPageUrl: json["product_reviews_page_url"],
    productNumReviews: json["product_num_reviews"],
    typicalPriceRange: json["typical_price_range"] == null ? [] : List<String>.from(json["typical_price_range"]!.map((x) => x)),
    offer: json["offer"] == null ? null : Offer.fromJson(json["offer"]),
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "product_id_v2": productIdV2,
    "product_title": productTitle,
    "product_description": productDescription,
    "product_photos": productPhotos == null ? [] : List<dynamic>.from(productPhotos!.map((x) => x)),
    "product_attributes": productAttributes?.toJson(),
    "product_rating": productRating,
    "product_page_url": productPageUrl,
    "product_offers_page_url": productOffersPageUrl,
    "product_specs_page_url": productSpecsPageUrl,
    "product_reviews_page_url": productReviewsPageUrl,
    "product_num_reviews": productNumReviews,
    "typical_price_range": typicalPriceRange == null ? [] : List<dynamic>.from(typicalPriceRange!.map((x) => x)),
    "offer": offer?.toJson(),
  };
}

class Offer {
  String? storeName;
  double? storeRating;
  String? offerPageUrl;
  int? storeReviewCount;
  String? storeReviewsPageUrl;
  String? price;
  String? shipping;
  String? tax;
  bool? onSale;
  String? originalPrice;
  ProductCondition? productCondition;

  Offer({
    this.storeName,
    this.storeRating,
    this.offerPageUrl,
    this.storeReviewCount,
    this.storeReviewsPageUrl,
    this.price,
    this.shipping,
    this.tax,
    this.onSale,
    this.originalPrice,
    this.productCondition,
  });

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
    storeName: json["store_name"],
    storeRating: json["store_rating"]?.toDouble(),
    offerPageUrl: json["offer_page_url"],
    storeReviewCount: json["store_review_count"],
    storeReviewsPageUrl: json["store_reviews_page_url"],
    price: json["price"],
    shipping: json["shipping"],
    tax: json["tax"],
    onSale: json["on_sale"],
    originalPrice: json["original_price"],
    productCondition: productConditionValues.map[json["product_condition"]]!,
  );

  Map<String, dynamic> toJson() => {
    "store_name": storeName,
    "store_rating": storeRating,
    "offer_page_url": offerPageUrl,
    "store_review_count": storeReviewCount,
    "store_reviews_page_url": storeReviewsPageUrl,
    "price": price,
    "shipping": shipping,
    "tax": tax,
    "on_sale": onSale,
    "original_price": originalPrice,
    "product_condition": productConditionValues.reverse[productCondition],
  };
}

enum ProductCondition { NEW }

final productConditionValues = EnumValues({
  "NEW": ProductCondition.NEW
});

class ProductAttributes {
  Department? department;
  String? size;
  String? material;
  String? color;
  ClosureStyle? closureStyle;
  String? features;
  String? toeStyle;
  Style? style;
  String? athleticStyle;

  ProductAttributes({
    this.department,
    this.size,
    this.material,
    this.color,
    this.closureStyle,
    this.features,
    this.toeStyle,
    this.style,
    this.athleticStyle,
  });

  factory ProductAttributes.fromJson(Map<String, dynamic> json) => ProductAttributes(
    department: departmentValues.map[json["Department"]]!,
    size: json["Size"],
    material: json["Material"],
    color: json["Color"],
    closureStyle: closureStyleValues.map[json["Closure Style"]]!,
    features: json["Features"],
    toeStyle: json["Toe Style"],
    style: styleValues.map[json["Style"]]!,
    athleticStyle: json["Athletic Style"],
  );

  Map<String, dynamic> toJson() => {
    "Department": departmentValues.reverse[department],
    "Size": size,
    "Material": material,
    "Color": color,
    "Closure Style": closureStyleValues.reverse[closureStyle],
    "Features": features,
    "Toe Style": toeStyle,
    "Style": styleValues.reverse[style],
    "Athletic Style": athleticStyle,
  };
}

enum ClosureStyle { LACE_UP, LACE_UP_HOOK_AND_LOOP }

final closureStyleValues = EnumValues({
  "Lace-up": ClosureStyle.LACE_UP,
  "Lace-up, Hook and Loop": ClosureStyle.LACE_UP_HOOK_AND_LOOP
});

enum Department { MEN_S, KIDS_GIRLS, KIDS_BOYS, KIDS, WOMEN_S }

final departmentValues = EnumValues({
  "Kids'": Department.KIDS,
  "Kids', Boys'": Department.KIDS_BOYS,
  "Kids', Girls'": Department.KIDS_GIRLS,
  "Men's": Department.MEN_S,
  "Women's": Department.WOMEN_S
});

enum Style { CASUAL }

final styleValues = EnumValues({
  "Casual": Style.CASUAL
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}