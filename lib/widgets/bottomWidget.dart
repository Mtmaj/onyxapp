import 'package:flutter/material.dart';

class BottomWidget extends StatefulWidget {
  final Function OnTap;
  final String Text;
  const BottomWidget({Key? key, required this.OnTap, required this.Text})
      : super(key: key);

  @override
  State<BottomWidget> createState() => _BottomWidgetState();
}

class _BottomWidgetState extends State<BottomWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 45, vertical: 10),
          width: double.infinity,
          height: 75,
          child: Center(
              child: Text(
            widget.Text,
            style: TextStyle(
                color: Colors.black,
                fontSize: 27.5,
                fontWeight: FontWeight.bold),
          )),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 3, color: Colors.black)),
        ),
        onTap: () {
          widget.OnTap();
        });
  }
}
