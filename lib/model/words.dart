import 'package:flutter/cupertino.dart';

@immutable
class Words {
  final List<String> listNames;
  const Words(this.listNames);

  Words copyWith({
    List<String>? listNames,
  }) {
    return Words(
      listNames ?? this.listNames,
    );
  }

  factory Words.fromJson(Map<String, dynamic> json) =>
      Words(List<String>.from(json['names'].map((x) => x)));

  Map<String, dynamic> toJson() => {
        "names": List<dynamic>.from(listNames.map((x) => x)),
      };
}
