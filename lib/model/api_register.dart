class RegisterModel {
  final bool status;
  final String message;
  final UserData? data;

  RegisterModel({
    required this.status,
    required this.message,
    this.data,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      status: json['status'] ?? false,
      message: json['message'] ?? "",
      data: json['data'] != null ? UserData.fromJson(json['data']) : null,
    );
  }
}

class UserData {
  final String name;
  final String email;
  final String phone;
  final int id;
  final String image;
  final String token;

  UserData({
    required this.name,
    required this.email,
    required this.phone,
    required this.id,
    required this.image,
    required this.token,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      name: json['name'] ?? "",
      email: json['email'] ?? "",
      phone: json['phone'] ?? "",
      id: json['id'] ?? 0,
      image: json['image'] ?? "",
      token: json['token'] ?? "",
    );
  }
}
