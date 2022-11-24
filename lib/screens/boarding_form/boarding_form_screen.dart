import 'package:fielamigo_app/screens/boarding_form/widgets/boarding_date_range.dart';
import 'package:fielamigo_app/screens/boarding_form/widgets/boarding_description.dart';
import 'package:fielamigo_app/screens/boarding_form/widgets/boarding_location.dart';
import 'package:fielamigo_app/screens/boarding_form/widgets/boarding_pets.dart';
import 'package:fielamigo_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/boarding_cubit/boarding_cubit.dart';
import '../../bloc/page_status.dart';
import '../../utils/ui_utils.dart';

class BoardingFormScreen extends StatelessWidget {
  const BoardingFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        onBackButtonPressed: () {
          Navigator.pop(context);
          context.read<BoardingCubit>().clear();
        },
        title: 'Alojamiento para perros',
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<BoardingCubit, BoardingState>(
          listenWhen:(previous, current) => previous.status != current.status,
          listener: (context, state) {
            if (state.status == PageStatus.success) {
              // go to the results page
              Navigator.pop(context, true);
              Navigator.pushNamed(context, '/search-results');
            } else if(state.status == PageStatus.loading) {
              // show loading
              UiUtils.showAlertDialog(
                context,
                message: "Buscando cuidadores...",
                isDismissible: false,
                hasCircularProgressIndicator: true
              );
            } else if(state.status == PageStatus.error) {
              // show error
              UiUtils.showAlertDialog(
                context,
                message: "No se encontraron cuidadores.",
                isDismissible: true
              );
            }
          },
          buildWhen:(previous, current) {
            return previous != current;
          },
          builder: (context, state) => Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Column(
              children: [
                const BoardingDescription(),
                const SizedBox(
                  height: 20,
                ),
                const BoardingDateRange(),
                const SizedBox(
                  height: 20,
                ),
                const BoardingLocation(),
                const SizedBox(
                  height: 20,
                ),
                const BoardingPets(),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<BoardingCubit>().submit();
                  },
                  child: const Text('Buscar alojamiento'),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}
