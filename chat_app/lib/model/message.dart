import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart';

enum MessageTyep { Text, Image }

class Message {
  String? senderID;
  String? content;
  MessageTyep? messageType;
  Timestamp? sentAt;

  Message({
    required this.content,
    required this.messageType,
    required this.senderID,
    required this.sentAt,
  });
  Message.fromJson(Map<String, dynamic> json) {}
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['senderId'] = senderID;
    data['content'] = content;
    data['sentAt'] = sentAt;
    data['messageType'] = messageType!.name;
    return data;
  }
}
