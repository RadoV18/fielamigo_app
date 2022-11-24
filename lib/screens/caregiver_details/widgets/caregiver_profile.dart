import 'package:fielamigo_app/bloc/user_profile_page_cubit/user_profile_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/page_status.dart';
import 'about_me.dart';
import 'caregiver_experience.dart';
import 'caregiver_pets.dart';
import 'picture_carousel.dart';

class CaregiverProfile extends StatelessWidget {
  final String firstName;

  const CaregiverProfile({
    super.key,
    required this.firstName,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserProfilePageCubit, UserProfilePageState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {},
      builder: (context, state) {
        print(state.dogs);
        if(state.status == PageStatus.fetching) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: Column(
                children: [
                  if(state.bio != null)
                    AboutMe(
                      firstName: firstName,
                      text: state.bio!,
                    ),                  
                  const SizedBox(height: 20),
                  if(state.images != null && state.images!.isNotEmpty)
                    PictureCarousel(
                      images: state.images!,
                    ),
                  const SizedBox(height: 20,),
                  if(state.dogs != null)
                    CaregiverPets(
                      firstName: firstName,
                      dogs: state.dogs!,
                    ),
                  const SizedBox(height: 20,),
                  if(state.experience != null)
                    CaregiverExperience(
                      firstName: firstName,
                      experience: state.experience!,
                    ),
                  const SizedBox(height: 20,)
                ]
              ),
            ),
          );
        }
      },
    );
  }
}
