import 'package:pokedex_flutter/consts/consts.dart';

class PokemonData {
  late String name;
  late List<String> types;
  late List<String> moves;
  late List<String> abilities;
  late String imageURL;

  PokemonData({
    required this.name,
    required this.types,
    required this.moves,
    required this.abilities,
    required this.imageURL,
  });

  PokemonData.fromJson(JsonMap json) {
    this.name = json["name"];
    if (json["types"] != null)
      this.types = List<String>.from(
          json["types"].forEach((type) => type.name.toString()));

    if (json["moves"] != null)
      this.moves = List<String>.from(
          json["moves"].forEach((move) => move.name.toString()));

    if (json["abilities"] != null)
      this.abilities = List<String>.from(
          json["abilities"].forEach((ability) => ability.name.toString()));

    if (json["sprites"] != null)
      this.imageURL =
          json["sprites"]["other"]["official-artwork"]["front-default"];
  }
}
