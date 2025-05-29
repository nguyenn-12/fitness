import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/step_data.dart';

class StepDatabaseService {
  static final StepDatabaseService instance = StepDatabaseService._init();
  static Database? _database;

  StepDatabaseService._init();

  Future<void> init() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'steps.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE steps(id INTEGER PRIMARY KEY AUTOINCREMENT, step_count INTEGER, timestamp TEXT)',
        );
      },
    );
  }

  Future<void> insertSteps(int stepCount) async {
    final db = _database;
    if (db == null) return;
    final step = StepData(stepCount: stepCount, timestamp: DateTime.now());
    await db.insert('steps', step.toMap());
  }

  Future<List<StepData>> fetchSteps() async {
    final db = _database;
    if (db == null) return [];
    final result = await db.query('steps');
    return result.map((json) => StepData.fromMap(json)).toList();
  }
}
