import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../services/services_screen.dart';
import '../bookings/bookings_screen.dart';
import '../feed/feed_screen.dart';
import '../profile/profile_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    _HomeContent(),
    ServicesScreen(),
    BookingsScreen(),
    FeedScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appName),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Como usar o app'),
                  content: const Text(
                    '1. Escolha um serviço na aba Serviços\n'
                    '2. Selecione um profissional e horário\n'
                    '3. Confirme sua reserva\n'
                    '4. Pague na loja ou com QR code\n'
                    '5. Acesse seu perfil para editar dados',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Ok'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Serviços'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Reservas'),
          BottomNavigationBarItem(icon: Icon(Icons.feed), label: 'Feed'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}

class _HomeContent extends StatelessWidget {
  const _HomeContent();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              color: Color(0xFF8B4A1A),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(32), bottomRight: Radius.circular(32)),
            ),
            child: Column(
              children: [
                const Icon(Icons.cut, size: 64, color: Color(0xFFFDF6EF)),
                const SizedBox(height: 12),
                const Text(
                  'Barbearia João',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFFFDF6EF)),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Corte, barba e cuidado com estilo',
                  style: TextStyle(fontSize: 16, color: Color(0xFFD4A373)),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.star, color: Color(0xFFF9A825), size: 20),
                    const SizedBox(width: 4),
                    const Text('4.9', style: TextStyle(color: Color(0xFFFDF6EF), fontWeight: FontWeight.w600)),
                    const SizedBox(width: 16),
                    const Icon(Icons.location_on, color: Color(0xFFFDF6EF), size: 20),
                    const SizedBox(width: 4),
                    const Text('Centro - São Paulo', style: TextStyle(color: Color(0xFFFDF6EF))),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Serviços em destaque',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Color(0xFF2C1E14)),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _ServiceCard(name: 'Corte Masculino', price: 'R\$ 35,00', time: '30 min'),
                _ServiceCard(name: 'Barba Feita', price: 'R\$ 30,00', time: '25 min'),
                _ServiceCard(name: 'Corte + Barba', price: 'R\$ 60,00', time: '45 min'),
                _ServiceCard(name: 'Sobrancelha', price: 'R\$ 15,00', time: '15 min'),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Center(
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.calendar_today),
                label: const Text('Agendar horário'),
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final String name;
  final String price;
  final String time;
  const _ServiceCard({required this.name, required this.price, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFD4A373)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.cut, size: 48, color: Color(0xFF8B4A1A)),
          const SizedBox(height: 12),
          Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF2C1E14))),
          const SizedBox(height: 4),
          Text(price, style: const TextStyle(fontSize: 14, color: Color(0xFF8B4A1A), fontWeight: FontWeight.bold)),
          Text(time, style: const TextStyle(fontSize: 12, color: Color(0xFFD4A373))),
        ],
      ),
    );
  }
}