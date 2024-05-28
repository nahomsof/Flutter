import 'package:chat_app/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
//get instance of firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
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
  Future<void> sendMessage(String receiverID, message) async {
    //get current user info
    final String currenUserID = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();
    //create a new message

    Message newMessage = Message(
        senderId: currenUserID,
        senderEmail: currentUserEmail,
        receiverId: receiverID,
        message: message,
        timestamp: timestamp);

    //construct chat room ID for the two users (sorted to ensure uniquenss)
    List<String> ids = [currenUserID, receiverID];
    ids.sort(); // sort the ids (this ensure the chatroomId is the same for any 2 people)
    String chatRoomID = ids.join('_');

    //add new message to databse
    await _firestore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("messages")
        .add(newMessage.toMap());
  }
//get messages

  Stream<QuerySnapshot> getMessages(String userId, otherUserId) {
    //construct a chatroom ID for two users

    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomID = ids.join('_');
    return _firestore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
