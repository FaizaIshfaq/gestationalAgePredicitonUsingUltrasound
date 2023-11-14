import 'package:flutter/material.dart';
import '../AppConst.dart';

class WebModal extends StatefulWidget {
  WebModal({Key? key, required this.title, required this.content, this.titleAlignment})
      : super(key: key);
  String title;
  Widget content;
  AlignmentGeometry? titleAlignment;
  @override
  State<WebModal> createState() => _WebModalState();
}

class _WebModalState extends State<WebModal> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0), // Adjust the border radius as needed
        side: BorderSide(
          color: AppColors.paginationOutlinePurpleColor, // Set your desired border color
          width: 2.0, // Set your desired border width
        ),
      ),
      backgroundColor: AppColors.overlayPurpleColor,
      title: Stack(
        children: [
          Align(
            alignment: widget.titleAlignment?? Alignment.bottomCenter,
            child: Text(
              widget.title,
              style: TextStyle(
                color: AppColors.magentaTextColor,
                fontSize: 25.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Positioned(
            top: -10,
            right: -10,
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.close,color: AppColors.buttonOutlinePurpleColor,),
              tooltip: 'Close',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
      content: widget.content,
    );
  }
}
