import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onyxgalleryapp/screens/NewProductScreen.dart';
import 'package:onyxgalleryapp/screens/categoryScreen.dart';
import 'package:onyxgalleryapp/screens/categoryScreen.dart';
import 'package:onyxgalleryapp/screens/homepage.dart';
import 'package:onyxgalleryapp/screens/loginScreen.dart';
import 'package:onyxgalleryapp/screens/productsScreen.dart';
import 'package:onyxgalleryapp/widgets/bottomWidget.dart';

void main(List<String> args) {
  runApp(OnyxApp());
}

class OnyxApp extends StatelessWidget {
  const OnyxApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: "Peyda"),
        home: HomePageScreen()
        /*Scaffold(
        appBar: AppBar(backgroundColor: Colors.red),
        drawer: Drawer(
            child: Container(
          color: Colors.blue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 3.5, color: Colors.black),
                      borderRadius: BorderRadius.circular(50)),
                  child: Icon(
                    Icons.person,
                    size: 60,
                  )),
              SizedBox(
                height: 12,
              ),
              Text(
                "مهدی مجیدی",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                "پروفایل",
                style: TextStyle(color: Colors.black, fontSize: 22),
              ),
              SpaceLineDrawerWidget(),
              Text("محصولات",
                  style: TextStyle(color: Colors.black, fontSize: 22)),
              SpaceLineDrawerWidget(),
              Text(
                "نمودار فروش",
                style: TextStyle(fontSize: 22, color: Colors.black),
              )
            ],
          ),
        )),
      ),*/
        );
  }
}

class SpaceLineDrawerWidget extends StatelessWidget {
  const SpaceLineDrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: 2.2,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
    );
  }
}
