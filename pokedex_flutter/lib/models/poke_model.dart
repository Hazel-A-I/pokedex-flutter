import 'package:flutter/material.dart';
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
    this.types = List<String>.from(json["types"].forEach((type) => type.name.toString()));
    this.moves = List<String>.from(json["moves"].forEach((move) => move.name.toString()));
    this.abilities = List<String>.from(json["abilities"].forEach((ability) => ability.name.toString()));
    this.imageURL = json["sprites"]["other"]["official-artwork"]["front-default"];

  }
}


