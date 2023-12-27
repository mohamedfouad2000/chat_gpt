class MessageModel {
  String? text;
  String? dateTime;
  int id;

  MessageModel({
    required this.text,
    required this.id,
    required this.dateTime,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        text: json['text'],
        dateTime: json['dateTime'],
        id: json['id'],
      );

  Map<String, dynamic> toJson() => {
        'text': text,
        'dateTime': dateTime,
        'id': id,
      };
}
