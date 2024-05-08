import 'package:flutter/material.dart';

class SaveBottomWidget extends StatefulWidget {
  final Function ontap;
  const SaveBottomWidget({Key? key, required this.ontap}) : super(key: key);

  @override
  State<SaveBottomWidget> createState() => _SaveBottomWidgetState();
}

class _SaveBottomWidgetState extends State<SaveBottomWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(top: 25, right: 15),
        width: 80,
        height: 40,
        child: Center(
          child: Text(
            "Save",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(10)),
      ),
      onTap: () {
        widget.ontap();
      },
    );
  }
}
