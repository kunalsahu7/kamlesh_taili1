// To parse this JSON data, do
//
//     final productmodal = productmodalFromJson(jsonString);

import 'dart:convert';

Productmodal productmodalFromJson(String str) => Productmodal.fromJson(json.decode(str));

String productmodalToJson(Productmodal data) => json.encode(data.toJson());

class Productmodal {
  List<ProductDatum>? productData;

  Productmodal({
    this.productData,
  });

  factory Productmodal.fromJson(Map<String, dynamic> json) => Productmodal(
    productData: json["ProductData"] == null ? [] : List<ProductDatum>.from(json["ProductData"]!.map((x) => ProductDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "ProductData": productData == null ? [] : List<dynamic>.from(productData!.map((x) => x.toJson())),
  };
}

class ProductDatum {
  String? id;
  String? categoryName;
  String? name;
  String? price;
  String? image;
  String? averageRating;

  ProductDatum({
    this.id,
    this.categoryName,
    this.name,
    this.price,
    this.image,
    this.averageRating,
  });

  factory ProductDatum.fromJson(Map<String, dynamic> json) => ProductDatum(
    id: json["Id"],
    categoryName: json["CategoryName"],
    name: json["Name"],
    price: json["Price"],
    image: json["Image"],
    averageRating: json["AverageRating"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "CategoryName": categoryName,
    "Name": name,
    "Price": price,
    "Image": image,
    "AverageRating": averageRating,
  };
}
