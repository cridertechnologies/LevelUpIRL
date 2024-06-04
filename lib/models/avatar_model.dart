import 'package:flutter/material.dart';

class AvatarModel{
  Color hairColor;
  Color eyeColor;
  Color skinColor;
  HairStyle hairStyle;

  AvatarModel({
    required this.hairColor,
    required this.eyeColor,
    required this.skinColor,
    required this.hairStyle,
  });

  Map<String, dynamic> toMap() {
    return {
      'hairColor': hairColor.value,
      'eyeColor': eyeColor.value,
      'skinColor': skinColor.value,
      'hairStyle': hairStyle,
    };
  }

  factory AvatarModel.fromMap(Map<String, dynamic> map) {
    return AvatarModel(
      hairColor: Color(map['hairColor']),
      eyeColor: Color(map['eyeColor']),
      skinColor: Color(map['skinColor']),
      hairStyle: map['hairStyle'],
    );
  }

  void updateColor(String part, Color color){
    switch(part){
      case 'hair':
        hairColor = color;
        break;
      case 'eye':
        eyeColor = color;
        break;
      case 'skin':
        skinColor = color;
        break;
    }
  }

  Color getColor(String part){
    switch(part){
      case 'hair':
        return hairColor;
      case 'eye':
        return eyeColor;
      case 'skin':
        return skinColor;
      default:
        return Colors.black;
    }
  }
}

enum HairStyle {
  short,
  medium,
  long,
}