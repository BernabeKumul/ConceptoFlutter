class UserModel {
  final String userId;
  final String correo;

  UserModel({
    this.userId,
    this.correo,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'],
      correo: json['nombre'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'correo': correo,
    };
  }
}
