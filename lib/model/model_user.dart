class ModelUsers {
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  ModelUsers.fromJson(Map<String, dynamic> json)
      :id = json["id"],
        email = json["email"],
        firstName = json["first_name"],
        lastName = json["last_name"],
        avatar = json["avatar"];


    
}
 
class Support {
  String url;
  String text;

  Support.fromJson(Map<String, dynamic> json)
      : url = json["url"],
        text = json["text"];

  Map<String, dynamic> toJson() => {
        "url": url,
        "text": text,
      };
}
