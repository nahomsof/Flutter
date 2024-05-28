import 'package:chat_app/model/message.dart';

class Chat {
  String? id;
  List<String>? paricipants;
  List<Message>? messages;
  Chat({required this.id, required this.messages, required this.paricipants});

  Chat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    paricipants = List<String>.from(json['participants']);
    messages= List.from(json['messages']).map((m) => null)
  }
}
