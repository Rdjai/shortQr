class LoginResponse {
  LoginResponse({
    required this.sessionId,
    required this.id,
    required this.name,
    required this.email,
  });

  final String? sessionId;
  final String? id;
  final String? name;
  final String? email;

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      sessionId: json["sessionId"],
      id: json["_id"],
      name: json["name"],
      email: json["email"],
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
