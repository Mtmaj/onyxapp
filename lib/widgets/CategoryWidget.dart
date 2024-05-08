import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onyxgalleryapp/models/category.dart';
import 'package:onyxgalleryapp/screens/NewProductScreen.dart';
import 'package:onyxgalleryapp/screens/productCategoryScreen.dart';


class CategoryWidget extends StatefulWidget {
  final OnyxCategory data;
  const CategoryWidget({super.key,required this.data});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(CategoryProductScreen(category_id: widget.data.id));
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
        child: Row(
          children: [
            Text(widget.data.href,style: TextStyle(fontSize: 22)),
            Spacer(),
            Text(widget.data.name,style: TextStyle(fontSize: 22))
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.amber[100],
          borderRadius: BorderRadius.circular(10)
        ),
      ),
    );
  }
}