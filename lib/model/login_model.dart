class LoginResponseModel {
  String? token;
  String? error;
  LoginResponseModel({this.error, this.token});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json['token'] ?? '',
      error: json['error'] ?? '',
    );
  }
}

class LoginRequestModel {
  String? email;
  String? password;

  LoginRequestModel({this.email, this.password});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email,
      'password': password,
    };
    return map;
  }
}
