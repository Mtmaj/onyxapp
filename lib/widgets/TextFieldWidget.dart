import 'package:flutter/material.dart';

import '../constant.dart';

class TextFieldWidget extends StatefulWidget {
  final String Title;
  final String TextFieldTitle;
  final TextEditingController controller;
  final TextInputType Type;
  const TextFieldWidget(
      {Key? key,
      required this.Title,
      required this.TextFieldTitle,
      required this.controller,
      this.Type = TextInputType.text})
      : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 13, right: 13, top: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.Title,
              style: TextStyle(color: Colors.black, fontSize: 23),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                  border: Border.all(width: 2.5, color: Colors.black),
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.symmetric(horizontal: 7),
              child: Column(children: [
                SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: widget.controller,
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black),
                    cursorHeight: 26,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: BackgroundColor)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: BackgroundColor)),
                      hintText: widget.TextFieldTitle,
                      hintStyle:
                          TextStyle(color: Colors.grey[600], fontSize: 15),
                    ),
                  ),
                ),
              ]),
            )
          ],
        ));
  }
}
