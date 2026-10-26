import 'package:flutter/material.dart';
import '../../core/models/professional_model.dart';

class ProfessionalsScreen extends StatefulWidget {
  const ProfessionalsScreen({super.key});

  @override
  State<ProfessionalsScreen> createState() => _ProfessionalsScreenState();
}

class _ProfessionalsScreenState extends State<ProfessionalsScreen> {
  final List<ProfessionalModel> _professionals = [
    ProfessionalModel(
      id: '1',
      name: 'Carlos Silva',
      specialty: 'Barba e corte clássico',
      rating: 4.9,
      photoUrl: 'https://i.pravatar.cc/150?img=11',
    ),
    ProfessionalModel(
      id: '2',
      name: 'Roberto Mendes',
      specialty: 'Corte moderno e fade',
      rating: 4.8,
      photoUrl: 'https://i.pravatar.cc/150?img=12',
    ),
    ProfessionalModel(
      id: '3',
      name: 'André Souza',
      specialty: 'Barba completa e design',
      rating: 4.7,
      photoUrl: 'https://i.pravatar.cc/150?img=13',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profissionais')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _professionals.length,
        itemBuilder: (context, index) {
          final p = _professionals[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(p.photoUrl!),
                radius: 30,
              ),
              title: Text(p.name, style: const TextStyle(fontWeight: FontWeight.w600)),
              subtitle: Text(p.specialty ?? ''),
              trailing: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.star, color: Color(0xFFF9A825), size: 20),
                  Text(p.rating.toStringAsFixed(1), style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              onTap: () {
                Navigator.pushNamed(context, '/bookings', arguments: p);
              },
            ),
          );
        },
      ),
    );
  }
}