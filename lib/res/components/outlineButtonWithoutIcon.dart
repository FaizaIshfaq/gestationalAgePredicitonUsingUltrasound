import 'package:fetal_femur_ultrasound/res/AppConst.dart';
import 'package:flutter/material.dart';

class OutlineButtonWithoutIcon extends StatefulWidget {
  const OutlineButtonWithoutIcon({
    Key? key,
    required this.title,
    this.loading = false,
    this.width=100,
    required this.borderColor,
    required this.onPress,
  }) : super(key: key);

  final String title;
  final bool loading;
  final double width;
  final Color borderColor;
  final VoidCallback onPress;

  @override
  _OutlineButtonWithoutIconState createState() => _OutlineButtonWithoutIconState();
}

class _OutlineButtonWithoutIconState extends State<OutlineButtonWithoutIcon> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: InkWell(
        onTap: widget.onPress,
        child: Container(
          height: 40,
          width: widget.width,
          decoration: BoxDecoration(
            color:isHovered?widget.borderColor:Colors.transparent,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: isHovered ? Colors.transparent : widget.borderColor,
              width: 1.5,
            ),
          ),
          child: Center(
            child: Text(
             widget.title,
             style: TextStyle(color: isHovered ? AppColors.whiteColor : widget.borderColor, fontSize: 16),
                ),
          ),
        ),
      ),
    );
  }
}
