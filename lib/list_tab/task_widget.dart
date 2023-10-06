import 'package:atodo/firebase_utils.dart';
import 'package:atodo/model/task.dart';
import 'package:atodo/provider/provider_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../my_theme.dart';
import 'edit_list.dart';

class TasksWidget extends StatelessWidget {
  Task task;
  TasksWidget({required this.task});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(12),
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: 0.25,
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(15),
              onPressed: (context) {
                FirebaseUtils.deleteTaskFormFirebase(task).timeout(
                  Duration(milliseconds: 500),onTimeout: (){
                    print('delete done');
                    provider.getAllTaskesFormFireStore();
                }
                );

              },
              backgroundColor: MyTheme.redcolor,
              foregroundColor: MyTheme.whitecolor,
              icon: Icons.delete,
              label: AppLocalizations.of(context)!.delete,
            ),
          ],
        ),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(EditList.routeName);
          },
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: MyTheme.whitecolor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Theme.of(context).primaryColor,
                  height: 80,
                  width: 4,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          task.title ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: MyTheme.primarylight),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          task.description ?? "",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 21),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Theme.of(context).primaryColor),
                    child: Icon(
                      Icons.check,
                      size: 30,
                      color: MyTheme.whitecolor,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
