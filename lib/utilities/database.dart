import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:levelupirl/models/character_model.dart';
import 'package:levelupirl/utilities/auth.dart';

class Database{
  // Firebase ref
  final FirebaseFirestore _storage = FirebaseFirestore.instance;
  final Authentication _auth = Authentication();

  static final Database _instance = Database._internal();
  factory Database() => _instance;
  Database._internal();

  static const String _characterCollectionPath = 'characters';

  Future<bool> saveCharacter(CharacterModel character) async {
    // Save to Firebase
    final uid = _auth.user?.uid;
    if(uid == null) return false; // User not logged in
    await _storage
      .collection(uid)
      .doc(_characterCollectionPath)
      .set(character.toMap())
      .onError((e, _) => throw e!);

    return true;
  }
}