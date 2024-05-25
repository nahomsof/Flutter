import 'package:chat_app/componenet/my_textfiled.dart';
import 'package:chat_app/pages/chat_bubbles.dart';
import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/services/auth/chat/chat_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';

class ChatPage extends StatelessWidget {
  final String receiverID;
  final String receiverEmail;
  ChatPage({super.key, required this.receiverEmail, required this.receiverID});
//text controller
  final TextEditingController _messageController = TextEditingController();
  //chat & auth services

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  //send message
  void sendMessage() async {
    //if there is something inside the textfield
    if (_messageController.text.isNotEmpty) {
      //send the message
      await _chatService.sendMessage(receiverID, _messageController.text);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: Text(receiverEmail),
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.grey,
        ),
        body: Column(
          children: [
            Expanded(child: _buildMessageList()),
            //user input
            _buildUserInput()
          ],
        ));
  }

  //build messages list

  Widget _buildMessageList() {
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
        stream: _chatService.getMessages(receiverID, senderID),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Error");
          }
          //loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading..");
          }

          //return list view
          return ListView(
            children: snapshot.data!.docs
                .map((doc) => _buildMessageItem(doc))
                .toList(),
          );
        });
  }

//build message item
  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    bool isCurrentUser = data['senderID'] == _authService.getCurrentUser()!.uid;
    //align message to the right if sender is teh current user, otherwise left
    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;
    return Container(
        alignment: alignment,
        child: Column(
          crossAxisAlignment:
              isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            ChatBubble(message: data["message"], isCurrentUser: isCurrentUser)
          ],
        ));
  }

  //build message input
  Widget _buildUserInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50.0),
      child: Row(
        children: [
          Expanded(
            child: MyTextField(
              controller: _messageController,
              hintText: "Type a Message",
              obscureText: false,
            ),
          ),
          Container(
              decoration:
                  BoxDecoration(color: Colors.green, shape: BoxShape.circle),
              margin: EdgeInsets.only(right: 25.0),
              child: IconButton(
                  onPressed: sendMessage,
                  icon: Icon(
                    Icons.arrow_upward,
                    color: Colors.white,
                  )))
        ],
      ),
    );
  }
}
