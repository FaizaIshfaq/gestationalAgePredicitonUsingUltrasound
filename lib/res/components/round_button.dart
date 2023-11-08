import 'package:fetal_femur_ultrasound/res/AppConst.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key? key,
    required this.title,
    this.loading = false,
    required this.onPress,
  }) : super(key: key);

  final String title;
  final bool loading;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () { onPress();},
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.amber,
        backgroundColor: Colors.black,// background color
      ),
      child: loading? const CircularProgressIndicator(color: Colors.white,): Text(
        title, // Use the title parameter here
        // style: ,
      ),
    );
  }
}

