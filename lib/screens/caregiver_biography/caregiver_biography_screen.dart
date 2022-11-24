import 'package:fielamigo_app/bloc/bio_features_cubit/bio_features_cubit.dart';
import 'package:fielamigo_app/bloc/page_status.dart';
import 'package:fielamigo_app/widgets/custom_app_bar.dart';
import 'package:fielamigo_app/widgets/features_widget.dart';
import 'package:fielamigo_app/widgets/large_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/experience_widget.dart';
import 'widgets/photo_grid.dart';

class CaregiverBiographyScreen extends StatelessWidget {
  CaregiverBiographyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: CustomAppBar(
          title: "Biografía",
          showLeading: true,
          onBackButtonPressed: () => Navigator.pop(context),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 20,
              bottom: MediaQuery.of(context).padding.bottom,
              left: 5.w,
              right: 5.w,
            ),
            child: Column(
              children: [
                BlocBuilder<BioFeaturesCubit, BioFeaturesState>(
                  builder: (context, state) {
                    if (state.pageStatus == PageStatus.loading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state.pageStatus == PageStatus.success) {
                      return LargeTextInput(
                        hintText: 'Soy...',
                        title: 'Cuéntanos un poco mas de ti:',
                        bioText: state.bio,
                      );
                    } else {
                      return const Center(
                        child: Text("Error"),
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                const PhotoGrid(),
                const SizedBox(
                  height: 30,
                ),
                const Experience(
                  title: '¿Cúal es tu experiencia?',
                  buttonString: 'Añadir experiencia',
                ),
                const SizedBox(
                  height: 30,
                ),
                const Features(
                  title: 'Que Características tiene tu casa?',
                  buttonString: 'Añadir característica',
                ),
                const SizedBox(
                  height: 30,
                ),
                DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xff01bf8f),
                    ),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            alignment: Alignment.center,
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.only(
                                    right: 75, left: 75, top: 15, bottom: 15)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                            )),
                        onPressed: () {
                          context.read<BioFeaturesCubit>().saveBio();
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Guardar",
                          style:
                              TextStyle(color: Color(0xffffffff), fontSize: 16),
                        ))),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).padding.bottom + 10))
              ],
            ),
          ),
        ));
  }
}
