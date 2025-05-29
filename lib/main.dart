// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/step_data.dart';
import 'services/step_simulation_service.dart';
import 'services/step_database_service.dart';
import 'ui/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StepDatabaseService.instance.init();
  StepSimulationService().start();

  runApp(
    StreamProvider<int>(
      create: (_) => StepSimulationService().stepStream,
      initialData: 0,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness Tracker',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HomePage(),
    );
  }
}
