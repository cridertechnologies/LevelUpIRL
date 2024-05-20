class CharacterModel {
  final String name;
  final String hairColor;
  final String eyeColor;
  final String skinColor;
  final String hairStyle;

  CharacterModel({
    required this.name,
    required this.hairColor,
    required this.eyeColor,
    required this.skinColor,
    required this.hairStyle,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'hairColor': hairColor,
      'eyeColor': eyeColor,
      'skinColor': skinColor,
      'hairStyle': hairStyle,
    };
  }

  factory CharacterModel.fromMap(Map<String, dynamic> map) {
    return CharacterModel(
      name: map['name'],
      hairColor: map['hairColor'],
      eyeColor: map['eyeColor'],
      skinColor: map['skinColor'],
      hairStyle: map['hairStyle'],
    );
  }
}