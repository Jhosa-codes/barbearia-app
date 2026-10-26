import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/user_model.dart';
import '../models/service_model.dart';
import '../models/professional_model.dart';
import '../models/booking_model.dart';

class SupabaseRepository {
  static final SupabaseRepository _instance = SupabaseRepository._internal();
  factory SupabaseRepository() => _instance;

  SupabaseRepository._internal();

  // --- Users ---
  Future<UserModel?> getCurrentUser() async {
    final user = Supabase.instance.client.auth.currentUser;
    if (user == null) return null;

    final data = await Supabase.instance.client
        .from('users')
        .select()
        .eq('id', user.id)
        .single();

    return UserModel.fromJson(data);
  }

  Future<UserModel> createUser({
    required String id,
    required String email,
    required String fullName,
    required String phone,
  }) async {
    final data = await Supabase.instance.client
        .from('users')
        .insert({
          'id': id,
          'email': email,
          'full_name': fullName,
          'phone': phone,
          'is_vip': false,
          'created_at': DateTime.now().toIso8601String(),
        })
        .select()
        .single();

    return UserModel.fromJson(data);
  }

  Future<void> updateVipStatus(String userId, bool isVip, String? vipToken) async {
    await Supabase.instance.client
        .from('users')
        .update({
          'is_vip': isVip,
          'vip_token': vipToken,
        })
        .eq('id', userId);
  }

  // --- Services ---
  Future<List<ServiceModel>> getServices() async {
    final data = await Supabase.instance.client
        .from('services')
        .select()
        .eq('is_active', true)
        .order('name');

    return (data as List).map((e) => ServiceModel.fromJson(e)).toList();
  }

  // --- Professionals ---
  Future<List<ProfessionalModel>> getProfessionals() async {
    final data = await Supabase.instance.client
        .from('professionals')
        .select()
        .eq('is_active', true)
        .order('name');

    return (data as List).map((e) => ProfessionalModel.fromJson(e)).toList();
  }

  // --- Bookings ---
  Future<List<BookingModel>> getBookings(String userId) async {
    final data = await Supabase.instance.client
        .from('bookings')
        .select()
        .eq('user_id', userId)
        .order('date_time', ascending: false);

    return (data as List).map((e) => BookingModel.fromJson(e)).toList();
  }

  Future<BookingModel> createBooking(BookingModel booking) async {
    final data = await Supabase.instance.client
        .from('bookings')
        .insert(booking.toJson())
        .select()
        .single();

    return BookingModel.fromJson(data);
  }

  Future<void> cancelBooking(String bookingId) async {
    await Supabase.instance.client
        .from('bookings')
        .update({'status': 'cancelled'})
        .eq('id', bookingId);
  }
}