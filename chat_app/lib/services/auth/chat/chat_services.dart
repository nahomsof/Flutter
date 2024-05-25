import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
//get instance of firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

/*
List<Map<String,dynamic> = 
[
  {
    'email': test@gmail.com,
    'id': ...
  }
  {
    'email':nahomsileshi21@gmail,
    'id': ...
  }
]
*/
//get user stream
  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        //go through each indiviual user
        final user = doc.data();
        return user;
      }).toList();
    });
  }
//send message

//get messages
}
