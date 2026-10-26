class UserModel {
  final String id;
  final String email;
  final String fullName;
  final String phone;
  final String? photoUrl;
  final bool isVip;
  final String? vipToken;
  final DateTime createdAt;

  UserModel({
    required this.id,
    required this.email,
    required this.fullName,
    required this.phone,
    this.photoUrl,
    this.isVip = false,
    this.vipToken,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      email: json['email'] as String,
      fullName: json['full_name'] as String,
      phone: json['phone'] as String,
      photoUrl: json['photo_url'] as String?,
      isVip: json['is_vip'] as bool? ?? false,
      vipToken: json['vip_token'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'full_name': fullName,
      'phone': phone,
      'photo_url': photoUrl,
      'is_vip': isVip,
      'vip_token': vipToken,
      'created_at': createdAt.toIso8601String(),
    };
  }

  UserModel copyWith({
    String? id,
    String? email,
    String? fullName,
    String? phone,
    String? photoUrl,
    bool? isVip,
    String? vipToken,
    DateTime? createdAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
      photoUrl: photoUrl ?? this.photoUrl,
      isVip: isVip ?? this.isVip,
      vipToken: vipToken ?? this.vipToken,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}