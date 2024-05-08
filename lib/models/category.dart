import 'package:flutter/material.dart';

class OnyxCategory {
  String name;
  String href;
  String id;

  OnyxCategory({
    required this.name,
    required this.href,
    required this.id,

  });
  static OnyxCategory toModel(Map<String,dynamic> data){
    return OnyxCategory(name: data['name'], href: data['id_name'], id: data['_id']);
  }
}

