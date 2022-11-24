import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

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
  @override
  Widget build(BuildContext context) {
    List<DateTime> toHighlight = <DateTime>[]; // = context.read
    return TableCalendar(
      focusedDay: DateTime.now(),
      firstDay: DateTime.now(),
      lastDay: DateTime.now().add(const Duration(days: 365)),
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, day, focusedDay) {
          for(DateTime d in toHighlight) {
            if(day.day == d.day && day.month == d.month && day.year == d.year) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.green, // TODO: change color
                  shape: BoxShape.circle,
                ),
                child: Text(day.day.toString()),
              );
            }
          }
          return null;
        }
      )
    );
  }
}