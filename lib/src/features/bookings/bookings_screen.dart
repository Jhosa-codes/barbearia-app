import 'package:flutter/material.dart';
import '../../core/models/professional_model.dart';
import '../../core/models/service_model.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  ServiceModel? _selectedService;
  ProfessionalModel? _selectedProfessional;
  DateTime? _selectedDateTime;
  String _paymentMethod = 'store'; // 'qr_code' or 'store'

  final List<ServiceModel> _services = [
    ServiceModel(id: '1', name: 'Corte Masculino', description: '', price: 35.0, durationMinutes: 30),
    ServiceModel(id: '2', name: 'Barba Feita', description: '', price: 30.0, durationMinutes: 25),
    ServiceModel(id: '3', name: 'Corte + Barba', description: '', price: 60.0, durationMinutes: 45),
  ];

  final List<ProfessionalModel> _professionals = [
    ProfessionalModel(id: '1', name: 'Carlos Silva', specialty: 'Barba e corte clássico', rating: 4.9),
    ProfessionalModel(id: '2', name: 'Roberto Mendes', specialty: 'Corte moderno e fade', rating: 4.8),
    ProfessionalModel(id: '3', name: 'André Souza', specialty: 'Barba completa e design', rating: 4.7),
  ];

  @override
  Widget build(BuildContext context) {
    final professional = ModalRoute.of(context)?.settings.arguments as ProfessionalModel?;
    if (professional != null && _selectedProfessional == null) {
      _selectedProfessional = professional;
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Agendar Reserva')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Serviço', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
            const SizedBox(height: 8),
            DropdownButtonFormField<ServiceModel>(
              value: _selectedService,
              items: _services.map((s) => DropdownMenuItem(
                value: s,
                child: Text('${s.name} - R\$ ${s.price.toStringAsFixed(2)}'),
              )).toList(),
              onChanged: (v) => setState(() => _selectedService = v),
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            const Text('Profissional', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
            const SizedBox(height: 8),
            DropdownButtonFormField<ProfessionalModel>(
              value: _selectedProfessional,
              items: _professionals.map((p) => DropdownMenuItem(
                value: p,
                child: Text(p.name),
              )).toList(),
              onChanged: (v) => setState(() => _selectedProfessional = v),
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            const Text('Data e horário', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
            const SizedBox(height: 8),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: Text(_selectedDateTime != null
                  ? '${_selectedDateTime!.day}/${_selectedDateTime!.month} ${_selectedDateTime!.hour}:${_selectedDateTime!.minute.toString().padLeft(2, '0')}'
                  : 'Selecionar data e horário'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 30)),
                );
                if (date != null) {
                  final time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (time != null) {
                    setState(() => _selectedDateTime = DateTime(
                      date.year, date.month, date.day, time.hour, time.minute,
                    ));
                  }
                }
              },
            ),
            const SizedBox(height: 16),
            const Text('Forma de pagamento', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
            const SizedBox(height: 8),
            ListTile(
              leading: const Icon(Icons.payment),
              title: const Text('Pagar na loja'),
              trailing: Radio<String>(
                value: 'store',
                groupValue: _paymentMethod,
                onChanged: (v) => setState(() => _paymentMethod = v!),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.qr_code),
              title: const Text('Pagar com QR Code'),
              trailing: Radio<String>(
                value: 'qr_code',
                groupValue: _paymentMethod,
                onChanged: (v) => setState(() => _paymentMethod = v!),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: (_selectedService != null && _selectedProfessional != null && _selectedDateTime != null)
                    ? () {
                        setState(() {});
                      }
                    : null,
                child: const Text('Confirmar reserva'),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}