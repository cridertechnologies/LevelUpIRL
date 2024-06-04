import 'package:flutter/material.dart';
import 'package:levelupirl/models/avatar_model.dart';

class HairStyleOption extends StatelessWidget {
  const HairStyleOption({
    super.key,
    required this.style,
    required this.avatarModel,
  });

  final HairStyle style;
  final AvatarModel avatarModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        avatarModel.hairStyle = style;
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.brown,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            style.toString().split('.').last,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}