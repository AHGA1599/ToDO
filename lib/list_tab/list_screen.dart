import 'package:atodo/firebase_utils.dart';
import 'package:atodo/list_tab/task_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';

import 'package:provider/provider.dart';

import '../model/task.dart';
import '../my_theme.dart';
import '../provider/provider_screen.dart';

class ListScreen extends StatefulWidget {
  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    if (provider.taskList.isEmpty) {
      provider.getAllTaskesFormFireStore();
    }

    return Column(
      children: [
        CalendarTimeline(
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(Duration(days: 365)),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (date) => print(date),
          leftMargin: 20,
          monthColor: MyTheme.blackcolor,
          dayColor: MyTheme.blackcolor,
          activeDayColor: MyTheme.whitecolor,
          activeBackgroundDayColor: Theme.of(context).primaryColor,
          dotsColor: MyTheme.whitecolor,
          selectableDayPredicate: (date) => true,
          locale: provider.applanguage,
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: ((context, index) {
              return TasksWidget(
                task: provider.taskList[index],
              );
            }),
            itemCount: provider.taskList.length,
          ),
        ),
      ],
    );
  }
}
