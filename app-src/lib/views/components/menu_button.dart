import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final Widget child;
  final Function onPressed;
  MenuButton({this.child, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 50,
        width: 65,
        child: InkWell(
          onTap: onPressed,
          child: child,
        ),
      ),
    );
  }
}
