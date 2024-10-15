import 'dart:convert';
import 'dart:typed_data';

import 'package:intl/intl.dart';

String uint8ListToBase64(Uint8List data) {
  return base64Encode(data);
}

Uint8List base64ToUint8List(String base64String) {
  return base64Decode(base64String);
}

class RecreationEntity {
  DateTime createTime;
  String title;
  String content;
  Uint8List image;

  RecreationEntity({
    required this.createTime,
    required this.title,
    required this.content,
    required this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      'createTime': createTime.toIso8601String(),
      'title': title,
      'content': content,
      'image': uint8ListToBase64(image),
    };
  }

  factory RecreationEntity.fromJson(Map<String, dynamic> json) {
    return RecreationEntity(
      createTime: DateTime.parse(json['createTime']),
      title: json['title'],
      content: json['content'],
      image: base64ToUint8List(json['image']),
    );
  }

  bool get isToday {
    final now = DateTime.now();
    return now.year == createTime.year &&
        now.month == createTime.month &&
        now.day == createTime.day;
  }

  String get createTimeString {
    if (isToday) {
      return 'Today';
    }
    return DateFormat('yyyy-MM-dd').format(createTime);
  }
}

class TopicEntity {
  int id;
  DateTime createTime;
  String title;
  List<RecreationEntity> list;

  TopicEntity({
    required this.id,
    required this.createTime,
    required this.title,
    required this.list,
  });

  factory TopicEntity.fromJson(Map<String, dynamic> json) {
    return TopicEntity(
      id: json['id'],
      createTime: DateTime.parse(json['createTime']),
      title: json['title'],
      list: (jsonDecode(json['list']) as List)
          .map((e) => RecreationEntity.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createTime': createTime.toIso8601String(),
      'title': title,
      'list': jsonEncode(list.map((e) => e.toJson()).toList()),
    };
  }
}
