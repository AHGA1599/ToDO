import 'package:atodo/firebase_utils.dart';
import 'package:atodo/model/task.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../provider/provider_screen.dart';


class TaskeScreen extends StatefulWidget {
  @override
  State<TaskeScreen> createState() => _TaskeScreenState();
}

class _TaskeScreenState extends State<TaskeScreen> {
  DateTime selectTime = DateTime.now();
  String title = '';
  String description = '';
  var formkey = GlobalKey<FormState>();
  late AppConfigProvider provider;
  @override
  Widget build(BuildContext context) {
     provider = Provider.of(context);
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(AppLocalizations.of(context)!.title1,
                style: Theme.of(context).textTheme.titleMedium),
            Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onChanged:(text){
                        title = text ;
                      } ,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'please Enter your title';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!.title2
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onChanged: (text){
                        description=text;
                      },
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'please Enter your Description';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.des,
                      ),
                      maxLines: 4,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(AppLocalizations.of(context)!.select_date,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // show calender
                      showCalender();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${selectTime.day}/${selectTime.month}/${selectTime.year}',
                        style: Theme.of(context).textTheme.titleSmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //add task to firebase
                      addTask();
                    },
                    child: Text(AppLocalizations.of(context)!.add,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: MyTheme.whitecolor)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void showCalender() async {
    var choseDate = await showDatePicker(
      context: context,
      initialDate: selectTime,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 350)),
    );
    if (choseDate != null) {
      selectTime = choseDate;
      setState(() {});
    }
  }

  void addTask() {
    if (formkey.currentState?.validate() == true) {
//add task to firebase
    Task task = Task(
        title: title,
        description: description,
        dateTime: selectTime);
    FirebaseUtils.addTaskToFirebase(task).timeout(
      Duration(milliseconds:500 ),onTimeout:() {
        print('done');
        provider.getAllTaskesFormFireStore;
        Navigator.pop(context);
        setState(() {

        });
    }
    );
    }
  }
}
