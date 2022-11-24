import 'package:fielamigo_app/bloc/bio_features_cubit/bio_features_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class LargeTextInput extends StatefulWidget {

  final String title;
  final String hintText;
  final String bioText;

  const LargeTextInput(
      {Key? key,
      required this.title,
      required this.hintText,
      this.bioText = ""})
      : super(key: key);

  @override
  State<LargeTextInput> createState() => _LargeTextInputState();
}

class _LargeTextInputState extends State<LargeTextInput> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xff01bf8f);
    const secondaryColor = Color(0xff047b5b);
    const accentColor = Color(0xffffffff);
    const errorColor = Color(0xffEF4444);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
              fontSize: 4.w,
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(.9)),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 200,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                offset: const Offset(12, 26),
                blurRadius: 50,
                spreadRadius: 0,
                color: Colors.grey.withOpacity(.1)),
          ]),
          child: TextFormField(
            initialValue: widget.bioText,
            onChanged: (value) => context.read<BioFeaturesCubit>().setBio(value),
            keyboardType: TextInputType.multiline,
            maxLines: null,
            expands: true,
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.top,
            style: const TextStyle(fontSize: 14, color: Colors.black),
            decoration: InputDecoration(
              // prefixIcon: Icon(Icons.email),
              filled: true,
              fillColor: accentColor,
              hintText: widget.hintText,
              hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: secondaryColor, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: errorColor, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
