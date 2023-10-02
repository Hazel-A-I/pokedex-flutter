import 'package:pokedex_flutter/models/poke_model.dart';

class CardModel {
  final String pokemonName;
  final String imageURL;
  final List<String> pokemonTypes;
  CardModel({
    required this.pokemonName,
    required this.imageURL,
    required this.pokemonTypes,
  });
}
