class BookingModel {
  final String id;
  final String userId;
  final String professionalId;
  final String serviceId;
  final DateTime dateTime;
  final String status; // pending, confirmed, completed, cancelled
  final String paymentMethod; // qr_code, store
  final double totalPrice;

  BookingModel({
    required this.id,
    required this.userId,
    required this.professionalId,
    required this.serviceId,
    required this.dateTime,
    this.status = 'pending',
    this.paymentMethod = 'store',
    required this.totalPrice,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      professionalId: json['professional_id'] as String,
      serviceId: json['service_id'] as String,
      dateTime: DateTime.parse(json['date_time'] as String),
      status: json['status'] as String? ?? 'pending',
      paymentMethod: json['payment_method'] as String? ?? 'store',
      totalPrice: (json['total_price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'professional_id': professionalId,
      'service_id': serviceId,
      'date_time': dateTime.toIso8601String(),
      'status': status,
      'payment_method': paymentMethod,
      'total_price': totalPrice,
    };
  }
}