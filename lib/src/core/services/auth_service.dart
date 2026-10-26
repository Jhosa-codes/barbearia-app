import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/user_model.dart';

DateTime _parseCreatedAt(Object? value) {
  if (value == null) return DateTime.now();
  if (value is DateTime) return value;
  if (value is String) {
    return DateTime.tryParse(value) ?? DateTime.now();
  }
  return DateTime.now();
}

class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;

  AuthService._internal();

  Stream<UserModel?> get authStateChanges {
    return Supabase.instance.client.auth.onAuthStateChange.map((event) {
      final user = event.session?.user;
      if (user == null) return null;

      return UserModel(
        id: user.id,
        email: user.email ?? '',
        fullName: user.userMetadata?['full_name'] ?? '',
        phone: user.userMetadata?['phone'] ?? '',
        photoUrl: user.userMetadata?['avatar_url'],
        createdAt: _parseCreatedAt(user.createdAt),
      );
    });
  }

  Future<UserModel?> signIn(String email, String password) async {
    final response = await Supabase.instance.client.auth.signInWithPassword(
      email: email,
      password: password,
    );
    final user = response.user;
    if (user == null) return null;

    return UserModel(
      id: user.id,
      email: user.email ?? '',
      fullName: user.userMetadata?['full_name'] ?? '',
      phone: user.userMetadata?['phone'] ?? '',
      photoUrl: user.userMetadata?['avatar_url'],
      createdAt: _parseCreatedAt(user.createdAt),
    );
  }

  Future<UserModel?> signUp(String email, String password, String fullName, String phone) async {
    final response = await Supabase.instance.client.auth.signUp(
      email: email,
      password: password,
      data: {
        'full_name': fullName,
        'phone': phone,
      },
    );
    final user = response.user;
    if (user == null) return null;

    return UserModel(
      id: user.id,
      email: user.email ?? '',
      fullName: fullName,
      phone: phone,
      createdAt: _parseCreatedAt(user.createdAt),
    );
  }

  Future<void> signOut() async {
    await Supabase.instance.client.auth.signOut();
  }

  UserModel? get currentUser {
    final user = Supabase.instance.client.auth.currentUser;
    if (user == null) return null;

    return UserModel(
      id: user.id,
      email: user.email ?? '',
      fullName: user.userMetadata?['full_name'] ?? '',
      phone: user.userMetadata?['phone'] ?? '',
      photoUrl: user.userMetadata?['avatar_url'],
      createdAt: _parseCreatedAt(user.createdAt),
    );
  }
}