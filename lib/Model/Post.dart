


// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

// import 'dart:convert';
//
// List<Post> postFromJson(String str) {
//   return List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));
// }
//
// String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class Post {
//   Post({
//     this.userId,
//     this.id,
//     this.title,
//     this.body,
//   });
//
//   int userId;
//   int id;
//   String title;
//   String body;
//
//   factory Post.fromJson(Map<String, dynamic> json) => Post(
//     userId: json["userId"],
//     id: json["id"],
//     title: json["title"],
//     body: json["body"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "userId": userId,
//     "id": id,
//     "title": title,
//     "body": body,
//   };
// }
class Post {
  int id;
  String title;
  String body;
  int userId;

  Post({this.id, this.title, this.body, this.userId});

  Post.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        body = json['body'],
        userId = json['userId'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'body': body,
    'userId': userId,
  };
}


// class Post {
//   String age;
//   int id;
//   String name;
//   String salary;
//
//
//   Post({this.id, this.name, this.age, this.salary});
//
//
//   Post.fromJson(Map<String, dynamic> json)
//       :
//         this.id=json['id'],
//         this.name=json['name'],
//         this.age=json['age'],
//         this.salary=json['salary'];
//
//
//   Map<String, dynamic> toJson() =>
//       {
//         'id': this.id,
//         'salary': this.salary,
//         'age': this.age,
//         'salary': this.salary,
//       };
//
//
// }