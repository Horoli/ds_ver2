class User {
  final String id;
  final String? name;
  final String? accessToken; // 선택
  final String? refreshToken; // 선택
  const User({
    required this.id,
    this.name,
    this.accessToken,
    this.refreshToken,
  });

  factory User.fromMap(Map<String, dynamic> map) => User(
        id: map['id'] as String,
        name: map['name'] as String? ?? '',
        accessToken: map['accessToken'] as String? ?? '',
        refreshToken: map['refreshToken'] as String? ?? '',
      );
}
