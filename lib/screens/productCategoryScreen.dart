import "package:flat_list/flat_list.dart";
import "package:flutter/material.dart";
import "package:onyxgalleryapp/models/produst.dart";
import "package:onyxgalleryapp/network/network.dart";
import "package:onyxgalleryapp/screens/productsScreen.dart";

import "../widgets/produstWidget.dart";

class CategoryProductScreen extends StatefulWidget {
  final String category_id;
  const CategoryProductScreen({super.key,required this.category_id});
  static List<OnyxProdust> list_product = [];
  @override
  State<CategoryProductScreen> createState() => _CategoryProductScreenState();
}

class _CategoryProductScreenState extends State<CategoryProductScreen> {
  @override
  void initState() {
    // TODO: implement initState
    get_data();
    
  }
  void get_data() async{
    CategoryProductScreen.list_product.clear();
    setState(() {});
    Network network = new Network();
    await network.get_products();
    CategoryProductScreen.list_product = ProductScreen.produsts.where((element) => element.category_id == widget.category_id).toList();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Expanded(
                child: FlatList(
                  onRefresh: ()async{
                    CategoryProductScreen.list_product.clear();
                    setState(() {});
                    Network network = new Network();
                    await network.get_products();
                    CategoryProductScreen.list_product = ProductScreen.produsts.where((element) => element.category_id == widget.category_id).toList();
                    setState(() {});
                  },
                  buildItem: (item,index){
                    return ProdustWidget(data: item,);
                  },
                  data: CategoryProductScreen.list_product,
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}