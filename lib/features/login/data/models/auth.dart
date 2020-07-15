class AuthModel {
  final String token;
  final String expiration;

  AuthModel({
    this.token,
    this.expiration,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      token: json['token'],
      expiration: json['expiration']
    );
  }
}
