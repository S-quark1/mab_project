import 'package:flutter/material.dart';

class Information extends StatefulWidget {
  const Information({Key? key}) : super(key: key);

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Information',
        style: TextStyle(fontSize: 72),
      ),
    );
  }
}
