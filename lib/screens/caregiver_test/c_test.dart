import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CareTest extends StatelessWidget {
  final String st;

  const CareTest({
    super.key,
    required this.st
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(st),
      ),
    );
  }
}
