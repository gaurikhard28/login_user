class UserLogin {
  final String contact;
  final String password;

  UserLogin.fromJson(Map<String, dynamic> json)
      : contact = json['contact'],
        password = json['password'];
}