import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final Widget child;
  final Function onPressed;
  MenuButton({this.child, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 40,
        width: 60,
        child: InkWell(
          onTap: onPressed,
          child: child,
        ),
      ),
    );
  }
}
