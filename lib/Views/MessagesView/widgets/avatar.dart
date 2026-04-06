import 'package:chatface/Models/persona_model.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final PersonaProfile character;
  final double radius;

  const Avatar({super.key, required this.character, required this.radius});

  @override
  Widget build(BuildContext context) {
    final imageProvider = character.isNetworkImage
        ? NetworkImage(character.displayImagePath)
        : AssetImage(character.displayImagePath) as ImageProvider;
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
