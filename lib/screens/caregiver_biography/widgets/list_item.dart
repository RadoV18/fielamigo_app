import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FeatureItem extends StatelessWidget {
  final String feature;
  const FeatureItem({
    super.key, required this.feature
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(feature),
      onTap: () {}, //TODO: handle removal
    );
  }
}
