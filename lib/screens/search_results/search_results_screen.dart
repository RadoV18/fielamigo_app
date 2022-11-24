import 'package:fielamigo_app/screens/search_results/widgets/results_bar.dart';
import 'package:fielamigo_app/screens/search_results/widgets/results_list.dart';
import 'package:fielamigo_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/boarding_cubit/boarding_cubit.dart';

class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onBackButtonPressed: () => Navigator.pop(context),
        title: 'Resultados de búsqueda',
      ),
      body: BlocConsumer<BoardingCubit, BoardingState>(
        listener: (context, state) {},
        builder: (context, state) => Column(
          children: const [
            // results bar
            ResultsBar(),
            // results list
            SingleChildScrollView(
              child: NotificationListener<OverscrollIndicatorNotification>(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: ResultsList(),
                ),
              )
            ),
          ],
        ),
      )
    );
  }
}
