import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final void Function() onBackButtonPressed;
  final String title;
  final IconButton? actionButton;
  
  const CustomAppBar({
    super.key,
    required this.onBackButtonPressed,
    this.title = 'Fiel Amigo',
    this.preferredSize = const Size.fromHeight(56),
    this.actionButton
  });

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.arrow_back_rounded),
            onPressed: onBackButtonPressed,
          );
        },
      ),
      title: Text(title),
      centerTitle: true,
      actions: [
        if(actionButton != null) actionButton!
      ],
    );
  }
}