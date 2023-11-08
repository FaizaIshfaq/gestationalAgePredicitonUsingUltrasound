import 'package:fetal_femur_ultrasound/res/components/round_button.dart';
import 'package:fetal_femur_ultrasound/view/home_screen.dart';
import 'package:fetal_femur_ultrasound/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';
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
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    _obsecurePassword.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final authViewModel=Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context)
                       .size.height*1;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocusNode,
              decoration: const InputDecoration(
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
                          prefixIcon: const Icon(Icons.lock_open_rounded),
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
            const SizedBox(
                height:30,
            ),
            RoundButton(
              title: 'Button Text',
              loading: authViewModel.loading,// This text will be displayed inside the button
              onPress: () {
                if(_emailController.text.isEmpty){
                  Utils.flushBarErrorMessages("Please enter email", context);
                }else if(_passwordController.text.isEmpty){
                  Utils.flushBarErrorMessages("Please enter password", context);
                }else if(_passwordController.text.length<6){
                  Utils.snakBar("Please enter 6 digit password", context);
                }else{
                  Map data={
                    "email":_emailController.text.toString(),
                    "password":_passwordController.text.toString(),
                  };
                  authViewModel.loginApi(data,context);
                  print("Api hit");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
