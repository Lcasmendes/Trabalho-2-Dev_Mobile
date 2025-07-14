class ResponseData {
  final String id;
  final String username;
  final String email;
  final String password;

  ResponseData({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) {
    return ResponseData(
      id: json['id'].toString(),
      username: json['username'],
      email: json['email'],
      password: json['password'],
    );
  }
}
