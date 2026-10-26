import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Feed')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.feed, size: 64, color: Color(0xFFD4A373)),
            SizedBox(height: 16),
            Text('Feed de posts', style: TextStyle(fontSize: 18, color: Color(0xFF2C1E14))),
            SizedBox(height: 8),
            Text('Em breve - funcionalidade social', style: TextStyle(fontSize: 14, color: Color(0xFFD4A373))),
          ],
        ),
      ),
    );
  }
}