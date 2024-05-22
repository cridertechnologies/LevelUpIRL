import 'package:equatable/equatable.dart';
import 'package:levelupirl/models/avatar_model.dart';

abstract class CharacterEvent extends Equatable {
  const CharacterEvent();

  @override
  List<Object> get props => [];
}

class CreateCharacter extends CharacterEvent{
  final String name;
  final AvatarModel avatarModel;

  const CreateCharacter({
    required this.name,
    required this.avatarModel,
  });

  @override
  List<Object> get props => [name, avatarModel];
}