import 'package:flutter/material.dart';

class WebLayout extends StatefulWidget {
   final Widget? header;
  
  final Widget? footer;
  
  final Widget? center;
  
  final Widget? side;
    const WebLayout(
      {Key? key,
      this.header,
      this.footer,
      this.center,
      this.side})
      : super(key: key);
 @override
  State<WebLayout> createState() => _WebLayoutState();
}

class _WebLayoutState extends State<WebLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(''),
    );
  }
}
