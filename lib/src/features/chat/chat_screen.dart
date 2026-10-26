import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.chat, size: 64, color: Color(0xFFD4A373)),
            SizedBox(height: 16),
            Text('Chat com a barbearia', style: TextStyle(fontSize: 18, color: Color(0xFF2C1E14))),
            SizedBox(height: 8),
            Text('Em breve - atendimento direto', style: TextStyle(fontSize: 14, color: Color(0xFFD4A373))),
          ],
        ),
      ),
    );
  }
}