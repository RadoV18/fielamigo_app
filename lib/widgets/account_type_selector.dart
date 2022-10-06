import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AccountTypeSelector extends StatelessWidget {
  const AccountTypeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          SizedBox(
            width: 100.w,
            child: const Text('Selecciona el tipo de cuenta:')
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AccountType(
                icon: null,
                onTap: () {  },
                text: ''
              ),
              AccountType(
                icon: null,
                onTap: () {  },
                text: ''
              ),
          ],)
        ]
      );
  }
}

class AccountType extends StatelessWidget {

  final Function()? onTap;
  final bool isSelected;
  final String text;
  final IconData? icon;

  const AccountType({
    super.key,
    required this.onTap,
    this.isSelected = false,
    required this.text,
    this.icon
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Ink(
        height: 64.0,
        width: 64.0,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: const Color.fromARGB(255, 139, 139, 139)),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(2, 2),
              blurRadius: 5.0
            )
          ],
          color: isSelected
            ? Theme.of(context).primaryColor
            : Colors.white,
        ),
        child: Column(
            children: [
              Icon(
                icon,
                size: 40.0
              ),
              Text(text)
            ]
          )
      )
    );
  }
}