import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onyxgalleryapp/models/produst.dart';
import 'package:onyxgalleryapp/network/network.dart';
import 'package:onyxgalleryapp/screens/categoryScreen.dart';
import 'package:onyxgalleryapp/screens/productsScreen.dart';
import 'package:http/http.dart' as http;

import '../screens/NewProductScreen.dart';
Future<String> networkImageToBase64(String imageUrl) async {
    http.Response response = await http.get(Uri.parse(imageUrl));
    final bytes = response.bodyBytes;
    return base64Encode(bytes);
}
class ProdustWidget extends StatefulWidget {
  final OnyxProdust data;
  const ProdustWidget({Key? key, required this.data}) : super(key: key);

  @override
  State<ProdustWidget> createState() => _ProdustWidgetState();
}

class _ProdustWidgetState extends State<ProdustWidget> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return GestureDetector(
      onLongPress: () async {
        Network network = new Network();
        network.delete_product(widget.data.id_name);
      },
      onTap: () async{
        NewProductScreen.IdNameController.text = widget.data.id_name;
        NewProductScreen.TitleController.text = widget.data.name;
        NewProductScreen.DescriptionCotroller.text = widget.data.caption;
        NewProductScreen.DiscountController.text = widget.data.discount.toString();
        NewProductScreen.IdNameController.text = widget.data.id_name;
        NewProductScreen.CountController.text = widget.data.count.toString();
        NewProductScreen.FeatureController.text = widget.data.feature.toString().replaceAll("[", "").replaceAll("]", "").replaceAll(",", "|");
        NewProductScreen.LablesController.text = widget.data.lables.toString().replaceAll("[", "").replaceAll("]", "").replaceAll(",", "|");
        NewProductScreen.ModelController.text = widget.data.types.toString().replaceAll("[", "").replaceAll("]", "").replaceAll(",", "|");
        NewProductScreen.PriceController.text = widget.data.price.toString();
        NewProductScreen.category_id = widget.data.category_id;
        NewProductScreen.images.clear();
        for(int i = 0;i<widget.data.images.length;i++){
          NewProductScreen.images.add(await networkImageToBase64(widget.data.images[i]));
        }
        Navigator.push(context, MaterialPageRoute(builder: (contxet)=>NewProductScreen(is_new: false))).then((value) {NewProductScreen.IdNameController.text = "";
                    NewProductScreen.TitleController.text = "";
                    NewProductScreen.DescriptionCotroller.text = "";
                    NewProductScreen.CountController.text = "";
                    NewProductScreen.DiscountController.text = "";
                    NewProductScreen.FeatureController.text = "";
                    NewProductScreen.LablesController.text = "";
                    NewProductScreen.ModelController.text = "";
                    NewProductScreen.PriceController.text = "";
                    NewProductScreen.category_id = "";
                    NewProductScreen.images = [];});
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(right: 20, left: 20, bottom: 10),
        decoration: BoxDecoration(
            border: Border.all(width: 3, color: Colors.black),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Image.network(
                widget.data.images[1],
                width: 100,
                height: 100,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: Row(
                        children: [
                          Text(
                            widget.data.name,
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          SizedBox(width: 10,),
                          Text(
                            CategoryScreen.category_list.lastWhere((element) => element.id == widget.data.category_id).name,
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        ],
                      )),
                  Text(
                    widget.data.types.toString(),
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  Container(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        widget.data.caption.length <= 20
                            ? widget.data.caption
                            : widget.data.caption.substring(
                                    0,
                                    widget.data.caption.length < 20
                                        ? widget.data.caption.length
                                        : 20) +
                                (widget.data.caption.length > 20
                                    ? " ..."
                                    : ""),
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                  ),
                  Text(
                    widget.data.price.toString() + "  T",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
