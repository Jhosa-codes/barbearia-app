class ServiceModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final int durationMinutes;
  final String? imageUrl;
  final bool isActive;

  ServiceModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.durationMinutes,
    this.imageUrl,
    this.isActive = true,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      durationMinutes: json['duration_minutes'] as int,
      imageUrl: json['image_url'] as String?,
      isActive: json['is_active'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'duration_minutes': durationMinutes,
      'image_url': imageUrl,
      'is_active': isActive,
    };
  }
}