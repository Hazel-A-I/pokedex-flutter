import 'package:http/http.dart' as http;
import 'package:pokedex_flutter/consts/consts.dart';
import 'package:pokedex_flutter/models/poke_model.dart';
import 'package:pokedex_flutter/models/filter_options.dart';
import 'dart:convert';

class PokeRepo {
  static Future<List<PokemonData>> getPokemon() async {
    Uri uri = Uri.https("pokeapi.co", "/api/v2/pokemon", {"limit": "1281"});

    http.Response response = await http.get(uri);

    var resObj = json.decode(response.body);

    List<PokemonData> pokeList = [];

    for (var pokemon in (resObj["results"] as List<dynamic>)) {
      pokeList.add(PokemonData.fromJson(pokemon as JsonMap));
    }

    return pokeList;
  }

  static Future<List<PokemonData>> filterPokemons(FilterOptions options) async {
    final allPokemons = await getPokemon();

    final filteredPokemons = allPokemons.where((pokemon) {
      bool matchesType =
          options.type == null || pokemon.types.contains(options.type);
      bool matchesMove =
          options.move == null || pokemon.moves.contains(options.move);
      bool matchesAbility = options.ability == null ||
          pokemon.abilities.contains(options.ability);

      return matchesType && matchesMove && matchesAbility;
    }).toList();

    return filteredPokemons;
  }
}
