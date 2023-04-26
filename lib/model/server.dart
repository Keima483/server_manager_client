import 'dart:convert';

Server serverFromJson(String str) => Server.fromJson(json.decode(str));

String serverToJson(Server data) => json.encode(data.toJson());

class Server {
  String name;
  String id;
  String language;
  String framework;

  Server({
    required this.name,
    required this.id,
    required this.language,
    required this.framework,
  });

  factory Server.fromJson(Map<String, dynamic> json) {
    return Server(
      name: json["name"],
      id: json["id"],
      language: json["language"],
      framework: json["framework"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "id": id,
      "language": language,
      "framework": framework,
    };
  }
}
