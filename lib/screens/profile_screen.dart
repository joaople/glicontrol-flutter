import 'package:flutter/material.dart';
import '../theme.dart';
import '../widgets/shared.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen> {
  final birth = TextEditingController(text: '12/05/1981');
  final weight = TextEditingController(text: '72');
  final height = TextEditingController(text: '166');
  final type = TextEditingController(text: 'Tipo 2');
  final min = TextEditingController(text: '70');
  final max = TextEditingController(text: '140');
  @override
  void dispose() {
    for (final c in [birth, weight, height, type, min, max]) { c.dispose(); }
    super.dispose();
  }
  Future<void> pickBirth() async {
    final date = await showDatePicker(context: context, initialDate: DateTime(1981, 5, 12),
      firstDate: DateTime(1900), lastDate: DateTime.now());
    if (date != null) birth.text = '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }
  @override
  Widget build(BuildContext context) => PageBody(children: [
    const Panel(child: Row(children: [
      CircleAvatar(radius: 30, backgroundColor: AppColors.primary,
        child: Text('M', style: TextStyle(color: AppColors.surface, fontSize: 26))),
      SizedBox(width: 16), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Maria Souza', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
        Text('maria@email.com', style: TextStyle(color: AppColors.muted)),
      ])),
    ])),
    Panel(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('Dados pessoais', style: TextStyle(fontWeight: FontWeight.bold)), const SizedBox(height: 16),
      LabeledField(label: 'Data de nascimento', controller: birth, readOnly: true, onTap: pickBirth),
      const SizedBox(height: 16), LabeledField(label: 'Peso (kg)', controller: weight, keyboard: const TextInputType.numberWithOptions(decimal: true)),
      const SizedBox(height: 16), LabeledField(label: 'Altura (cm)', controller: height, keyboard: TextInputType.number),
      const SizedBox(height: 16), LabeledField(label: 'Tipo de diabetes', controller: type),
    ])),
    Panel(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('Faixa de referência (mg/dL)', style: TextStyle(fontWeight: FontWeight.bold)), const SizedBox(height: 16),
      LabeledField(label: 'Mínimo', controller: min, keyboard: TextInputType.number), const SizedBox(height: 16),
      LabeledField(label: 'Máximo', controller: max, keyboard: TextInputType.number),
    ])),
    FilledButton(onPressed: () => demoNotice(context), child: const Text('Salvar alterações')),
    OutlinedButton(onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false),
      child: const Text('Sair', style: TextStyle(color: AppColors.danger))),
  ]);
}
