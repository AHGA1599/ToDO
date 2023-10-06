import 'package:atodo/model/task.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseUtils {

  static CollectionReference<Task> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection(Task.collectionName)
        .withConverter<Task>(
            fromFirestore: ((snapshot, options) =>
                Task.formFirebStor(snapshot.data()!)),
            toFirestore: (task, options) => task.toFrieStore());
  }

  static Future<void> addTaskToFirebase(Task task) {
    var taskcollection = getTasksCollection(); //collections
    DocumentReference<Task> taskDocRef = taskcollection.doc(); // document
    task.id=taskDocRef.id;
    return taskDocRef.set(task);
  }

  static Future<void> deleteTaskFormFirebase(Task task){
    return getTasksCollection().doc(task.id).delete();
  }

  static Future<void> updateTaskFromFireStore(String id, Task task)async{
    await FirebaseUtils.getTasksCollection().doc(task.id).update({
      'title':task.title,
      'description':task.description,
      'dateTime':task.dateTime?.microsecondsSinceEpoch,

    });
  }

   static Future<void> DoneInFierBase (String id)async{
     await FirebaseUtils.getTasksCollection().doc(id).update({'isDone':true});
  }
}
