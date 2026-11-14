import 'package:flutter/material.dart';
import '../theme.dart';
import '../models/demo_data.dart';

class Panel extends StatelessWidget {
  const Panel({super.key, required this.child, this.color, this.padding = 16});
  final Widget child;
  final Color? color;
  final double padding;
  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity, padding: EdgeInsets.all(padding),
    decoration: BoxDecoration(color: color ?? AppColors.surface,
      borderRadius: BorderRadius.circular(16), boxShadow: const [
        BoxShadow(color: Color(0x10203D42), blurRadius: 16, offset: Offset(0, 5)),
      ]), child: child,
  );
}

class MobileFrame extends StatelessWidget {
  const MobileFrame({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) => ColoredBox(
    color: AppColors.background,
    child: Center(child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 480), child: child)),
  );
}

class PageBody extends StatelessWidget {
  const PageBody({super.key, required this.children});
  final List<Widget> children;
  @override
  Widget build(BuildContext context) => ListView.separated(
    padding: const EdgeInsets.all(16), itemCount: children.length,
    separatorBuilder: (_, __) => const SizedBox(height: 16),
    itemBuilder: (_, i) => children[i],
  );
}

class LabeledField extends StatelessWidget {
  const LabeledField({super.key, required this.label, this.controller,
    this.keyboard, this.obscure = false, this.validator, this.hint,
    this.onTap, this.readOnly = false, this.autofillHints});
  final String label;
  final TextEditingController? controller;
  final TextInputType? keyboard;
  final bool obscure;
  final String? Function(String?)? validator;
  final String? hint;
  final VoidCallback? onTap;
  final bool readOnly;
  final Iterable<String>? autofillHints;
  @override
  Widget build(BuildContext context) => TextFormField(
    controller: controller, keyboardType: keyboard, obscureText: obscure,
    validator: validator, onTap: onTap, readOnly: readOnly,
    autofillHints: autofillHints,
    decoration: InputDecoration(labelText: label, hintText: hint),
  );
}

String? requiredValue(String? value) =>
  value == null || value.trim().isEmpty ? 'Preencha este campo.' : null;

class StatusBadge extends StatelessWidget {
  const StatusBadge({super.key, required this.reading});
  final Reading reading;
  @override
  Widget build(BuildContext context) {
    final color = reading.value < 70 ? AppColors.warning
      : reading.value > 140 ? AppColors.danger : AppColors.success;
    return Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(color: color.withAlpha(30),
        borderRadius: BorderRadius.circular(24)),
      child: Text(reading.status, style: TextStyle(color:
        reading.value < 70 ? AppColors.ink : color, fontWeight: FontWeight.w600)),
    );
  }
}

void demoNotice(BuildContext context) => ScaffoldMessenger.of(context).showSnackBar(
  const SnackBar(content: Text('Demonstração: os dados não são salvos.')),
);

class AuthPage extends StatelessWidget {
  const AuthPage({super.key, required this.title, required this.children});
  final String title;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) => MobileFrame(child: Scaffold(
    body: SingleChildScrollView(child: Column(children: [
      Container(width: double.infinity,
        decoration: const BoxDecoration(gradient: AppColors.hero),
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 36),
        child: SafeArea(bottom: false, child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 20),
          const Row(children: [Icon(Icons.water_drop_outlined, color: AppColors.surface, size: 32),
            SizedBox(width: 8), Text('Glicontrol', style: TextStyle(
              color: AppColors.surface, fontSize: 26, fontWeight: FontWeight.bold))]),
          const SizedBox(height: 24),
          Text(title, style: const TextStyle(color: AppColors.surface,
            fontSize: 30, fontWeight: FontWeight.w600)),
        ])),
      ),
      Padding(padding: const EdgeInsets.all(24), child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children.expand((w) => [w, const SizedBox(height: 16)]).toList())),
    ])),
  ));
}
