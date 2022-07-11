import 'package:flutter/material.dart';

class DesktopLayout extends StatefulWidget {
  final Widget? header;
  
  final Widget? footer;
  
  final Widget? center;
  
  final Widget? side;


  const DesktopLayout(
      {Key? key,
      this.header,
      this.footer,
      this.center,
      this.side})
      : super(key: key);

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(''),
    );
  }
}