import 'package:flutter/material.dart';

class BaseCard extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final Widget child;
  final double height;
  final double width;
  final double borderWidth;
  final double blurRadius;
  final Color borderColor;
  final Color shadowColor;
  final Color color;
  final BorderRadiusGeometry borderradius;
  const BaseCard({
    Key? key,
    required this.child,
    required this.height,
    this.width = 0,
    this.padding = const EdgeInsets.all(0),
    this.borderradius = const BorderRadius.all(Radius.circular(6)),
    this.borderWidth = 0,
    this.borderColor = Colors.transparent,
    this.shadowColor = const Color.fromRGBO(0, 0, 0, 0.16),
    this.blurRadius = 15,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: height,
        minWidth: width,
      ),
      child: Container(
          padding: padding,
          //height: height,
          decoration: BoxDecoration(
              borderRadius: borderradius,
              border: Border.all(
                width: borderWidth,
                // assign the color to the border color
                color: borderColor,
              ),
              color: color,
              boxShadow: [
                BoxShadow(
                  color: shadowColor,
                  blurRadius: blurRadius,
                ),
              ]),
          child: child),
    );
  }
}
