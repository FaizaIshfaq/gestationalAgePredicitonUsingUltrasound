import 'package:fetal_femur_ultrasound/res/components/round_button.dart';
import 'package:fetal_femur_ultrasound/view/mobile/home_screen.dart';
import 'package:flutter/material.dart';

import '../../utils/routes/routes_name.dart';
import '../../utils/utils.dart';
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final ValueNotifier<bool> _obsecurePassword=ValueNotifier<bool>(true);
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  FocusNode emailFocusNode=FocusNode();
  FocusNode passwordFocusNode=FocusNode();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context)
                       .size.height*1;
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
        // body: Center(
        //    child: InkWell(
        //      onTap:(){
        //        Utils.snakBar('No Internet access', context);
        //        // Utils.flushBarErrorMessages('No Internet access', context);
        //        // Utils.toastMessage("toast msg no internet");
        //        // Navigator.pushNamed(context, RoutesName.home);
        //        // Navigator.push(
        //        //     context,
        //        //     MaterialPageRoute(builder: (context)=>HomeScreen()),
        //        // );
        //        },
        //      child: Text('Click'),
        //    ),
        // )
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocusNode,
              decoration: InputDecoration(
              hintText:"email",
                labelText: "Email",
                prefixIcon: Icon(Icons.alternate_email)
              ),
              onFieldSubmitted: (value){
                Utils.fieldFocusChange(context, emailFocusNode, passwordFocusNode);
              },
            ),
            ValueListenableBuilder(
                valueListenable: _obsecurePassword,
                builder: (context,value,child){
                  return TextFormField(
                      controller: _passwordController,
                      obscureText: _obsecurePassword.value,
                      focusNode: passwordFocusNode,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                          hintText:"password",
                          labelText: "Password",
                          prefixIcon: Icon(Icons.lock_open_rounded),
                          suffixIcon: InkWell(
                              onTap: (){
                                _obsecurePassword.value=!_obsecurePassword.value;
                              },
                              child: Icon(_obsecurePassword.value?Icons.visibility_off_outlined:Icons.visibility)
                          )
                      )
                  );
                }
            ),
            SizedBox(
                height:30,
            ),
            RoundButton(title: "Submit", onPress: (){})
          ],
        ),
      ),
    );
  }
}
