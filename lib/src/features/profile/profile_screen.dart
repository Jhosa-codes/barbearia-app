import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _nameController = TextEditingController(text: 'João Silva');
  final _phoneController = TextEditingController(text: '(11) 99999-9999');
  final _emailController = TextEditingController(text: 'joao@email.com');
  bool _isVip = false;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meu Perfil')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CircleAvatar(radius: 40, backgroundColor: Color(0xFF8B4A1A)),
            const SizedBox(height: 16),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Nome completo'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'E-mail'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'Telefone'),
            ),
            const SizedBox(height: 24),
            ListTile(
              leading: const Icon(Icons.star, color: Color(0xFF6A1B9A)),
              title: const Text('Plano VIP - Serviços gratuitos'),
              subtitle: const Text('Ative com seu token de acesso'),
              trailing: Switch(
                value: _isVip,
                onChanged: (v) => setState(() => _isVip = v),
              ),
            ),
            if (_isVip) ...[
              const SizedBox(height: 12),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Token de acesso VIP',
                  border: OutlineInputBorder(),
                ),
                onChanged: (v) {},
              ),
              const SizedBox(height: 16),
            ],
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(onPressed: () {}, child: const Text('Salvar alterações')),
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF6A1B9A),
                side: const BorderSide(color: Color(0xFF6A1B9A)),
              ),
              child: const Text('Plano VIP - Ativar'),
            ),
            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 12),
            ListTile(
              leading: const Icon(Icons.delete, color: Color(0xFFB3261E)),
              title: const Text('Excluir conta', style: TextStyle(color: Color(0xFFB3261E))),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Excluir conta'),
                    content: const Text('Tem certeza que deseja excluir sua conta? Esta ação não pode ser desfeita.'),
                    actions: [
                      TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar')),
                      TextButton(onPressed: () => Navigator.pop(context), child: const Text('Excluir', style: TextStyle(color: Color(0xFFB3261E)))),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}