import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  bool _isLogin = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 1));
    if (mounted) {
      setState(() => _isLoading = false);
      Navigator.pushReplacementNamed(context, AppConstants.homeRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6EF),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.cut, size: 80, color: Color(0xFF8B4A1A)),
                const SizedBox(height: 16),
                Text(
                  AppConstants.appName,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C1E14),
                  ),
                ),
                const SizedBox(height: 40),
                if (!_isLogin) ...[
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Nome completo',
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    prefixIcon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _submit,
                    child: _isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Text(_isLogin ? 'Entrar' : 'Criar conta'),
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: _isLoading ? null : () => setState(() => _isLogin = !_isLogin),
                  child: Text(
                    _isLogin
                        ? 'Não tem conta? Cadastre-se'
                        : 'Já tem conta? Faça login',
                    style: const TextStyle(color: Color(0xFF8B4A1A)),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Ao continuar, você concorda com nossos Termos de Uso e LGPD',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Color(0xFFD4A373)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}