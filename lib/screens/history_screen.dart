import 'package:flutter/material.dart';
import '../models/demo_data.dart';
import '../theme.dart';
import '../widgets/shared.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});
  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}
class _HistoryScreenState extends State<HistoryScreen> {
  int period = 7;
  @override
  Widget build(BuildContext context) => PageBody(children: [
    Wrap(spacing: 8, children: [7, 30, 90].map((p) => ChoiceChip(
      label: Text('$p dias'), selected: period == p,
      onSelected: (_) => setState(() => period = p))).toList()),
    const Panel(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Tendência', style: TextStyle(fontWeight: FontWeight.bold)),
      SizedBox(height: 12),
      SizedBox(height: 150, width: double.infinity, child: CustomPaint(painter: _Chart())),
      SizedBox(height: 8),
      Text('Faixa verde: 70–140 mg/dL (referência demonstrativa)', style: TextStyle(fontSize: 12, color: AppColors.muted)),
    ])),
    ...demoReadings.map((r) => Panel(padding: 12, child: Column(
      crossAxisAlignment: CrossAxisAlignment.start, children: [
      Wrap(spacing: 12, runSpacing: 8, crossAxisAlignment: WrapCrossAlignment.center, children: [
        Text('${r.value} mg/dL', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        StatusBadge(reading: r),
      ]),
      Row(children: [Expanded(child: Text('${r.context} · ${r.date} ${r.time}', style: const TextStyle(color: AppColors.muted))),
        IconButton(tooltip: 'Editar', onPressed: () => demoNotice(context), icon: const Icon(Icons.edit_outlined)),
        IconButton(tooltip: 'Excluir', onPressed: () => demoNotice(context), icon: const Icon(Icons.delete_outline, color: AppColors.danger)),
      ]),
    ]))),
  ]);
}
class _Chart extends CustomPainter {
  const _Chart();
  @override
  void paint(Canvas canvas, Size size) {
    final plot = Rect.fromLTWH(12, 6, size.width - 24, size.height - 12);
    double y(int v) => plot.bottom - v / 200 * plot.height;
    canvas.drawRect(Rect.fromLTRB(plot.left, y(140), plot.right, y(70)),
      Paint()..color = AppColors.success.withAlpha(24));
    final rows = demoReadings.reversed.toList();
    final path = Path();
    for (var i = 0; i < rows.length; i++) {
      final point = Offset(plot.left + i / (rows.length - 1) * plot.width, y(rows[i].value));
      if (i == 0) { path.moveTo(point.dx, point.dy); } else { path.lineTo(point.dx, point.dy); }
      canvas.drawCircle(point, 4, Paint()..color = AppColors.accent);
    }
    canvas.drawPath(path, Paint()..color = AppColors.primary..style = PaintingStyle.stroke..strokeWidth = 3);
  }
  @override
  bool shouldRepaint(covariant _Chart oldDelegate) => false;
}
