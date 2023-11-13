import 'package:fetal_femur_ultrasound/res/AppConst.dart';
import 'package:flutter/material.dart';

class SingleSideMenu extends StatefulWidget {
  const SingleSideMenu({
    Key? key,
    required this.menuTitle,
    required this.onPress,
    required this.menuImage,
    required this.isSelected,
  }) : super(key: key);

  final String menuTitle;
  final GestureTapCallback onPress;
  final Image menuImage;
  final bool isSelected;

  @override
  _SingleSideMenuState createState() => _SingleSideMenuState();
}

class _SingleSideMenuState extends State<SingleSideMenu> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: InkWell(
        onTap: widget.onPress,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 5, 12, 0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: widget.isSelected
                  ? AppColors.paginationPurpleColor
                  : (isHovered ? AppColors.hoverGrayColor : Colors.transparent),
            ),
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: SizedBox(
                    height: 25,
                    width: 25,
                    child: widget.menuImage,
                  ),
                ),
                Text(
                  widget.menuTitle,
                  style: TextStyle(
                    color: widget.isSelected || isHovered
                        ? Colors.white
                        : AppColors.sidePanelTextGrayColor,
                    fontSize: 16.0,
                    fontFamily: 'Outfit',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
