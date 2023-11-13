import 'package:fetal_femur_ultrasound/res/AppConst.dart';
import 'package:flutter/material.dart';

class OutlineButtonWeb extends StatelessWidget {
  const OutlineButtonWeb({
    Key? key,
    required this.title,
    this.loading = false,
    this.borderColor = AppColors.profileTextColor,
    required this.onPress,
  }) : super(key: key);
  final String title;
  final bool loading;
  final Color borderColor;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: borderColor,
            width: 1.5,
          ),
        ),
        child: Row(
            children:[
              Padding(
                padding: const EdgeInsets.only(left: 10.0,right: 5),
                child: Icon(Icons.keyboard_arrow_left_sharp,color: borderColor,),
              ),
              Text(
                title,
                style: TextStyle(color: borderColor,fontSize: 16),
              )
            ],
        ),
      ),
    );
  }
}
