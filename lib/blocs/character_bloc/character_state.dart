import 'package:equatable/equatable.dart';
import 'package:levelupirl/models/character_model.dart';

abstract class CharacterState extends Equatable {
  const CharacterState();

  @override
  List<Object> get props => [];
}

class CharacterInitial extends CharacterState {}

class CharacterLoading extends CharacterState {}

class CharacterCreated extends CharacterState {
  final CharacterModel character;

  const CharacterCreated(this.character);

  @override
  List<Object> get props => [character];
}

class CharacterError extends CharacterState {
  final String message;

  const CharacterError(this.message);

  @override
  List<Object> get props => [message];
}