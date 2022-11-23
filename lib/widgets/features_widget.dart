import 'package:fielamigo_app/bloc/bio_features_cubit/bio_features_cubit.dart';
import 'package:fielamigo_app/screens/caregiver_biography/widgets/list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class Features extends StatelessWidget {
  final String title;
  final String buttonString;

  const Features({super.key, required this.title, required this.buttonString});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 4.w,
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(.9)),
        ),
        const SizedBox(
          height: 8,
        ),
        Center(
          child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xff3a5080),
              ),
              child: ElevatedButton(
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      alignment: Alignment.center,
                      padding: MaterialStateProperty.all(const EdgeInsets.only(
                          right: 25, left: 25, top: 5, bottom: 5)),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      )),
                  onPressed: () {
                    //TODO: make this button work
                  },
                  child: Text(
                    '$buttonString +',
                    style:
                        const TextStyle(color: Color(0xffffffff), fontSize: 14),
                  ))),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                offset: const Offset(12, 26),
                blurRadius: 50,
                spreadRadius: 0,
                color: Colors.grey.withOpacity(.1)),
          ]),
          child: BlocProvider(
            create: (context) => BioFeaturesCubit(),
            child: BlocBuilder<BioFeaturesCubit, BioFeaturesState>(
                builder: (context, state) {
              if (state is BioFeaturesLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is BioFeaturesLoaded) {
                return ListView.builder(
                  itemCount: state.houseFeatures.length,
                  itemBuilder: (context, index) =>
                      FeatureItem(feature: state.houseFeatures[index]),
                );
              } else {
                return const Center(
                  child: Text('Error'),
                );
              }
            }),
          ),
        ),
      ],
    );
  }
}
