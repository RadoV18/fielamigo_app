import 'package:flutter/material.dart';

class CareTest extends StatelessWidget {
  final String st;

  const CareTest({
    super.key,
    required this.st
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // background color
      color: Colors.red,
      child: Center(
        child: Text(st),
      ),
    );
  }
}
