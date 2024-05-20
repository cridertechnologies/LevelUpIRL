import 'package:equatable/equatable.dart';

abstract class CharacterEvent extends Equatable {
  const CharacterEvent();

  @override
  List<Object> get props => [];
}

class CreateCharacter extends CharacterEvent{
  final String name;
  final String hairColor;
  final String eyeColor;
  final String skinColor;
  final String hairStyle;

  const CreateCharacter({
    required this.name,
    required this.hairColor,
    required this.eyeColor,
    required this.skinColor,
    required this.hairStyle,
  });

  @override
  List<Object> get props => [name, hairColor, eyeColor, skinColor, hairStyle];
}