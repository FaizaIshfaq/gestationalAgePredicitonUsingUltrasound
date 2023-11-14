import 'package:fetal_femur_ultrasound/res/AppConst.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputFieldWithLabel extends StatefulWidget {
  final String label;

  final List<TextInputFormatter>? inputFormatter;
  final String hintText;
  final bool dateIcon;
  final TextEditingController? textEditingController;
  final Function()? onTap;

  const InputFieldWithLabel({
    Key? key,
    required this.label,
    this.textEditingController,
    required this.dateIcon,
    this.inputFormatter,
    this.onTap,
    required this.hintText,
  }) : super(key: key);

  @override
  State<InputFieldWithLabel> createState() => _InputFieldWithLabelState();
}

class _InputFieldWithLabelState extends State<InputFieldWithLabel> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: const TextStyle(
              color: AppColors.profileTextColor,
              fontSize: 18.0,
            ),
          ),
          const SizedBox(height: 8.0),
          SizedBox(
            height: 50,
            child: TextFormField(
              onTap: widget.onTap,
              controller: widget.textEditingController,
              inputFormatters: widget.inputFormatter,
              style: const TextStyle(color: AppColors
                  .inputTextColor),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(
                      30), // Set your desired border radius
                ),
                filled: true,
                fillColor: AppColors.inputFieldBackgroundColor,
                // Set your desired background color
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                  color: AppColors
                      .inputTextDarkGrayColor, // Set your desired hint text color
                ),
                contentPadding: const EdgeInsets.only(left: 20,right: 10),
                suffixIcon:widget.dateIcon?const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(Icons.calendar_month,color: AppColors.iconPurpleColor,),
                ):Text(''), // Set your desired icon
              ),
            ),
          ),
        ],
      ),
    );
  }
}
