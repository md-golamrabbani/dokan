import 'dart:convert';

class Register {
  String userName;
  String email;
  String password;

  Register({
    required this.userName,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userName': userName,
      'email': email,
      'password': password,
    };
  }

  factory Register.fromMap(Map<String, dynamic> map) {
    return Register(
      userName: map['userName'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Register.fromJson(String source) =>
      Register.fromMap(json.decode(source) as Map<String, dynamic>);
}
