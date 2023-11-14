import 'package:fetal_femur_ultrasound/res/AppConst.dart';
import 'package:flutter/material.dart';

class InputFieldLabelWithCarot extends StatefulWidget {
  final String label;
  final String hintText;
  final List<String> dropdownItems;

  const InputFieldLabelWithCarot({
    Key? key,
    required this.label,
    required this.hintText,
    required this.dropdownItems,
  }) : super(key: key);

  @override
  State<InputFieldLabelWithCarot> createState() =>
      _InputFieldLabelWithCarotState();
}

class _InputFieldLabelWithCarotState extends State<InputFieldLabelWithCarot> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = null; // Set to null initially to represent no selection.
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
          child: InputDecorator(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 20),
              filled: true,
              fillColor: AppColors.inputFieldBackgroundColor,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      dropdownColor: AppColors.inputFieldBackgroundColor,
                      iconEnabledColor: AppColors.buttonOutlinePurpleColor,
                      value: selectedValue,
                      isExpanded:true,
                      onChanged: (String? value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                      items: [
                        // Add a hint item
                        DropdownMenuItem<String>(
                          value: null,
                          child: Text(
                            widget.hintText,
                            style: const TextStyle(
                              color: AppColors
                                  .inputTextDarkGrayColor, // Change hint text color
                            ),
                          ),
                        ),
                        // Add other items
                        ...widget.dropdownItems
                            .map((String item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                        color: AppColors.inputTextColor),
                                  ),
                                ))
                            .toList(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
