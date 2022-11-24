import 'package:fielamigo_app/bloc/user_services_cubit/user_services_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

import '../data/models/date_count.dart';

class CustomCalendar extends StatefulWidget {
  final int caregiverId;

  const CustomCalendar({
    super.key,
    required this.caregiverId,
  });

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserServicesCubit, UserServicesState>(
      buildWhen: (previous, current) => previous.bookedDates != current.bookedDates,
      builder: (context, state) {
        int maxDogs = state.bookedDates.maxDogs!;
        return TableCalendar(
        focusedDay: focusedDay,
        firstDay: DateTime.now(),
        lastDay: DateTime.now().add(const Duration(days: 365)),
        onPageChanged: (focusedDay) {
          context.read<UserServicesCubit>().setYear(focusedDay.year);
          context.read<UserServicesCubit>().setMonth(focusedDay.month);
          setState(() {
            this.focusedDay = focusedDay;
          });
        },
        calendarBuilders: CalendarBuilders(
          defaultBuilder: (context, day, focusedDay) {
            for(DateCount d in state.bookedDates.dates ?? []) {
              if(day.day == d.date.day && day.month == d.date.month && day.year == d.date.year) {
                double percentage = (d.count) / maxDogs;
                return Container(
                  decoration: BoxDecoration(
                    // color depending on the percentage of dogs booked
                    color: percentage < 0.5 ?
                      Colors.green.withOpacity(0.45)
                      : percentage < 0.8 ?
                        Colors.orange.withOpacity(0.45) :
                        Colors.red.withOpacity(0.45),
                    shape: BoxShape.circle,
                  ),
                  child: Center(child: Text(day.day.toString())),
                );
              }
            }
            return Container(
                  decoration: BoxDecoration(
                    // color depending on the percentage of dogs booked
                    color: Colors.green.withOpacity(0.45),
                    shape: BoxShape.circle,
                  ),
                  child: Center(child: Text(day.day.toString())),
                );
          }
        )
      );
      },
    );
  }
}