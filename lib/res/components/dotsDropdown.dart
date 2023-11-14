import 'package:fetal_femur_ultrasound/res/AppConst.dart';
import 'package:flutter/material.dart';

class DotsDropdown extends StatelessWidget {
  const DotsDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      tooltip: '',
      color: AppColors.inputFieldBackgroundColor,
      icon: Icon(
        Icons.more_horiz,
        color: AppColors.iconPurpleColor,
      ),
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem<String>(
            value: 'delete',
            child: const Text(
              'Delete',
              style: TextStyle(
                color: AppColors.inputTextColor,
              ),
            ),
          ),
        ];
      },
      onSelected: (String value) {
        // Handle item selection
        if (value == 'delete') {
          // Show a confirmation dialog
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: AppColors.overlayPurpleColor,
                // Change background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  // Apply border radius
                  side: BorderSide(
                      color: AppColors.paginationPurpleColor), // Apply border
                ),
                title: Center(
                  child: Text(
                    'Confirm Deletion',
                    style: TextStyle(color: AppColors.magentaTextColor),
                  ),
                ),
                content: Text(
                  'Are you sure you want to delete?',
                  style: TextStyle(color: AppColors.profileTextColor),
                ),
                actions: [
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.inputFieldBackgroundColor,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: Text('Cancel'),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.inputFieldBackgroundColor,
                    ),
                    onPressed: () {
                      // Handle delete action
                      print('Delete action');
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: Text(
                      'Delete',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              );
            },
          );
        }
      },
      enableFeedback: false, // Disable hover effect
    );
  }
}
