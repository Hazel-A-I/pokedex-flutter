import 'package:pokedex_flutter/consts/consts.dart';

class PokemonData {
  late String name = '';
  late List<String> types = [];
  late List<String> moves = [];
  late List<String> abilities = [];
  late String imageURL = '';

  PokemonData({
    required this.name,
    required this.types,
    required this.moves,
    required this.abilities,
    required this.imageURL,
  });

  PokemonData.fromJson(JsonMap json) {
    name = json["name"].toString();

    if (json["abilities"] != null && json["abilities"] is List) {
      for (var ability in (json["abilities"] as List)) {
        if (ability != null &&
            ability["ability"] != null &&
            ability["ability"]["name"] != null) {
          String abilityName = ability["ability"]["name"].toString();
          this.abilities.add(abilityName);
        }
      }
    } else {
      abilities = ["", ""];
    }
    if (json["types"] != null && json["types"] is List) {
      // Iterate through the "abilities" array
      for (var type in (json["types"] as List)) {
        if (type != null &&
            type["type"] != null &&
            type["type"]["name"] != null) {
          String typeName = type["type"]["name"].toString();
          this.types.add(typeName);
        }
      }
    } else {
      types = ["", ""];
    }

    if (json["moves"] != null && json["moves"] is List) {
      for (var move in (json["moves"] as List)) {
        if (move != null &&
            move["move"] != null &&
            move["move"]["name"] != null) {
          String moveName = move["move"]["name"].toString();
          this.moves.add(moveName);
        }
        break; // temporario
      }
    } else {
      this.moves = ["", ""];
    }
    if (json["sprites"] != null &&
        json["sprites"]["other"] != null &&
        json["sprites"]["other"]["official-artwork"] != null &&
        json["sprites"]["other"]["official-artwork"]["front_default"] != null) {
      this.imageURL = json["sprites"]["other"]["official-artwork"]
              ["front_default"]
          .toString();
    } else {
      this.imageURL =
          "https://cdn2.iconfinder.com/data/icons/pokemon-filledoutline/64/pokeball-people-pokemon-nintendo-video-game-gaming-gartoon-ball-512.png";
    }
  }
}
