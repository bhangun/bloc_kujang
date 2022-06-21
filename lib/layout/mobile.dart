import 'package:flutter/material.dart';
import 'package:bloc_kujang/widgets/progress_indicator_widget.dart';

class MobileLayout extends StatefulWidget {
  final Widget? leftChild;
  final Widget? rightChild;
  final Widget? topChild;
  final Widget? bottomChild;
  final Widget? loginChild;
  final bool? showProgress;

  const MobileLayout(
      {Key? key,
      this.loginChild,
      this.leftChild,
      this.rightChild,
      this.topChild,
      this.bottomChild,
      this.showProgress})
      : super(key: key);

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  int selectedValue = 0;
  bool isLargeScreen = false;

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      OrientationBuilder(
        builder: (context, orientation) {
          isLargeScreen =
              (MediaQuery.of(context).size.width > 600) ? true : false;

          return orientation == Orientation.portrait
              ? _buildVerticalLayout()
              : _buildHorizontalLayout();
        },
      ),
      Visibility(
        visible: widget.showProgress!,
        child: CustomProgressIndicatorWidget(),
      )
    ]);
  }
  
  Widget _buildLeftSide(Widget child) => SizedBox.expand(child: child);

  Widget _buildRightSide(Widget child) => Form(
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0), child: child),
        ),
      );
}

Widget _buildHorizontalLayout() {
  return Center(
    child: Row(
      children: <Widget>[
        Expanded(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Icon(
                  Icons.account_circle,
                  size: 100.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "name",
                  style: TextStyle(fontSize: 32.0),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: List.generate(6, (n) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "name",
                  style: TextStyle(fontSize: 32.0),
                ),
              );
            }),
          ),
        ),
      ],
    ),
  );
}

Widget _buildVerticalLayout() {
  return Center(
    child: ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Icon(
            Icons.account_circle,
            size: 100.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(22.0),
          child: Text(
            "name",
            style: TextStyle(fontSize: 32.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(22.0),
          child: Text(
            "Demo Data",
            style: TextStyle(fontSize: 22.0),
          ),
        ),
      ],
    ),
  );
}
