import 'package:fetal_femur_ultrasound/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreenWeb extends StatefulWidget {
  const LoginScreenWeb({Key? key}) : super(key: key);

  @override
  State<LoginScreenWeb> createState() => _LoginScreenWebState();
}

class _LoginScreenWebState extends State<LoginScreenWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
          onPressed: () {
            Get.offAllNamed(RoutesName.masterLayout);
          },
          child: const Text('Login')),
    ));
  }
}
