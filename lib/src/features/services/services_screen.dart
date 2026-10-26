import 'package:flutter/material.dart';
class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      {'name': 'Corte Masculino', 'price': 'R\$ 35,00', 'time': '30 min', 'icon': Icons.cut},
      {'name': 'Barba Feita', 'price': 'R\$ 30,00', 'time': '25 min', 'icon': Icons.cut},
      {'name': 'Corte + Barba', 'price': 'R\$ 60,00', 'time': '45 min', 'icon': Icons.cut},
      {'name': 'Sobrancelha', 'price': 'R\$ 15,00', 'time': '15 min', 'icon': Icons.face},
      {'name': 'Barba Completa', 'price': 'R\$ 45,00', 'time': '40 min', 'icon': Icons.cut},
      {'name': 'Pigmentação', 'price': 'R\$ 80,00', 'time': '60 min', 'icon': Icons.color_lens},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Serviços')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.85,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: services.length,
          itemBuilder: (context, index) {
            final s = services[index];
            return Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(s['icon'] as IconData, size: 48, color: const Color(0xFF8B4A1A)),
                  const SizedBox(height: 12),
                  Text(s['name'] as String, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 4),
                  Text(s['price'] as String, style: const TextStyle(fontSize: 14, color: Color(0xFF8B4A1A), fontWeight: FontWeight.bold)),
                  Text(s['time'] as String, style: const TextStyle(fontSize: 12, color: Color(0xFFD4A373))),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}