import 'package:flutter/material.dart';

class BackBottom extends StatefulWidget {
  const BackBottom({Key? key}) : super(key: key);

  @override
  State<BackBottom> createState() => _BackBottomState();
}

class _BackBottomState extends State<BackBottom> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Icon(
          Icons.arrow_back,
          //  size: 600,
          color: Colors.black,
        ),
      ),
      onTap: () {
        setState(() {
          Navigator.pop(context);
        });
      },
    );
  }
}
