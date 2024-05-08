import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onyxgalleryapp/models/category.dart';
import 'package:onyxgalleryapp/network/network.dart';
import 'package:onyxgalleryapp/screens/newCategoryScreen.dart';
import 'package:onyxgalleryapp/widgets/CategoryWidget.dart';
import 'package:flat_list/flat_list.dart';
class CategoryScreen extends StatefulWidget {
  static List<OnyxCategory> category_list = [];
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    super.initState();
    a();
  }
  void a() async {
    Network network = new Network();
    await network.get_categorys();
    try{
    setState(() {
      
    });}catch(e){
      
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Get.to(AddCategoryScreen());
          },
          child: Icon(Icons.add),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
          child: Column(
            children: [
              Expanded(
                child: FlatList(
                  onRefresh: ()async{
                    Network network = new Network();
                    await network.get_categorys();
                    setState(() {
                      
                    });
                  },
                  buildItem: (item,index){
                    return CategoryWidget(data: item);
                  },
                  data: CategoryScreen.category_list,
                )
              )
            ],
          ),
        ),
      )
    );
  }
}