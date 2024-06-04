import 'package:flutter/material.dart';
import 'package:levelupirl/models/skill_model.dart';

class AttributeLevelTracker extends StatelessWidget {
  final SkillModel attribute;
  final IconData icon;
  final ValueChanged<int> onLevelChanged;

  const AttributeLevelTracker({
    super.key, 
    required this.attribute,
    required this.icon,
    required this.onLevelChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon),
            const SizedBox(width: 10),
            Text('${attribute.name} Level: ${attribute.level}', style: const TextStyle(fontSize: 18)),
          ],
        ),
        const SizedBox(height: 10),
        Wrap(
          children: List.generate(20, (index) {
            return GestureDetector(
              onTap: () {
                onLevelChanged(index + 1);
              },
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: index < attribute.level ? Colors.green : Colors.grey[300],
                    border: Border.all(color: Colors.black),
                  ),
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}