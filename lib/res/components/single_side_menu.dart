import 'package:flutter/material.dart';

class SingleSideMenu extends StatelessWidget {
  SingleSideMenu({Key? key, required this.menuTitle, required this.onPress})
      : super(key: key);
  String menuTitle;
  GestureTapCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: onPress,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 12, 12, 12),
          child: Text(menuTitle),
        ),
      ),
    );
  }
}
