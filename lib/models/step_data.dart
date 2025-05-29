// models/step_data.dart
class StepData {
  final int stepCount;
  final DateTime timestamp;

  StepData({required this.stepCount, required this.timestamp});

  Map<String, dynamic> toMap() {
    return {
      'step_count': stepCount,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  factory StepData.fromMap(Map<String, dynamic> map) {
    return StepData(
      stepCount: map['step_count'],
      timestamp: DateTime.parse(map['timestamp']),
    );
  }
}
