class SkillModel {
  final String name;
  int level;

  SkillModel({required this.name, this.level = 0});

  factory SkillModel.fromJson(Map<String, dynamic> json) {
    return SkillModel(
      name: json['name'],
      level: json['level'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'level': level,
    };
  }

  static SkillModel get constitution => SkillModel(name: 'Constitution', level: 0);
  static SkillModel get strength => SkillModel(name: 'Strength', level: 0);
  static SkillModel get dexterity => SkillModel(name: 'Dexterity', level: 0);
  static SkillModel get stamina => SkillModel(name: 'Stamina', level: 0);
}