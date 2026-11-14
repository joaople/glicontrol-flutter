class Reading {
  const Reading(this.value, this.context, this.date, this.time);
  final int value;
  final String context;
  final String date;
  final String time;
  String get status => value < 70 ? 'Baixa' : value > 140 ? 'Alta' : 'Normal';
}
const demoReadings = [
  Reading(98, 'Jejum', 'Hoje', '07:10'),
  Reading(165, 'Pós-almoço', 'Ontem', '14:05'),
  Reading(112, 'Antes do jantar', 'Ontem', '19:30'),
  Reading(68, 'Jejum', '02/11', '07:00'),
  Reading(128, 'Pós-café', '02/11', '09:15'),
  Reading(104, 'Jejum', '01/11', '07:20'),
];
