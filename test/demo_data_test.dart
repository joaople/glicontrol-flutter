import 'package:flutter_test/flutter_test.dart';
import 'package:glicontrol/models/demo_data.dart';

void main() {
  test('Demo status uses the displayed 70–140 interval inclusively', () {
    expect(const Reading(69, '', '', '').status, 'Baixa');
    expect(const Reading(70, '', '', '').status, 'Normal');
    expect(const Reading(140, '', '', '').status, 'Normal');
    expect(const Reading(141, '', '', '').status, 'Alta');
  });
}
