import 'package:fetal_femur_ultrasound/res/AppConst.dart';
import 'package:flutter/material.dart';

class ListsTopFilterButton extends StatelessWidget {
  ListsTopFilterButton(
      {Key? key, required this.onPressed, this.text, this.count})
      : super(key: key);
  Function() onPressed;
  String? text;
  int? count;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.paginationPurpleColor,
        padding: EdgeInsets.symmetric(
            vertical: 17.0, horizontal: 10.0), // Adjust the padding
      ),
      child: RichText(
        text: TextSpan(
          children: [
            WidgetSpan(
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Image.asset(
                  'lib/images/funnel.png',
                  width: 22,
                  height: 22,
                ),
              ),
            ),
            TextSpan(
              text: text ?? 'Filter',
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 15,
              ),
            ),
            WidgetSpan(
              child: Container(
                padding: EdgeInsets.fromLTRB(5, 0, 5, 2),
                margin: EdgeInsets.only(left: 8,right: 5),
                decoration: BoxDecoration(
                  color: AppColors.yellowColor,
                  borderRadius: BorderRadius.circular(1.0),
                ),
                child: Text(
                  count == null ? '0' : count.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}