import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/step_simulation_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final steps = context.watch<int>();
    final calories = (steps * 0.04).toStringAsFixed(2);
    final points = (steps / 100).toStringAsFixed(1);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fitness Tracker'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.asset(
                  'assets/fitness.png',
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Steps: $steps',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              LinearProgressIndicator(
                value: steps / 1000,
                minHeight: 12,
                backgroundColor: Colors.grey[300],
                color: Colors.deepPurple,
              ),
              const SizedBox(height: 20),
              Text('Calories Burned: $calories kcal', style: Theme.of(context).textTheme.bodyLarge),
              Text('Points Earned: $points', style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
              if (steps >= 1000)
                const Text(
                  '🎉 You reached 1,000 steps! Badge Unlocked! 🎉',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.green,
                  ),
                  textAlign: TextAlign.center,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
