import 'package:fetal_femur_ultrasound/res/AppConst.dart';
import 'package:flutter/material.dart';

class SimpleButton extends StatefulWidget {
  const SimpleButton({
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
  _SimpleButtonState createState() => _SimpleButtonState();
}

class _SimpleButtonState extends State<SimpleButton> {
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
          decoration: BoxDecoration(
            color:isHovered?Colors.transparent:widget.borderColor,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: isHovered ?widget.borderColor: Colors.transparent ,
              width: 1.5,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Text(
                widget.title,
                style: TextStyle(color: isHovered ? widget.borderColor:AppColors.whiteColor , fontSize: 15),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
