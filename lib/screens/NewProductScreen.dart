import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:onyxgalleryapp/constant.dart';
import 'package:onyxgalleryapp/models/produst.dart';
import 'package:onyxgalleryapp/screens/categoryScreen.dart';
import 'package:onyxgalleryapp/screens/productsScreen.dart';
import 'package:onyxgalleryapp/widgets/SaveBottomWidget.dart';
import 'package:onyxgalleryapp/widgets/TextFieldWidget.dart';

import '../models/category.dart';
import '../network/network.dart';
import '../widgets/bottomWidget.dart';

class NewProductScreen extends StatefulWidget {
  final bool is_new;
  const NewProductScreen({Key? key,required this.is_new}) : super(key: key);
  static TextEditingController IdNameController = TextEditingController();
  static TextEditingController TitleController = TextEditingController();
  static TextEditingController DescriptionCotroller = TextEditingController();
  static TextEditingController ModelController = TextEditingController();
  static TextEditingController PriceController = TextEditingController();
  static TextEditingController DiscountController = TextEditingController();
  static TextEditingController FeatureController = TextEditingController();
  static TextEditingController CountController = TextEditingController();
  static TextEditingController LablesController = TextEditingController();
  static List<String> images = [];
  static String category_id = "";
  @override
  State<NewProductScreen> createState() => _NewProductScreenState();
}

Image imageFromBase64String(String base64String) {
  return Image.memory(base64Decode(base64String));
}

class _NewProductScreenState extends State<NewProductScreen> {
  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem> list_drop = [];
    print(CategoryScreen.category_list);
    CategoryScreen.category_list.forEach((item){
      list_drop.add(DropdownMenuItem(child: Text(item.name),value: item.id,));
    });
    return SafeArea(
        child: Scaffold(
      backgroundColor: BackgroundColor,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                BackButton(),
                Text(
                  widget.is_new? "افزودن محصول":"بروزرسانی محصول",
                  style: TextStyle(color: Colors.black, fontSize: 35),
                )
              ],
            ),
            TextFieldWidget(
              Title: "کد محصول",
              TextFieldTitle: "کد محصول را وارد کنید",
              controller: NewProductScreen.IdNameController,
            ),
            TextFieldWidget(
              Title: "نام محصول",
              TextFieldTitle: "نام محصول را وارد کنید",
              controller: NewProductScreen.TitleController,
            ),
            TextFieldWidget(
                Title: "انواع محصول",
                TextFieldTitle: "انواع محصول را با | جدا کنید",
                controller: NewProductScreen.ModelController),
            TextFieldWidget(
                Title: "توضیحات",
                TextFieldTitle: "توضیحات محصول را وارد کنید",
                controller: NewProductScreen.DescriptionCotroller),
            TextFieldWidget(
              Title: "قیمت",
              TextFieldTitle: "قیمت را وارد کنید",
              controller: NewProductScreen.PriceController,
              Type: TextInputType.number,
            ),
            TextFieldWidget(
              Title: "تخفیف",
              TextFieldTitle: "(اگر ندارد 0 وارد کنید) تخفیف را وارد کنید",
              controller: NewProductScreen.DiscountController,
              Type: TextInputType.number,
            ),
            TextFieldWidget(
              Title: "ویژگی ها",
              TextFieldTitle: "ویژگی هارا با | جدا کنید",
              controller: NewProductScreen.FeatureController,
              Type: TextInputType.number,
            ),
            TextFieldWidget(
              Title: "موجودی",
              TextFieldTitle: "موجودی محصول را وارد کنید",
              controller: NewProductScreen.CountController,
              Type: TextInputType.number,
            ),
            TextFieldWidget(
              Title: "برچسب ها",
              TextFieldTitle: "برچسب ها را با | جدا کنید",
              controller: NewProductScreen.LablesController,
              Type: TextInputType.number,
            ),
            SizedBox(height: 20,),
            DropdownButton(
              items: list_drop,
              hint: Text(NewProductScreen.category_id != ""? CategoryScreen.category_list.lastWhere((element) => element.id==NewProductScreen.category_id).name:"دسته بندی محصول را انتخاب کنید"), 
              onChanged: (index){
                NewProductScreen.category_id = index;
                print(index);
                setState(() {});

              }
            ),
            SizedBox(height: 20,),
            BottomWidget(Text: "افزودن عکس",OnTap: ()async {
              await getLostData();
              setState(() {});
            },),
            Container(
              height: 100,
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(child: ListView.builder(
                    itemCount: NewProductScreen.images.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                      return GestureDetector(
                        onTap: (){
                          NewProductScreen.images.removeAt(index);
                          setState(() {});
                        },
                        child:imageFromBase64String(NewProductScreen.images[index])
                      );
                    }
                  ),)
                ],
              ),
            ),
            Container(
                alignment: Alignment.bottomRight,
                child: SaveBottomWidget(ontap: () {
                  Network network = new Network();
                  if(widget.is_new){
                      network.add_product().then((value){ 
                    NewProductScreen.IdNameController.text = "";
                    NewProductScreen.TitleController.text = "";
                    NewProductScreen.DescriptionCotroller.text = "";
                    NewProductScreen.CountController.text = "";
                    NewProductScreen.DiscountController.text = "";
                    NewProductScreen.FeatureController.text = "";
                    NewProductScreen.LablesController.text = "";
                    NewProductScreen.ModelController.text = "";
                    NewProductScreen.PriceController.text = "";
                    NewProductScreen.category_id = "";
                    NewProductScreen.images = [];
                    
                    Get.back();
                  });
                  }else{
                    network.update_product().then((value){ 
                    NewProductScreen.IdNameController.text = "";
                    NewProductScreen.TitleController.text = "";
                    NewProductScreen.DescriptionCotroller.text = "";
                    NewProductScreen.CountController.text = "";
                    NewProductScreen.DiscountController.text = "";
                    NewProductScreen.FeatureController.text = "";
                    NewProductScreen.LablesController.text = "";
                    NewProductScreen.ModelController.text = "";
                    NewProductScreen.PriceController.text = "";
                    NewProductScreen.category_id = "";
                    NewProductScreen.images = [];
                    
                    Get.back();
                  });
                  }
      
                  // ProductScreen.produsts.add(OnyxProdust(
                  //     name: NewProductScreen.TitleController.text,
                  //     Description: NewProductScreen.DescriptionCotroller.text,
                  //     model: NewProductScreen.ModelController.text,
                  //     category: "",
                  //     id: Random().nextInt(9999),
                  //     sold: 0,
                  //     price: 12000,
                  //     url: "url"));
                  // setState(() {});
                  // Navigator.pop(context);
                }))
          ],
        ),
      ),
    ));
  }
  Future<void> getLostData() async {
    final ImagePicker picker = ImagePicker();
    final XFile? response = await picker.pickImage(source: ImageSource.gallery);
    if (response == null) {
      return;
    }
    NewProductScreen.images.add(base64Encode(await response.readAsBytes()));
      
  }
}
