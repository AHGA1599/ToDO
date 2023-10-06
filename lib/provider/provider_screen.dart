
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../firebase_utils.dart';
import '../model/task.dart';

class AppConfigProvider extends ChangeNotifier{
  List<Task> taskList = [];
  String applanguage = 'en';
  ThemeMode appTheme=ThemeMode.light;

  void changLanguage(String NewLanguage){
    if(NewLanguage== applanguage){
      return;
    }else{
      applanguage=NewLanguage;
      notifyListeners();
    }
  }
  void changTheme (ThemeMode newMode){
if(appTheme == newMode){
  return;
}else{
  appTheme=newMode;
  notifyListeners();
}
  }

  void getAllTaskesFormFireStore() async {
    QuerySnapshot<Task> querySnapshot =
    await FirebaseUtils.getTasksCollection().get();
    taskList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    notifyListeners();
  }
  Future<void> updateTask(String id, Task task) async {
    await FirebaseUtils.updateTaskFromFireStore(id, task);
  }
}