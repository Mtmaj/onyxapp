import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onyxgalleryapp/network/network.dart';
import 'package:onyxgalleryapp/screens/loginScreen.dart';

import '../widgets/bottomWidget.dart';

class AddCategoryScreen extends StatefulWidget {
  static TextEditingController name_category = new TextEditingController();
  static TextEditingController href_category = new TextEditingController();
  const AddCategoryScreen({super.key});

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              TextFieldWidget(controller: AddCategoryScreen.name_category, data: "نام"),
              TextFieldWidget(controller: AddCategoryScreen.href_category, data: "نام انگلیسی"),
              BottomWidget(Text: "افزودن",OnTap: (){
                Network network = new Network();
                network.add_category(AddCategoryScreen.name_category.text, AddCategoryScreen.href_category.text).then((value) => Get.back());
              },)
            ],
          ),
        ),
      )
    );
  }
}