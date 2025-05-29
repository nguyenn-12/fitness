import 'dart:async';
import 'dart:math';
import 'step_database_service.dart';

class StepSimulationService {
  static final StepSimulationService _instance = StepSimulationService._internal();
  factory StepSimulationService() => _instance;
  StepSimulationService._internal();

  int _stepCount = 0;
  final _controller = StreamController<int>.broadcast();
  Stream<int> get stepStream => _controller.stream;

  void start() {
    Timer.periodic(Duration(seconds: 5), (timer) {
      _stepCount += Random().nextInt(20); // simulate step increments
      _controller.add(_stepCount);
      StepDatabaseService.instance.insertSteps(_stepCount);
    });
  }

  int get currentStepCount => _stepCount;
}