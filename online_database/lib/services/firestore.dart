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
  Stream<QuerySnapshot> getNoteStream() {
    final notesStream =
        notes.orderBy('timestamp', descending: true).snapshots();
    return notesStream;
  }

  //UPDATE: update a new note
  Future<void> updateNote(String docID, String newNote) {
    return notes
        .doc(docID)
        .update({'note': newNote, 'timestamp': Timestamp.now()});
  }

  //Detelte:
  Future<void> deleteNote(String docID) {
    return notes.doc(docID).delete();
  }
}
