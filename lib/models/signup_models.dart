class User {
  final String name;
  final String contact;
  final String password;

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        contact = json['contact'],
        password = json['password'];
}