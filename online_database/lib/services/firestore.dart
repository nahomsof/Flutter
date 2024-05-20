import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //get collection of notes
  final CollectionReference notes =
      FirebaseFirestore.instance.collection("notes");

  //Create
  Future<void> addNotes(String note) {
    return notes.add({
      'note': note,
      'timestamp': Timestamp.now(),
    });
  }

  //Read

  //Update
}
