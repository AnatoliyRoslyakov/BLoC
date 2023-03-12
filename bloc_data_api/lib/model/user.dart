class User {
  int id;
  String name;
  String? email;
  String? phone;
  User({
    required this.id,
    required this.name,
    this.email,
    this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] ?? ' ' as String,
      phone: json['phone'] ?? ' ' as String,
    );
  }
}
