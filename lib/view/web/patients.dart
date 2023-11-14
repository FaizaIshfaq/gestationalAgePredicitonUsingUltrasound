import 'package:fetal_femur_ultrasound/res/components/outlineButtonWeb.dart';
import 'package:flutter/material.dart';

import '../../res/AppConst.dart';
import '../../res/components/datePicker.dart';
import '../../res/components/inputField.dart';
import '../../res/components/inputFieldWithCarrot.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  TextEditingController dobDateController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  late String selectedDate ;
  late String dobDate;
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
                'Patients Examine',
                style: TextStyle(
                  color: AppColors.profileTextColor,
                  // Set your desired text color
                  fontSize: 25.0, // Set your desired font size
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.overlayPurpleColor,
                    border: Border.all(
                      color: AppColors.profileTextColor,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 50, left: 20, bottom: 20, right: 20),
                    child: Column(
                      children: [
                        const IntrinsicHeight(
                          child: Row(
                            children: [
                              InputFieldWithLabel(
                                label: 'First Name',
                                hintText: 'First name',
                                dateIcon: false,
                              ),
                              SizedBox(width: 16.0),
                              // Add some space between the input fields
                              InputFieldWithLabel(
                                label: 'Last Name',
                                hintText: 'Last name',
                                dateIcon: false,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              SizedBox(
                                width:255,
                                child: InputFieldWithLabel(
                                  textEditingController: dobDateController,
                                  label: 'DOB',
                                  hintText: 'Date of birth',
                                  dateIcon: true,
                                  onTap: () {
                                  DatePicker().selectDate(
                                      context,
                                      onFormatDate: (date) {
                                        dobDate = date;
                                        dobDateController.text = date;
                                      },onServerDateFormat: (serverDateFormat){

                                  }
                                  );
                                },
                                ),
                              ),
                              SizedBox(width: 20.0),
                              SizedBox(
                                width: 255,
                                child: InputFieldLabelWithCarot(
                                  label: 'Gender',
                                  hintText: 'Choose gender',
                                  dropdownItems: [
                                    'Female',
                                  ],
                                ),
                              ),
                              SizedBox(width: 16.0),
                              // Add some space between the input fields
                              InputFieldWithLabel(
                                dateIcon: true,
                                textEditingController: startDateController,
                                label: 'Date',
                                hintText: 'Select date',
                                onTap: () {
                                  DatePicker().selectDate(
                                      context,
                                      onFormatDate: (date) {
                                        selectedDate = date;
                                        startDateController.text = date;
                                      },onServerDateFormat: (serverDateFormat){

                                  }
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        const IntrinsicHeight(
                          child: Row(
                            children: [
                              Expanded(
                                flex:1,
                                child: InputFieldLabelWithCarot(
                                  label: 'Trimester',
                                  hintText: 'Select trimester',
                                  dropdownItems: [
                                    'First',
                                    'Second',
                                    'Third',
                                  ],
                                ),
                              ),
                              SizedBox(width: 16.0),
                              Expanded(
                                flex:1,
                                child: InputFieldWithLabel(
                                  label: 'Doctor',
                                  hintText: 'Examined by',
                                  dateIcon: false,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              InputFieldWithLabel(
                                label: 'Email',
                                hintText: 'Email',
                                dateIcon: false,
                              ),
                              const SizedBox(width: 16.0),
                              // Add some space between the input fields
                              InputFieldWithLabel(
                                label: 'Phone',
                                hintText: 'Phone',
                                dateIcon: false,
                                inputFormatter: NUMBER_WITHOUT_DECIMAL,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 50.0),
                        IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              OutlineButtonWeb(
                                title:"Save",
                                onPress:(){},
                                borderColor: AppColors.magentaTextColor,
                              ),
                              const SizedBox(width: 15.0),
                              OutlineButtonWeb(
                                title:"Exam",
                                onPress:(){},
                                borderColor: AppColors.greenOutlineColor,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: -17,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      width: 250.0,
                      color: AppColors.screenBackgroundBlueColor,
                      child: const Center(
                        child: Text(
                          'Patients Details',
                          style: TextStyle(
                            color: Colors.pink,
                            fontSize: 24.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
