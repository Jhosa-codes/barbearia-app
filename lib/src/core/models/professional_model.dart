class ProfessionalModel {
  final String id;
  final String name;
  final String? specialty;
  final double rating;
  final String? photoUrl;
  final bool isActive;

  ProfessionalModel({
    required this.id,
    required this.name,
    this.specialty,
    this.rating = 0.0,
    this.photoUrl,
    this.isActive = true,
  });

  factory ProfessionalModel.fromJson(Map<String, dynamic> json) {
    return ProfessionalModel(
      id: json['id'] as String,
      name: json['name'] as String,
      specialty: json['specialty'] as String?,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      photoUrl: json['photo_url'] as String?,
      isActive: json['is_active'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'specialty': specialty,
      'rating': rating,
      'photo_url': photoUrl,
      'is_active': isActive,
    };
  }
}