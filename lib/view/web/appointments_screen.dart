import 'package:flutter/material.dart';

import '../../res/AppConst.dart';
import '../../res/components/alert_dialog.dart';
import '../../res/components/custom_round_image.dart';
import '../../res/components/datePicker.dart';
import '../../res/components/dotsDropdown.dart';
import '../../res/components/filtereButton.dart';
import '../../res/components/filtersWeb.dart';
import '../../res/components/inputField.dart';
import '../../res/components/paginationWeb.dart';
import '../../res/components/searchBarWeb.dart';
import '../../res/components/simpleButton.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  late String startDate;
  int filtersCount=0;
  late String endDate;

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Appointment',
                  style: TextStyle(
                    color: AppColors.profileTextColor,
                    // Set your desired text color
                    fontSize: 25.0, // Set your desired font size
                  ),
                ),
                Row(
                  children: [
                    ListsTopFilterButton(
                      count: filtersCount,
                      onPressed: () =>{
                        MyAlertDialog.showAlertDialog(
                            context,
                                (context) => FiltersWeb(
                              onClickSearch:(){
                                setState(() {
                                });
                                Navigator.pop(context, true);
                              },
                              childrens:[
                                Row(
                                  children: [
                                    InputFieldWithLabel(
                                      textEditingController: startDateController,
                                      label: 'Start Date',
                                      hintText: 'Select start date',
                                      dateIcon: true,
                                      onTap: () {
                                        DatePicker().selectDate(
                                            context,
                                            onFormatDate: (date) {
                                              startDate = date;
                                              startDateController.text = date;
                                            },onServerDateFormat: (serverDateFormat){

                                        }
                                        );
                                      },
                                    ),
                                    SizedBox(width: 20.0),
                                    InputFieldWithLabel(
                                      textEditingController: endDateController,
                                      label: 'DOB',
                                      hintText: 'Date of birth',
                                      dateIcon: true,
                                      onTap: () {
                                        DatePicker().selectDate(
                                            context,
                                            onFormatDate: (date) {
                                              endDate = date;
                                              endDateController.text = date;
                                            },onServerDateFormat: (serverDateFormat){
                                        }
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.0),
                                Row(
                                  children: [
                                    InputFieldWithLabel(
                                      label: 'Name',
                                      hintText: 'Enter Name',
                                      dateIcon: false,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.0),
                                Row(
                                  children: [
                                    InputFieldWithLabel(
                                      label: 'Age',
                                      hintText: 'Enter Age',
                                      dateIcon: false,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.0),
                                Row(
                                  children: [
                                    InputFieldWithLabel(
                                      label: 'Trimester',
                                      hintText: 'Enter Trimester',
                                      dateIcon: false,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.0),
                                Row(
                                  children: [
                                    InputFieldWithLabel(
                                      label: 'Doctor',
                                      hintText: 'Enter Doctor',
                                      dateIcon: false,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.0),
                              ],
                            )),
                      },
                    ),
                    SizedBox(width: 10,),
                    SimpleButton(
                      title: 'New Patient',
                      borderColor: AppColors.darkPurpleButtonColor,
                      onPress: () {  },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10,),
            SearchFieldHeaderWeb(
              hint: 'Search by name, email or phone',
              setParentState: (){
              },
              onChange: (val) {
                print(val);
              },
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 2,
                  child: Text('Name',style: TextStyle(
                    color: AppColors.whiteHeadingColor,
                    fontSize: 20,
                  ),),
                ),
                Expanded(
                  flex: 2,
                  child: Text('Email',style: TextStyle(
                    color: AppColors.whiteHeadingColor,
                    fontSize: 20,
                  ),),
                ),
                Expanded(
                  flex: 2,
                  child: Text('Date',style: TextStyle(
                    color: AppColors.whiteHeadingColor,
                    fontSize: 20,
                  ),),
                ),
                Expanded(
                  flex: 2,
                  child: Text('Visit Time',style: TextStyle(
                    color: AppColors.whiteHeadingColor,
                    fontSize: 20,
                  ),),
                ),
                Expanded(
                  flex: 2,
                  child: Text('Docotor',style: TextStyle(
                    color: AppColors.whiteHeadingColor,
                    fontSize: 20,
                  ),),
                ),
                Expanded(
                  flex: 2,
                  child: Text('Trimester',style: TextStyle(
                    color: AppColors.whiteHeadingColor,
                    fontSize: 20,
                  ),),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              CustomCircleImage(
                                image:'lib/images/patient1.jpg',
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text('Austin',style: TextStyle(
                                color: AppColors.whiteHeadingColor,
                                fontSize: 16,
                              ),),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text('austin@gmail.com',style: TextStyle(
                            color: AppColors.whiteHeadingColor,
                            fontSize: 16,
                          ),),
                        ),
                        Expanded(
                          flex: 2,
                          child:
                          Text('12, November 2023',style: TextStyle(
                            color: AppColors.whiteHeadingColor,
                            fontSize: 16,
                          ),),
                        ),
                        Expanded(
                          flex: 2,
                          child:
                          Text('15, November 2023',style: TextStyle(
                            color: AppColors.whiteHeadingColor,
                            fontSize: 16,
                          ),),
                        ),
                        Expanded(
                          flex: 2,
                          child:
                          Text('Dr. Madiha',style: TextStyle(
                            color: AppColors.whiteHeadingColor,
                            fontSize: 16,
                          ),),
                        ),
                        Expanded(
                          flex: 2,
                          child:
                          Text('1st Trimester',style: TextStyle(
                            color: AppColors.whiteHeadingColor,
                            fontSize: 16,
                          ),),
                        ),
                        Expanded(
                            flex: 1,
                            child: DotsDropdown())
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              CustomCircleImage(
                                image:'lib/images/patient2.jpg',
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text('Oliver',style: TextStyle(
                                color: AppColors.whiteHeadingColor,
                                fontSize: 16,
                              ),),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text('oliver@gmail.com',style: TextStyle(
                            color: AppColors.whiteHeadingColor,
                            fontSize: 16,
                          ),),
                        ),
                        Expanded(
                          flex: 2,
                          child:
                          Text('12, October 2021',style: TextStyle(
                            color: AppColors.whiteHeadingColor,
                            fontSize: 16,
                          ),),
                        ),
                        Expanded(
                          flex: 2,
                          child:
                          Text('15, October 2023',style: TextStyle(
                            color: AppColors.whiteHeadingColor,
                            fontSize: 16,
                          ),),
                        ),
                        Expanded(
                          flex: 2,
                          child:
                          Text('Dr. James',style: TextStyle(
                            color: AppColors.whiteHeadingColor,
                            fontSize: 16,
                          ),),
                        ),
                        Expanded(
                          flex: 2,
                          child:
                          Text('3rd Trimester',style: TextStyle(
                            color: AppColors.whiteHeadingColor,
                            fontSize: 16,
                          ),),
                        ),
                        Expanded(
                            flex: 1,
                            child: DotsDropdown())
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              CustomCircleImage(
                                image:'lib/images/patient3.jpg',
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text('Noah',style: TextStyle(
                                color: AppColors.whiteHeadingColor,
                                fontSize: 16,
                              ),),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text('noah@gmail.com',style: TextStyle(
                            color: AppColors.whiteHeadingColor,
                            fontSize: 16,
                          ),),
                        ),
                        Expanded(
                          flex: 2,
                          child:
                          Text('29, January 2020',style: TextStyle(
                            color: AppColors.whiteHeadingColor,
                            fontSize: 16,
                          ),),
                        ),
                        Expanded(
                          flex: 2,
                          child:
                          Text('30, January 2023',style: TextStyle(
                            color: AppColors.whiteHeadingColor,
                            fontSize: 16,
                          ),),
                        ),
                        Expanded(
                          flex: 2,
                          child:
                          Text('Dr. Emily',style: TextStyle(
                            color: AppColors.whiteHeadingColor,
                            fontSize: 16,
                          ),),
                        ),
                        Expanded(
                          flex: 2,
                          child:
                          Text('1st Trimester',style: TextStyle(
                            color: AppColors.whiteHeadingColor,
                            fontSize: 16,
                          ),),
                        ),
                        Expanded(
                            flex: 1,
                            child: DotsDropdown())
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              CustomCircleImage(
                                image:'lib/images/patient4.jpg',
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text('Ethan',style: TextStyle(
                                color: AppColors.whiteHeadingColor,
                                fontSize: 16,
                              ),),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text('ethan@gmail.com',style: TextStyle(
                            color: AppColors.whiteHeadingColor,
                            fontSize: 16,
                          ),),
                        ),
                        Expanded(
                          flex: 2,
                          child:
                          Text('12, March 2023',style: TextStyle(
                            color: AppColors.whiteHeadingColor,
                            fontSize: 16,
                          ),),
                        ),
                        Expanded(
                          flex: 2,
                          child:
                          Text('15, March 2023',style: TextStyle(
                            color: AppColors.whiteHeadingColor,
                            fontSize: 16,
                          ),),
                        ),
                        Expanded(
                          flex: 2,
                          child:
                          Text('Dr. Madiha',style: TextStyle(
                            color: AppColors.whiteHeadingColor,
                            fontSize: 16,
                          ),),
                        ),
                        Expanded(
                          flex: 2,
                          child:
                          Text('2nd Trimester',style: TextStyle(
                            color: AppColors.whiteHeadingColor,
                            fontSize: 16,
                          ),),
                        ),
                        Expanded(
                            flex: 1,
                            child: DotsDropdown())
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              CustomCircleImage(
                                image:'lib/images/patient5.jpg',
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text('Lucas',style: TextStyle(
                                color: AppColors.whiteHeadingColor,
                                fontSize: 16,
                              ),),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text('lucas@gmail.com',style: TextStyle(
                            color: AppColors.whiteHeadingColor,
                            fontSize: 16,
                          ),),
                        ),
                        Expanded(
                          flex: 2,
                          child:
                          Text('1, November 2018',style: TextStyle(
                            color: AppColors.whiteHeadingColor,
                            fontSize: 16,
                          ),),
                        ),
                        Expanded(
                          flex: 2,
                          child:
                          Text('5, November 2018',style: TextStyle(
                            color: AppColors.whiteHeadingColor,
                            fontSize: 16,
                          ),),
                        ),
                        Expanded(
                          flex: 2,
                          child:
                          Text('Dr. Sophie',style: TextStyle(
                            color: AppColors.whiteHeadingColor,
                            fontSize: 16,
                          ),),
                        ),
                        Expanded(
                          flex: 2,
                          child:
                          Text('3rd Trimester',style: TextStyle(
                            color: AppColors.whiteHeadingColor,
                            fontSize: 16,
                          ),),
                        ),
                        Expanded(
                            flex: 1,
                            child: DotsDropdown())
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              CustomCircleImage(
                                image:'lib/images/patient6.jpg',
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text('Grace',style: TextStyle(
                                color: AppColors.whiteHeadingColor,
                                fontSize: 16,
                              ),),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text('grace@gmail.com',style: TextStyle(
                            color: AppColors.whiteHeadingColor,
                            fontSize: 16,
                          ),),
                        ),
                        Expanded(
                          flex: 2,
                          child:
                          Text('12, December 2023',style: TextStyle(
                            color: AppColors.whiteHeadingColor,
                            fontSize: 16,
                          ),),
                        ),
                        Expanded(
                          flex: 2,
                          child:
                          Text('15, December 2023',style: TextStyle(
                            color: AppColors.whiteHeadingColor,
                            fontSize: 16,
                          ),),
                        ),
                        Expanded(
                          flex: 2,
                          child:
                          Text('Dr. Chloe',style: TextStyle(
                            color: AppColors.whiteHeadingColor,
                            fontSize: 16,
                          ),),
                        ),
                        Expanded(
                          flex: 2,
                          child:
                          Text('1st Trimester',style: TextStyle(
                            color: AppColors.whiteHeadingColor,
                            fontSize: 16,
                          ),),
                        ),
                        Expanded(
                            flex: 1,
                            child: DotsDropdown())
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            WebPagination(
              onPageChanged: (int value) {  },
              currentPage: 1,
              totalPage: 6,
            ),
          ],
        ),
      ),
    );
  }
}
