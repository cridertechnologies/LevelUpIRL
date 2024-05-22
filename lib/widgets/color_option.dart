import 'package:flutter/material.dart';
import 'package:levelupirl/models/avatar_model.dart';

class ColorOption extends StatelessWidget{
  final Color color;
  final AvatarModel avatarModel;
  final String part;

  const ColorOption({super.key, required this.color, required this.avatarModel, required this.part});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        avatarModel.updateColor(part, color);
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: avatarModel.getColor(part) == color ? Colors.black : Colors.transparent,
            width: 2,
          ),
        ),
      ),
    );
  }
}