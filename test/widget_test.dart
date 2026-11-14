import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glicontrol/main.dart';

void main() {
  testWidgets('Demo login opens the home screen', (tester) async {
    await tester.pumpWidget(const GlicontrolApp());
    await tester.enterText(find.byType(TextFormField).at(0), 'demo@example.com');
    await tester.enterText(find.byType(TextFormField).at(1), 'demo');
    await tester.ensureVisible(find.text('Entrar'));
    await tester.tap(find.text('Entrar'));
    await tester.pumpAndSettle();
    expect(find.text('Olá, Maria'), findsOneWidget);
    await tester.tap(find.text('Perfil'));
    await tester.pumpAndSettle();
    expect(find.text('Meu perfil'), findsOneWidget);
  });
}
