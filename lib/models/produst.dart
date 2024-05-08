import 'package:flutter/cupertino.dart';

class OnyxProdust {
  String name;
  String caption;
  List<dynamic> types;
  List<dynamic> feature;
  String category_id;
  String id_name;
  int discount;
  int price;
  int count;
  List<dynamic> lables;
  List<dynamic> images;
  String id;
  int sales;

  OnyxProdust({
    required this.name,
    required this.caption,
    required this.types,
    required this.feature,
    required this.id,
    required this.category_id,
    required this.price,
    required this.discount,
    required this.count,
    required this.id_name,
    required this.images,
    required this.lables,
    required this.sales
  });

  static OnyxProdust toModel(Map<String,dynamic> data){
    return OnyxProdust(
      name: data['name'], 
      caption: data['captions'], 
      types: data['types'], 
      feature: data['feature'], 
      id: data['_id'], 
      category_id: data['category_id'], 
      price: data['price'], 
      discount: data['discount'], 
      count: data['count'], 
      id_name: data['id_name'], 
      images: data['images'],
      lables: data['lables'],
      sales: data['sales']
    );
  }

  Map<String,dynamic> toJson(OnyxProdust data){
    return {
      "name" : data.name,
      "captions" : data.caption,
      "list_types" : data.types,
      "list_feature" : data.feature,
      "category_id" : data.category_id,
      "price" : data.price,
      "discount" : data.discount,
      "count" : data.count,
      "id_name" : data.id_name,
      "images" : data.images,
      "lables" : data.lables
    };
  }

}
