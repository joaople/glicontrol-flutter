import 'package:flutter/material.dart';
import '../widgets/shared.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  final form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) => AuthPage(title: 'Bem-vindo de volta', children: [
    Form(key: form, child: Column(children: [
      const LabeledField(label: 'E-mail', keyboard: TextInputType.emailAddress,
        hint: 'voce@email.com', validator: requiredValue,
        autofillHints: [AutofillHints.email]),
      const SizedBox(height: 16),
      const LabeledField(label: 'Senha', obscure: true, validator: requiredValue,
        autofillHints: [AutofillHints.password]),
      const SizedBox(height: 20),
      SizedBox(width: double.infinity, child: FilledButton(onPressed: () {
        if (form.currentState?.validate() ?? false) {
          Navigator.pushReplacementNamed(context, '/inicio');
        }
      }, child: const Text('Entrar'))),
    ])),
    TextButton(onPressed: () => Navigator.pushNamed(context, '/cadastro'),
      child: const Text('Não tem conta? Cadastre-se')),
    const Text('Ambiente demonstrativo · sem autenticação real', textAlign: TextAlign.center),
  ]);
}
