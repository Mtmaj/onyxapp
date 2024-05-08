import 'package:flutter/material.dart';
import 'package:onyxgalleryapp/constant.dart';
import 'package:onyxgalleryapp/screens/categoryScreen.dart';
import 'package:onyxgalleryapp/screens/productsScreen.dart';
import 'package:onyxgalleryapp/widgets/bottomWidget.dart';
import 'package:get/get.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: BackgroundColor,
      drawer: Drawer(
          child: Container(
        color: Color.fromARGB(255, 240, 243, 33),
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
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            BottomWidget(
              OnTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ProductScreen();
                  })).then((value) => () {
                        setState(() {});
                      });
                });
              },
              Text: "محصولات",
            ),
            BottomWidget(OnTap: () {
              Get.to(CategoryScreen());
            }, Text: "دسته بندی ها"),
            BottomWidget(OnTap: () {}, Text: "نظرات"),
            BottomWidget(OnTap: () {}, Text: "سوالات متداول"),
            BottomWidget(OnTap: () {}, Text: "نمودار فروش"),
            BottomWidget(OnTap: () {}, Text: "درباره ما"),
          ],
        ),
      ),
    ));
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
