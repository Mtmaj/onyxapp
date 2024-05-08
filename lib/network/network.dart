import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:onyxgalleryapp/models/category.dart';
import 'package:onyxgalleryapp/models/produst.dart';
import 'package:onyxgalleryapp/screens/categoryScreen.dart';
import 'package:onyxgalleryapp/screens/productsScreen.dart';

import '../screens/NewProductScreen.dart';

class Network {
  var headers = {
    'username': 'mmdi',
    'password': 'Majidi1387',
    'Content-Type': 'application/json'
  };
  Future<void> add_category(String name, String href) async {
    var request = http.Request('POST',
        Uri.parse('https://onyxgallery-backend.liara.run/api/category/add'));
    request.body = json.encode({"id_name": '/' + href, "name": name});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<void> get_categorys() async {
    var request = http.Request('GET',
        Uri.parse('https://onyxgallery-backend.liara.run/api/category/get'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var data = jsonDecode(await response.stream.bytesToString());
      CategoryScreen.category_list.clear();
      data.forEach((item) {
        CategoryScreen.category_list.add(OnyxCategory.toModel(item));
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<void> get_products() async {
    var request = http.Request('GET',
        Uri.parse('https://onyxgallery-backend.liara.run/api/product/get-all'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print(response);
    if (response.statusCode == 200) {
      var data = jsonDecode(await response.stream.bytesToString());
      print(data);
      ProductScreen.produsts.clear();
      data.forEach((item) {
        ProductScreen.produsts.add(OnyxProdust.toModel(item));
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<void> add_product() async {
    var request = http.Request('POST',
        Uri.parse('https://onyxgallery-backend.liara.run/api/product/add'));
    request.headers.addAll({
      'username': 'mmdi',
      'admin_password': 'Majidi1387',
      'Content-Type': 'application/json'
    });
    OnyxProdust new_product = OnyxProdust(
        name: NewProductScreen.TitleController.text,
        caption: NewProductScreen.DescriptionCotroller.text,
        types: NewProductScreen.ModelController.text.split('|'),
        feature: NewProductScreen.FeatureController.text.split('|'),
        id: "",
        category_id: NewProductScreen.category_id,
        price: int.parse(NewProductScreen.PriceController.text),
        discount: int.parse(NewProductScreen.DiscountController.text),
        count: int.parse(NewProductScreen.CountController.text),
        id_name: NewProductScreen.IdNameController.text,
        images: NewProductScreen.images,
        lables: NewProductScreen.LablesController.text.split("|"),
        sales: 0);
    request.body = jsonEncode(new_product.toJson(new_product));
    http.StreamedResponse response = await request.send();
    print(response);
    if (response.statusCode == 200) {
      var data = jsonDecode(await response.stream.bytesToString());
      print(data);
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<void> delete_product(String id_name) async {
    var request = http.Request('GET',
        Uri.parse('https://onyxgallery-backend.liara.run/api/product/delete'));
    request.headers.addAll({
      'username': 'mmdi',
      'admin_password': 'Majidi1387',
      "id_name": id_name,
      'Content-Type': 'application/json'
    });
    http.StreamedResponse response = await request.send();
    print(response);
    if (response.statusCode == 200) {
      var data = jsonDecode(await response.stream.bytesToString());
      print(data);
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<void> update_product() async {
    var request = http.Request('POST',
        Uri.parse('https://onyxgallery-backend.liara.run/api/product/update'));
    request.headers.addAll({
      'username': 'mmdi',
      'admin_password': 'Majidi1387',
      'Content-Type': 'application/json'
    });
    OnyxProdust new_product = OnyxProdust(
        name: NewProductScreen.TitleController.text,
        caption: NewProductScreen.DescriptionCotroller.text,
        types: NewProductScreen.ModelController.text.split('|'),
        feature: NewProductScreen.FeatureController.text.split('|'),
        id: "",
        category_id: NewProductScreen.category_id,
        price: int.parse(NewProductScreen.PriceController.text),
        discount: int.parse(NewProductScreen.DiscountController.text),
        count: int.parse(NewProductScreen.CountController.text),
        id_name: NewProductScreen.IdNameController.text,
        images: NewProductScreen.images,
        lables: NewProductScreen.LablesController.text.split("|"),
        sales: 0);
    request.body = jsonEncode(new_product.toJson(new_product));
    http.StreamedResponse response = await request.send();
    print(response);
    if (response.statusCode == 200) {
      var data = jsonDecode(await response.stream.bytesToString());
      print(data);
    } else {
      print(response.reasonPhrase);
    }
  }
}
