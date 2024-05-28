import 'package:chat_app/componenet/user_tile.dart';
import 'package:chat_app/pages/chat_pages.dart';
import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/componenet/my_drawer.dart';
import 'package:chat_app/services/auth/chat/chat_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  //chat & auth service

  final ChatService _chatService = ChatService();
  final AuthService _authSercie = AuthService();
  void logout() {
    //get auth service
    final _auth = AuthService();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey,
        actions: [
          // logout button
          IconButton(onPressed: logout, icon: Icon(Icons.logout))
        ],
      ),
      drawer: MyDrawer(),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
        stream: _chatService.getUsersStream(),
        builder: (context, snapshot) {
          //error
          if (snapshot.hasError) {
            return const Text("Errors");
          }

          // loading..

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading..");
          }
          //return list view

          return ListView(
            children: snapshot.data!
                .map<Widget>(
                    (userData) => _buildUserListItem(userData, context))
                .toList(),
          );
        });
  }

  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    //display all users except current user
    if (userData['email'] != _authSercie.getCurrentUser()!.email) {
      return UserTile(
        text: userData["email"],
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatPage(
                  receiverID: userData["uid"],
                  receiverEmail: userData["email"],
                ),
              ));
        },
      );
    } else {
      return Container();
    }
  }
}
