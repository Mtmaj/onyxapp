import 'package:flat_list/flat_list.dart';
import 'package:flutter/material.dart';
import 'package:onyxgalleryapp/constant.dart';
import 'package:onyxgalleryapp/models/produst.dart';
import 'package:onyxgalleryapp/network/network.dart';
import 'package:onyxgalleryapp/screens/NewProductScreen.dart';
import 'package:onyxgalleryapp/widgets/produstWidget.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);
  static List<OnyxProdust> produsts = [];

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_data();
  }
  
  void get_data() async{
    try{
    Network network = new Network();
    await network.get_categorys();
    await network.get_products();
    setState(() {
      
    });
    }catch(e){}
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: BackgroundColor,
      body: Container(
          child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                BackButton(),
              ],
            ),
            Expanded(
              child: FlatList(
                onRefresh: ()async {
                  try{
                    Network network = new Network();
                    await network.get_categorys();
                    await network.get_products();
                    setState(() {
                      
                    });
                    }catch(e){}
                },
                buildItem: (item, index) {
                  return ProdustWidget(data: item);
                },
                data: ProductScreen.produsts,
              ),
            )
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return NewProductScreen(is_new: true,);
            }));
          });
        },
        backgroundColor: Colors.black54,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 38,
        ),
      ),
    ));
  }
}
