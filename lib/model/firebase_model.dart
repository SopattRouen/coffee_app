class DatabaseModel {
  String name;
  String email;
  String password;

  DatabaseModel(
      {required this.name, required this.email, required this.password});
  DatabaseModel.fromJson(Map<String, Object?> json)
      : this(
          name: json['name'] as String,
          email: json['email'] as String,
          password: json['password'] as String,
        );
  DatabaseModel copywith({
    String? name,
    String? email,
    String? password,
  }) {
    return DatabaseModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
