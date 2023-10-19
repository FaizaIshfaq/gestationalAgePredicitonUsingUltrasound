import 'package:fetal_femur_ultrasound/res/AppConst.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({Key? key,
  required this.title,
  this.loading=false,
  required this.onPress,}) : super(key:key);
  final String title;
  final bool loading;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
            child: Text(this.title,style: TextStyle(color: AppColors.whiteColor),)
        ),
      ),
    );
  }
}
