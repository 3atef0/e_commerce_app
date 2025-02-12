class LoginModel {
  final bool status;
  final String message;
  final UserData? data;

  LoginModel({
    required this.status,
    required this.message,
    this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      status: json['status'] ?? false,
      message: json['message'] ?? "No message",
      data: json['data'] != null ? UserData.fromJson(json['data']) : null,
    );
  }
}

class UserData {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String image;
  final int points;
  final int credit;
  final String token;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.points,
    required this.credit,
    required this.token,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'] ?? 0, // Provide default value
      name: json['name'] ?? "Unknown",
      email: json['email'] ?? "Unknown",
      phone: json['phone'] ?? "Unknown",
      image: json['image'] ?? "", // Default empty string
      points: json['points'] ?? 0, // Default to 0 if null
      credit: json['credit'] ?? 0, // Default to 0 if null
      token: json['token'] ?? "", // Default empty string
    );
  }
}
