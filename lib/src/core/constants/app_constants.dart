import 'package:flutter/material.dart';

class AppConstants {
  static const String appName = 'Barbearia';
  static const String appVersion = '1.0.0';
  static const int maxUsers = 500;

  // Rotas
  static const String loginRoute = '/login';
  static const String homeRoute = '/home';
  static const String servicesRoute = '/services';
  static const String professionalsRoute = '/professionals';
  static const String bookingsRoute = '/bookings';
  static const String feedRoute = '/feed';
  static const String chatRoute = '/chat';
  static const String profileRoute = '/profile';

  // Abas de navegação
  static const int tabHome = 0;
  static const int tabServices = 1;
  static const int tabBookings = 2;
  static const int tabFeed = 3;
  static const int tabProfile = 4;
}

// Cores da identidade visual (personalizada, diferente dos concorrentes)
class AppColors {
  static const Color primary = Color(0xFF8B4A1A);      // Marrom quente - madeira de barbearia
  static const Color primaryDark = Color(0xFF5E330E);
  static const Color secondary = Color(0xFFD4A373);    // Amarelo suave - lâmina de navalha
  static const Color accent = Color(0xFF2C1E14);       // Preto quente
  static const Color background = Color(0xFFFDF6EF);   // Off-white quente
  static const Color surface = Color(0xFFFFFFFF);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onBackground = Color(0xFF2C1E14);
  static const Color error = Color(0xFFB3261E);
  static const Color success = Color(0xFF2E7D32);
  static const Color warning = Color(0xFFF9A825);
  static const Color vip = Color(0xFF6A1B9A);          // Roxo para plano VIP
}