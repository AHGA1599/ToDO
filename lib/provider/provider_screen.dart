import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../firebase_utils.dart';
import '../model/task.dart';

class AppConfigProvider extends ChangeNotifier {
  List<Task> taskList = [];
  String applanguage = 'en';
  ThemeMode appTheme = ThemeMode.light;

  void changLanguage(String NewLanguage) async {
    if (NewLanguage == applanguage) {
      return;
    } else {
      applanguage = NewLanguage;
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('lang', NewLanguage);
      notifyListeners();
    }
  }

  void changTheme(ThemeMode newMode) async {
    if (appTheme == newMode) {
      return;
    } else {
      appTheme = newMode;
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('theme', newMode == ThemeMode.light ? 'light' : 'dark');
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
  Future<void> markAsDone(String id) async {
    await FirebaseUtils.DoneInFierBase(id);
  }


}
