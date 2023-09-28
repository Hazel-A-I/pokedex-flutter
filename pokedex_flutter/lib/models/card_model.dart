import 'package:pokedex_flutter/models/poke_model.dart';

class CardModel {
  late String pokemonName = '';
  late String imageURL = '';
  late List<String> pokemonTypes = [];
  CardModel({
    required this.pokemonName,
    required this.imageURL,
    required this.pokemonTypes,
  });
}
