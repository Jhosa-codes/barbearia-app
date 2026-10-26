import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'src/core/theme/app_theme.dart';
import 'src/core/services/supabase_service.dart';
import 'src/features/auth/login_screen.dart';
import 'src/features/home/home_screen.dart';
import 'src/features/services/services_screen.dart';
import 'src/features/bookings/bookings_screen.dart';
import 'src/features/profile/profile_screen.dart';
import 'src/features/feed/feed_screen.dart';
import 'src/features/chat/chat_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await dotenv.load(fileName: '.env');
    await SupabaseService().init();
  } catch (e) {
    debugPrint('Aviso: Supabase não inicializado: $e');
  }

  runApp(const BarbeariaApp());
}

class BarbeariaApp extends StatelessWidget {
  const BarbeariaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barbearia',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/services': (context) => const ServicesScreen(),
        '/bookings': (context) => const BookingsScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/feed': (context) => const FeedScreen(),
        '/chat': (context) => const ChatScreen(),
      },
    );
  }
}