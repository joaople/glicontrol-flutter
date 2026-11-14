import 'package:flutter/material.dart';
import '../models/demo_data.dart';
import '../theme.dart';
import '../widgets/shared.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.onRegister});
  final VoidCallback onRegister;
  @override
  Widget build(BuildContext context) {
    final last = demoReadings.first;
    return PageBody(children: [
      Panel(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Última medição · ${last.context} · ${last.time}', style: const TextStyle(color: AppColors.muted)),
        const SizedBox(height: 8),
        Wrap(spacing: 16, runSpacing: 8, crossAxisAlignment: WrapCrossAlignment.center, children: [
          Text.rich(TextSpan(text: '${last.value}', style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold), children: const [
            TextSpan(text: ' mg/dL', style: TextStyle(fontSize: 18, color: AppColors.muted))])),
          StatusBadge(reading: last),
        ]),
      ])),
      FilledButton.icon(style: FilledButton.styleFrom(backgroundColor: AppColors.accent,
        foregroundColor: AppColors.surface), onPressed: onRegister,
        icon: const Icon(Icons.add), label: const Text('Registrar glicemia')),
      LayoutBuilder(builder: (context, constraints) {
        final stack = constraints.maxWidth < 320 || MediaQuery.textScalerOf(context).scale(1) > 1.3;
        const metrics = [_Metric('Média 7d', '113'), _Metric('Mín.', '68'), _Metric('Máx.', '165')];
        return stack ? const Column(children: [
          _Metric('Média 7d', '113'), SizedBox(height: 10),
          _Metric('Mín.', '68'), SizedBox(height: 10), _Metric('Máx.', '165'),
        ]) : Row(children: [
          Expanded(child: metrics[0]), const SizedBox(width: 10),
          Expanded(child: metrics[1]), const SizedBox(width: 10), Expanded(child: metrics[2]),
        ]);
      }),
      const Panel(child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Icon(Icons.warning_amber_rounded, color: AppColors.warning), SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Valor fora da faixa ontem', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text('165 mg/dL após o almoço. Este aviso é informativo e não substitui orientação médica.'),
        ])),
      ])),
      const Panel(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Dica do dia', style: TextStyle(fontWeight: FontWeight.bold)), SizedBox(height: 6),
        Text('Prefira carboidratos integrais e combine-os com proteínas e fibras.'),
      ])),
    ]);
  }
}
class _Metric extends StatelessWidget {
  const _Metric(this.label, this.value);
  final String label, value;
  @override
  Widget build(BuildContext context) => Panel(padding: 10, child: Column(children: [
    Text(label, textAlign: TextAlign.center, style: const TextStyle(color: AppColors.muted, fontSize: 12)),
    Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
  ]));
}
