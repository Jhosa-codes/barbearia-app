import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static final SupabaseService _instance = SupabaseService._internal();
  factory SupabaseService() => _instance;

  SupabaseClient? _client;

  SupabaseService._internal();

  Future<void> init() async {
    await dotenv.load(fileName: '.env');

    final supabaseUrl = dotenv.env['SUPABASE_URL'];
    final supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'] ?? '';

    if (supabaseUrl == null || supabaseAnonKey.isEmpty) {
      throw Exception(
        'SUPABASE_URL e SUPABASE_ANON_KEY não configurados no .env',
      );
    }

    await Supabase.initialize(
      url: supabaseUrl,
      publishableKey: supabaseAnonKey,
    );

    _client = Supabase.instance.client;
  }

  SupabaseClient get client {
    if (_client == null) {
      throw Exception('Supabase não inicializado. Chame SupabaseService().init() primeiro.');
    }
    return _client!;
  }

  RealtimeChannel channel(String channelName) => client.channel(channelName);
}