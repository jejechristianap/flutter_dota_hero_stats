class Attribute {
  Attribute({this.title, this.value});

  String? title;
  String? value;

  factory Attribute.fromJson(Map<String, String> json) =>
      Attribute(title: json['title'], value: json['value']);

  Map<String, dynamic> toJson2() => {
        "title": title,
        "value": value,
      };
}
