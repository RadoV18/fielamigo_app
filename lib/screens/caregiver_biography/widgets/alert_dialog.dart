import 'package:fielamigo_app/bloc/bio_features_cubit/bio_features_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAlert extends StatelessWidget {
  final bool isExperienceWidget;
  final String title;
  const CustomAlert({super.key, this.isExperienceWidget = false, required this.title});

  @override
  Widget build(BuildContext context) {
    TextEditingController _textFieldController = TextEditingController();

    return AlertDialog(
      title: Text(title),
      content: TextField(
        controller: _textFieldController,
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context), child: Text("Cancelar")),
        TextButton(
            onPressed: () {
              if (isExperienceWidget) {
                //si es experience
                context
                    .read<BioFeaturesCubit>()
                    .updateExperiences(experience: _textFieldController.text);
              } else {
                // si es houseFeatures
                context
                    .read<BioFeaturesCubit>()
                    .updateHouseFeatures(_textFieldController.text);
              }
              context.read<BioFeaturesCubit>().saveBioFeatures();
              Navigator.pop(context);
            },
            child: Text("Ok")),
      ],
    );
  }
}
