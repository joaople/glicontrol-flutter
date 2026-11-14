import 'package:flutter/material.dart';
import '../theme.dart';
import '../widgets/shared.dart';

class DietScreen extends StatelessWidget {
  const DietScreen({super.key});
  @override
  Widget build(BuildContext context) => PageBody(children: [
    const Panel(color: AppColors.secondary, child: Text('Orientações gerais e educativas. Não substituem o plano de um nutricionista.')),
    Text('Sugestões para hoje', style: Theme.of(context).textTheme.titleLarge),
    ...[
      (Icons.coffee_outlined, 'Café da manhã', 'Pão integral, ovo mexido e fruta com casca.'),
      (Icons.wb_sunny_outlined, 'Almoço', 'Metade do prato com verduras, 1/4 proteína, 1/4 arroz integral.'),
      (Icons.apple_outlined, 'Lanche', 'Iogurte natural com aveia ou castanhas.'),
      (Icons.nightlight_outlined, 'Jantar', 'Sopa de legumes com frango ou peixe grelhado.'),
    ].map((m) => Panel(child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Icon(m.$1, color: AppColors.primary, size: 28), const SizedBox(width: 12),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(m.$2, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4), Text(m.$3, style: const TextStyle(color: AppColors.muted)),
      ])),
    ]))),
    Text('Aprenda mais', style: Theme.of(context).textTheme.titleLarge),
    ...['O que é glicemia?', 'Índice glicêmico dos alimentos', 'Hipoglicemia: como agir', 'Atividade física e diabetes']
      .map((a) => Panel(child: Row(children: [const Icon(Icons.menu_book, color: AppColors.accent),
        const SizedBox(width: 12), Expanded(child: Text(a))]))),
  ]);
}
