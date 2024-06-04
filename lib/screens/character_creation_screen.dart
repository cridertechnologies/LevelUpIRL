import 'package:flutter/material.dart';
import 'package:levelupirl/app_values/colors.dart';
import 'package:levelupirl/models/avatar_model.dart';
import 'package:levelupirl/models/character_model.dart';
import 'package:levelupirl/widgets/color_option.dart';
import 'package:levelupirl/widgets/hair_style_option.dart';

class CharacterCreationScreen extends StatefulWidget {
  final CharacterModel? characterModel;

  const CharacterCreationScreen({super.key, this.characterModel});

  @override
  State<CharacterCreationScreen> createState() => _CharacterCreationScreenState();
}

class _CharacterCreationScreenState extends State<CharacterCreationScreen> {
  late AvatarModel _avatarModel;

  @override
  void initState() {
    super.initState();
    if(widget.characterModel == null){
      _avatarModel = CharacterModel.base.avatarModel;
    }
    else{
      _avatarModel = widget.characterModel!.avatarModel;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customize Your Avatar'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text('Make it look just like you!', style: TextStyle(fontSize: 16)),
          const SizedBox(height: 20),
          CircleAvatar(
            radius: 60,
            backgroundColor: _avatarModel.skinColor,
            child: CircleAvatar(
              radius: 50,
              backgroundColor: _avatarModel.hairColor,
              child: Text(
                'Face', // This would be a custom image/widget in a real app
                style: TextStyle(color: _avatarModel.eyeColor),
              ),
            ),
          ),
          const SizedBox(height: 20),
          _showCustomizationOptions(),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              // Save the changes
            },
            child: const Text('Save Changes'),
          ),
        ],
      ),
    );
  }

  Widget _showCustomizationOptions() {
    return Column(
      children: [
        const Text('Hair Color'),
        Row(
          children: [
            ColorOption(color: Colors.black, avatarModel: _avatarModel, part: 'hairColor'),
            ColorOption(color: Colors.brown, avatarModel: _avatarModel, part: 'hairColor'),
            ColorOption(color: Colors.red, avatarModel: _avatarModel, part: 'hairColor'),
          ],
        ),
        const SizedBox(height: 20),
        const Text('Eye Color'),
        Row(
          children: [
            ColorOption(color: Colors.brown, avatarModel: _avatarModel, part: 'eyeColor'),
            ColorOption(color: Colors.blue, avatarModel: _avatarModel, part: 'eyeColor'),
            ColorOption(color: Colors.green, avatarModel: _avatarModel, part: 'eyeColor'),
          ],
        ),
        const SizedBox(height: 20),
        const Text('Skin Color'),
        Row(
          children: [
            ColorOption(color: AppColors.skinLight, avatarModel: _avatarModel, part: 'skinColor'),
            ColorOption(color: AppColors.skinMedium, avatarModel: _avatarModel, part: 'skinColor'),
            ColorOption(color: AppColors.skinDark, avatarModel: _avatarModel, part: 'skinColor'),
          ],
        ),
        const SizedBox(height: 20),
        const Text('Hair Style'),
        Row(
          children: [
            HairStyleOption(style: HairStyle.short, avatarModel: _avatarModel),
            HairStyleOption(style: HairStyle.medium, avatarModel: _avatarModel),
            HairStyleOption(style: HairStyle.long, avatarModel: _avatarModel),
          ],
        ),
      ],
    );
  }
}