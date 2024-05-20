import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:levelupirl/blocs/character_bloc/character_event.dart';
import 'package:levelupirl/blocs/character_bloc/character_state.dart';
import 'package:levelupirl/models/character_model.dart';
import 'package:levelupirl/utilities/database.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc() : super(CharacterInitial()){
    on<CreateCharacter>(_onCreateCharacter);
  }

  void _onCreateCharacter(CreateCharacter event, Emitter<CharacterState> emit) async {
    emit(CharacterLoading());
    try{
      final character = CharacterModel(
        name: event.name,
        hairColor: event.hairColor,
        eyeColor: event.eyeColor,
        skinColor: event.skinColor,
        hairStyle: event.hairStyle,
      );
      // Save to Firebase
      final db = Database();
      final result = await db.saveCharacter(character);

      if(!result) throw Exception('Failed to save character');

      emit(CharacterCreated(character));
    }
    catch (e){
      emit(CharacterError(e.toString()));
    }
  }
}