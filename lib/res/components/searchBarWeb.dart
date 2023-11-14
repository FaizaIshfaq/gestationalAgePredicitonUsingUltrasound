import 'package:fetal_femur_ultrasound/res/AppConst.dart';
import 'package:flutter/material.dart';

class SearchFieldHeaderWeb extends StatefulWidget {
  SearchFieldHeaderWeb(
      {Key? key,
      required this.hint,
      required this.onChange,
      required this.setParentState})
      : super(key: key);

  final TextCapitalization textCapitalization = TextCapitalization.sentences;
  final String hint;
  final ValueChanged<String?> onChange;
  Function() setParentState;

  @override
  State<SearchFieldHeaderWeb> createState() => _SearchFieldHeaderWebState();
}

class _SearchFieldHeaderWebState extends State<SearchFieldHeaderWeb> {
  final TextEditingController textEditingController = TextEditingController();
  var _crossIconController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.paginationPurpleColor,
                  // Set your desired border color
                  width: 1.0, // Set your desired border width
                ),
              ),
            ),
            padding: EdgeInsets.all(4),
            width: 450,
            height: 40,
            child: Stack(
              children: [
                Positioned(
                    child: TextField(
                  controller: _crossIconController,
                  onChanged: (text) {
                    widget.onChange(text);
                    setState(() {});
                  },
                  textAlign: TextAlign.left,
                      style: TextStyle(
                        color: AppColors.inputTextColor,
                      ),
                  decoration: InputDecoration(
                    hintText: widget.hint,
                    hintStyle: TextStyle(
                      color: AppColors.inputTextDarkGrayColor, // Set your desired hint color
                    ),
                    suffixIcon: _crossIconController.text.length > 0
                        ? IconButton(
                            onPressed: () {
                              _crossIconController.clear();
                              widget.setParentState();
                              setState(() {});
                            },
                            icon: Icon(Icons.clear,
                                color: AppColors.paginationPurpleColor))
                        : null,
                    contentPadding: EdgeInsets.fromLTRB(40, 12, 0, 12),
                    isDense: true,
                    border: InputBorder.none,
                  ),
                )),
                Positioned(
                  top: 0,
                  left: 5,
                  child: Icon(
                    Icons.search,
                    color: AppColors.paginationPurpleColor,
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
