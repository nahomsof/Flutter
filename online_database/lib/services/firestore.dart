import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  //Get collection of note
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('notes');

  //Create: add a new note
  Future<void> addNOte(String note) {
    return notes.add({'note': note, 'timestamp': Timestamp.now()});
  }
  //REad: a new note

  //UPDATE: update a new note

  //Detelte:
}
