import 'choice.dart';
import 'usage.dart';

class GptModel {
  String? warning;
  String? id;
  String? object;
  int? created;
  String? model;
  List<Choice>? choices;
  Usage? usage;

  GptModel({
    this.warning,
    this.id,
    this.object,
    this.created,
    this.model,
    this.choices,
    this.usage,
  });

  factory GptModel.fromJson(Map<String, dynamic> json) => GptModel(
        warning: json['warning'] as String?,
        id: json['id'] as String?,
        object: json['object'] as String?,
        created: json['created'] as int?,
        model: json['model'] as String?,
        choices: (json['choices'] as List<dynamic>?)
            ?.map((e) => Choice.fromJson(e as Map<String, dynamic>))
            .toList(),
        usage: json['usage'] == null
            ? null
            : Usage.fromJson(json['usage'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'warning': warning,
        'id': id,
        'object': object,
        'created': created,
        'model': model,
        'choices': choices?.map((e) => e.toJson()).toList(),
        'usage': usage?.toJson(),
      };
}
