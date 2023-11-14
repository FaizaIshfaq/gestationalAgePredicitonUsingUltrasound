import 'package:fetal_femur_ultrasound/res/components/webModel.dart';
import 'package:flutter/material.dart';

import '../AppConst.dart';
import 'outlineButtonWithoutIcon.dart';

class FiltersWeb extends StatefulWidget {
  List<Widget> childrens;
  Function() onClickSearch;

  FiltersWeb(
      {Key? key, required this.childrens, required this.onClickSearch})
      : super(key: key);

  @override
  State<FiltersWeb> createState() => _FiltersWebState();
}

class _FiltersWebState extends State<FiltersWeb> {
  @override
  Widget build(BuildContext context) {
    return WebModal(
      titleAlignment: Alignment.bottomCenter,
      content: SizedBox(
        width: 500,
        child: IntrinsicHeight(
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.childrens),
              SizedBox(
                height: 10,
              ),
              Container(
                  alignment: Alignment.center,
                  child:OutlineButtonWithoutIcon(
                title:"Search",
                width: 150,
                onPress:(){widget.onClickSearch();},
                borderColor: AppColors.skyBlueColor,
              ),)
            ],
          ),
        ),
      ),
      title: 'Filters',
    );
  }
}
