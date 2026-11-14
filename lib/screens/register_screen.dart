import 'package:flutter/material.dart';
import '../widgets/shared.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}
class _RegisterScreenState extends State<RegisterScreen> {
  final form = GlobalKey<FormState>();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  String selected = 'Jejum';
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  @override
  void initState() { super.initState(); updateDate(); }
  void updateDate() {
    dateController.text = '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
    timeController.text = '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }
  @override
  void dispose() { dateController.dispose(); timeController.dispose(); super.dispose(); }
  Future<void> pickDate() async {
    final picked = await showDatePicker(context: context, initialDate: date,
      firstDate: DateTime(1900), lastDate: DateTime.now());
    if (picked != null) { date = picked; updateDate(); }
  }
  Future<void> pickTime() async {
    final picked = await showTimePicker(context: context, initialTime: time);
    if (picked != null) { time = picked; updateDate(); }
  }
  @override
  Widget build(BuildContext context) => Form(key: form, child: PageBody(children: [
    Panel(child: Column(children: [
      const Text('Valor da glicemia'), const SizedBox(height: 8),
      TextFormField(keyboardType: TextInputType.number, textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
        decoration: const InputDecoration(hintText: '000', suffixText: 'mg/dL'),
        validator: (v) => int.tryParse(v ?? '') == null ? 'Informe um número inteiro.' : null),
    ])),
    Panel(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('Contexto da medição'), const SizedBox(height: 12),
      Wrap(spacing: 8, runSpacing: 8, children: ['Jejum', 'Pré-refeição', 'Pós-refeição', 'Antes de dormir', 'Outro']
        .map((c) => ChoiceChip(label: Text(c), selected: selected == c,
          onSelected: (_) => setState(() => selected = c))).toList()),
    ])),
    LabeledField(label: 'Data', controller: dateController, readOnly: true, onTap: pickDate),
    LabeledField(label: 'Horário', controller: timeController, readOnly: true, onTap: pickTime),
    const LabeledField(label: 'Observação (opcional)', hint: 'Ex.: após caminhada'),
    const Text('A precisão dos registros depende dos dados que você informa.'),
    FilledButton(onPressed: () {
      if (form.currentState?.validate() ?? false) demoNotice(context);
    }, child: const Text('Salvar medição')),
  ]));
}
