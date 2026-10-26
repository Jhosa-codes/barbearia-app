import 'package:flutter/material.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Minhas Reservas')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.calendar_today, size: 64, color: Color(0xFFD4A373)),
            SizedBox(height: 16),
            Text('Nenhuma reserva marcada', style: TextStyle(fontSize: 18, color: Color(0xFF2C1E14))),
            SizedBox(height: 8),
            Text('Vá em Serviços para agendar', style: TextStyle(fontSize: 14, color: Color(0xFFD4A373))),
          ],
        ),
      ),
    );
  }
}