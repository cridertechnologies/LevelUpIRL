import 'package:flutter/material.dart';
import 'package:levelupirl/models/avatar_model.dart';

class AvatarDisplay extends StatelessWidget {
  final AvatarModel avatarModel;

  const AvatarDisplay({super.key, required this.avatarModel});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: avatarModel.skinColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/hair/${avatarModel.hairStyle}_${avatarModel.hairColor}.png',
            width: 50,
            height: 50,
          ),
          Image.asset(
            'assets/eyes/eyes_${avatarModel.eyeColor}.png',
            width: 50,
            height: 50,
          ),
        ],
      ),
    );
  }
}