class SignupResponseModel {
  String? token;
  String? error;
  SignupResponseModel({this.error, this.token});

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) {
    return SignupResponseModel(
      token: json['token'] ?? '',
      error: json['error'] ?? '',
    );
  }
}

class SignupRequestModel {
  String? name;
  String? email;
  String? password;
  String? phone;

  SignupRequestModel({this.email, this.name, this.password, this.phone});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email,
      'name': name,
      'password': password,
      'phone': phone,
    };
    return map;
  }
}
