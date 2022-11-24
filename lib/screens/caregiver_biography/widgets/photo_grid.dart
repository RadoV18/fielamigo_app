import 'dart:developer';
import 'dart:io';

import 'package:fielamigo_app/bloc/caregiver_info_image_cubit/caregiver_info_image_cubit.dart';
import 'package:fielamigo_app/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class PhotoGrid extends StatelessWidget {
  const PhotoGrid({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> addImagestoState() async {
      final ImagePicker _picker = ImagePicker();
      List<XFile?> imagesPicked = await _picker.pickMultiImage();
      for (int i = 0; i < imagesPicked.length; i++) {
        // TODO; add images to state
        log(imagesPicked[i].toString());
        // context.read<CaregiverInfoImageCubit>().addImage(imagesPicked[i]);
      }
      return;
    }

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
          child: BlocBuilder<CaregiverInfoImageCubit, CaregiverInfoImageState>(
            builder: (context, state) {
              if (state is CaregiverInfoImageLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is CaregiverInfoImageSuccess) {
                //  Navigator.pop(context, true);
                //  UiUtils.showAlertDialog(
                //   context,
                //   message: "Imagenes agregadas con éxito",
                //   isDismissible: true,
                //   onOkButtonPressed: () {
                //       Navigator.pop(context);
                //      Navigator.pop(context);
                //    }
                //  );
                return const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text("Exito."),
                  );
              } 
              else if (state is CaregiverInfoImageLoaded) {
                if (state.imagesPicked!.isEmpty) {
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
                    itemCount: state.imagesPicked?.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(.2),
                        ),
                        child: CustomImage(url: state.imagesPicked![index]),
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
                    context.read<CaregiverInfoImageCubit>().addImages();
                    context.read<CaregiverInfoImageCubit>().init();
                  },
                  child: const Text(
                    'Eliminar y añadir nuevas fotos +',
                    style: TextStyle(color: Color(0xffffffff), fontSize: 14),
                  ))),
        )
      ],
    );
  }
}

class CustomImage extends StatelessWidget {
  final String url;
  const CustomImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 80.w, height: 30.h, child: Image.network(url));
  }
}
