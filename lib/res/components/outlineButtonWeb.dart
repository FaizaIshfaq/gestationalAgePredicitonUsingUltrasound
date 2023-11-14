import 'package:fetal_femur_ultrasound/res/AppConst.dart';
import 'package:flutter/material.dart';

class OutlineButtonWeb extends StatefulWidget {
  const OutlineButtonWeb({
    Key? key,
    required this.title,
    this.loading = false,
    required this.borderColor,
    required this.onPress,
  }) : super(key: key);

  final String title;
  final bool loading;
  final Color borderColor;
  final VoidCallback onPress;

  @override
  _OutlineButtonWebState createState() => _OutlineButtonWebState();
}

class _OutlineButtonWebState extends State<OutlineButtonWeb> {
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
          width: 100,
          decoration: BoxDecoration(
            color:isHovered?widget.borderColor:Colors.transparent,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: isHovered ? Colors.transparent : widget.borderColor,
              width: 1.5,
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 5),
                child: Icon(Icons.keyboard_arrow_left_sharp, color: isHovered ? AppColors.whiteColor : widget.borderColor),
              ),
              Text(
                widget.title,
                style: TextStyle(color: isHovered ? AppColors.whiteColor : widget.borderColor, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
