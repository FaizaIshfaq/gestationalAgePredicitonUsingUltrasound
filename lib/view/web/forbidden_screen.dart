import 'package:flutter/material.dart';

class ForbiddenScreen extends StatefulWidget {
  const ForbiddenScreen({Key? key}) : super(key: key);

  @override
  State<ForbiddenScreen> createState() => _ForbiddenScreenState();
}

class _ForbiddenScreenState extends State<ForbiddenScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Forbidden'),
      ),
    );
  }
}
