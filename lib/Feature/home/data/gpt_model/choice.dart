class Choice {
  String? text;
  int? index;
  dynamic logprobs;
  String? finishReason;

  Choice({this.text, this.index, this.logprobs, this.finishReason});

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
        text: json['text'] as String?,
        index: json['index'] as int?,
        logprobs: json['logprobs'] as dynamic,
        finishReason: json['finish_reason'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'text': text,
        'index': index,
        'logprobs': logprobs,
        'finish_reason': finishReason,
      };
}
