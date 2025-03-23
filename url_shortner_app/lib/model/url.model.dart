class LoginResponse {
  final String msg;
  final UserData data;
  final String loginToken;

  LoginResponse({
    required this.msg,
    required this.data,
    required this.loginToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      msg: json['msg'],
      data: UserData.fromJson(json['data']),
      loginToken: json['LoginToken'],
    );
  }
}

class UserData {
  final String id;
  final String name;
  final String email;
  final String password;
  final int v;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.v,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      v: json['__v'],
    );
  }
}
