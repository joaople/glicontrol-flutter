import 'package:flutter/material.dart';
import '../widgets/shared.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}
class _SignupScreenState extends State<SignupScreen> {
  final form = GlobalKey<FormState>();
  final birth = TextEditingController();
  bool consent = false;
  @override
  void dispose() { birth.dispose(); super.dispose(); }
  Future<void> pickBirth() async {
    final now = DateTime.now();
    final date = await showDatePicker(context: context,
      initialDate: DateTime(1981, 5, 12), firstDate: DateTime(1900), lastDate: now);
    if (date != null) birth.text = '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }
  @override
  Widget build(BuildContext context) => AuthPage(title: 'Criar sua conta', children: [
    Form(key: form, child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      const LabeledField(label: 'Nome completo', validator: requiredValue),
      const SizedBox(height: 16),
      const LabeledField(label: 'E-mail', keyboard: TextInputType.emailAddress, validator: requiredValue),
      const SizedBox(height: 16),
      LabeledField(label: 'Data de nascimento', controller: birth,
        readOnly: true, onTap: pickBirth, validator: requiredValue),
      const SizedBox(height: 16),
      const LabeledField(label: 'Peso (kg)', keyboard: TextInputType.numberWithOptions(decimal: true), validator: requiredValue),
      const SizedBox(height: 16),
      const LabeledField(label: 'Altura (cm)', keyboard: TextInputType.number, validator: requiredValue),
      const SizedBox(height: 16),
      const LabeledField(label: 'Senha', obscure: true, validator: requiredValue),
      CheckboxListTile(contentPadding: EdgeInsets.zero, value: consent,
        controlAffinity: ListTileControlAffinity.leading,
        title: const Text('Aceito o tratamento dos meus dados de saúde conforme a LGPD.'),
        onChanged: (v) => setState(() => consent = v ?? false)),
      FilledButton(onPressed: () {
        if (!(form.currentState?.validate() ?? false)) return;
        if (!consent) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Marque o consentimento para continuar.')));
          return;
        }
        Navigator.pushNamedAndRemoveUntil(context, '/inicio', (_) => false);
      }, child: const Text('Cadastrar')),
    ])),
    TextButton(onPressed: () => Navigator.pop(context), child: const Text('Já tem conta? Entrar')),
  ]);
}
