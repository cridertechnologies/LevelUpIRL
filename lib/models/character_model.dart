import 'package:flutter/material.dart';
import 'package:levelupirl/app_values/colors.dart';
import 'package:levelupirl/models/avatar_model.dart';

class CharacterModel {
  final String name;
  final AvatarModel avatarModel;

  const CharacterModel({
    required this.name,
    required this.avatarModel
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'avatarModel': avatarModel.toMap(),
    };
  }

  factory CharacterModel.fromMap(Map<String, dynamic> map) {
    return CharacterModel(
      name: map['name'],
      avatarModel: AvatarModel.fromMap(map['avatarModel']),
    );
  }

  static CharacterModel base = CharacterModel(
    name: 'John Doe',
    avatarModel: AvatarModel(
      hairColor: Colors.black,
      eyeColor: Colors.brown,
      skinColor: AppColors.skinLight,
      hairStyle: HairStyle.short,
    )
  );
}