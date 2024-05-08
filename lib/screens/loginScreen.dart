import 'package:flutter/material.dart';
import 'package:onyxgalleryapp/screens/homepage.dart';
import 'package:onyxgalleryapp/constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static TextEditingController UserNamecontroller = TextEditingController();
  static TextEditingController Passwordcontroller = TextEditingController();

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: BackgroundColor,
      body: Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFieldWidget(
                  data: "نام کاربری",
                  controller: LoginScreen.UserNamecontroller),
              SizedBox(
                height: 15,
              ),
              TextFieldWidget(
                  controller: LoginScreen.Passwordcontroller, data: "رمز ورود"),
              SizedBox(
                height: 70,
              ),
              GestureDetector(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 90),
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 2.5, color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    "ورود",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )),
                ),
                onTap: () {
                  setState(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return HomePageScreen();
                    }));
                  });
                },
              )
            ]),
      ),
    ));
  }
}

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String data;
  const TextFieldWidget(
      {Key? key, required this.controller, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            data,
            style: TextStyle(fontSize: 23, color: Colors.black),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 65,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 2.5, color: Colors.black)),
            child: TextField(
                controller: controller,
                cursorHeight: 35,
                cursorColor: Colors.black,
                style: TextStyle(fontSize: 20, color: Colors.black),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 245, 230, 188))),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 245, 230, 188))),
                )),
          ),
        ],
      ),
    );
  }
}
