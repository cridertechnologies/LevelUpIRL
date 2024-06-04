import 'package:flutter/material.dart';
import 'package:levelupirl/models/skill_model.dart';
import 'package:levelupirl/widgets/attribute_level_tracker.dart';

class ProgressTrackerScreen extends StatefulWidget {
  const ProgressTrackerScreen({super.key});

  @override
  State<ProgressTrackerScreen> createState() => _ProgressTrackerScreenState();
}

class _ProgressTrackerScreenState extends State<ProgressTrackerScreen> {
  final SkillModel _strength = SkillModel.strength;
  final SkillModel _stamina = SkillModel.stamina;
  final SkillModel _dexterity = SkillModel.dexterity;
  final SkillModel _constitution = SkillModel.constitution;

  void _updateSkillLevel(SkillModel skill, int level) {
    setState(() {
      skill.level = level;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slay The Hydra'),
        backgroundColor: Colors.green[700],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Your Character:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            AttributeLevelTracker(
              attribute: _strength,
              icon: Icons.fitness_center,
              onLevelChanged: (level){
                _updateSkillLevel(_strength, level);
              },
            ),
            AttributeLevelTracker(
              attribute: _stamina,
              icon: Icons.directions_run,
              onLevelChanged: (level){
                _updateSkillLevel(_stamina, level);
              },
            ),
            AttributeLevelTracker(
              attribute: _dexterity,
              icon: Icons.accessibility,
              onLevelChanged: (level){
                _updateSkillLevel(_dexterity, level);
              },
            ),
            AttributeLevelTracker(
              attribute: _constitution,
              icon: Icons.hotel,
              onLevelChanged: (level){
                _updateSkillLevel(_constitution, level);
              },
            ),
            const SizedBox(height: 20),
            const Text(
              '(20 minutes to check 1 box. 20 checked boxes levels up!)',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            const Text('• You must be level 15 to cripple a leg', style: TextStyle(fontSize: 16)),
            const Text('• 10,000 steps per day weakens 1 scale', style: TextStyle(fontSize: 16)),
            const Text('• When all the scales are weakened and all the legs are crippled, you can strike the heart',
                style: TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(labelText: 'How much does each head weigh?'),
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'What will finish the heart?'),
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: 'Starting Weight'),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: 'Starting Date'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}