class UserData {
  final String email;
  final String password;

  UserData({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }
}
