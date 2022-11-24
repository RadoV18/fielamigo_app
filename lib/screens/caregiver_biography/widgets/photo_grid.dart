import 'dart:developer';

import 'package:fielamigo_app/bloc/bio_features_cubit/bio_features_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../bloc/page_status.dart';
import 'custom_image.dart';

class PhotoGrid extends StatelessWidget {
  const PhotoGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "¿Que imágenes quieres mostrar en tu perfil?",
          style: TextStyle(
              fontSize: 4.w,
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(.9)),
        ),
        Center(
          child: BlocBuilder<BioFeaturesCubit, BioFeaturesState>(
            builder: (context, state) {
              if (state.pageStatus == PageStatus.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.pageStatus == PageStatus.success) {
                if (state.imagesRes.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text("No hay imágenes."),
                  );
                }
                return SizedBox(
                  width: 80.w,
                  height: 30.h,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                    itemCount: state.imagesRes.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(.2),
                        ),
                        child: CustomImage(url: state.imagesRes[index]),
                      );
                    },
                  ),
                );
              }
              return const Center(
                child: Text("Error desconocido!"),
              );
            },
          ),
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
                    context.read<BioFeaturesCubit>().setImagesReq();
                  },
                  child: const Text(
                    'Añadir nuevas fotos +',
                    style: TextStyle(color: Color(0xffffffff), fontSize: 14),
                  ))),
        )
      ],
    );
  }
}
