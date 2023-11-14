import 'package:fetal_femur_ultrasound/res/components/outlineButtonWithoutIcon.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../../res/AppConst.dart';

class profileScreenWeb extends StatefulWidget {
  const profileScreenWeb({Key? key}) : super(key: key);

  @override
  State<profileScreenWeb> createState() => _profileScreenWebState();
}

class _profileScreenWebState extends State<profileScreenWeb> {
  TextEditingController dobDateController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  late String selectedDate;

  late String dobDate;
  File? _image; // Variable to store the selected image

  Future<void> _getImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackgroundBlueColor,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20.0,
          left: 30,
          right: 30,
        ),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Profile',
                style: TextStyle(
                  color: AppColors.profileTextColor,
                  // Set your desired text color
                  fontSize: 25.0, // Set your desired font size
                ),
              ),
            ),
            const SizedBox(height: 70.0),
            Padding(
              padding: const EdgeInsets.only(left: 70.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width:100,
                            child: Text(
                              'First Name',
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: AppColors.profilePageTextWhiteColor,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                          const SizedBox(width: 50.0),
                          Text(
                            'Munib Mazari',
                            style: const TextStyle(
                              color: AppColors.profilePageTextWhiteColor,
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30.0),
                      Row(
                        children: [
                          SizedBox(
                            width:100,
                            child: Text(
                              'Last Name',
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: AppColors.profilePageTextWhiteColor,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                          const SizedBox(width: 50.0),
                          Text(
                            'Mazari Ahmad',
                            style: const TextStyle(
                              color: AppColors.profilePageTextWhiteColor,
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width:100,
                            child: Text(
                              'Email',
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: AppColors.profilePageTextWhiteColor,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                          const SizedBox(width: 50.0),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              'munibmzari07@gmail.com',
                              style: const TextStyle(
                                color: AppColors.magentaTextColor,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width:100,
                            child: Text(
                              'Password',
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: AppColors.profilePageTextWhiteColor,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                          const SizedBox(width: 50.0),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              '************',
                              style: const TextStyle(
                                color: AppColors.skyBlueColor,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30.0),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Photo',
                        style: const TextStyle(
                          color: AppColors.skyBlueColor,
                          fontSize: 15.0,
                        ),
                      ),
                      SizedBox(height: 8,),
                      Container(
                        height: 200,
                        width: 200,
                        child: _image != null
                            ? kIsWeb
                            ? Image.network(
                          _image!.path,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        )
                            : Image.file(
                          _image!,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        )
                            : Image.asset('lib/images/dummyImage.png') // Display dummy image icon
                      ),
                      SizedBox(height: 15,),
                      OutlineButtonWithoutIcon(
                        title:"Upload",
                        onPress: _getImage,
                        borderColor: AppColors.skyBlueColor,
                      ),

                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
