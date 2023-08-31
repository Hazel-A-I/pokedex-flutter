import 'package:pokedex_flutter/models/poke_model.dart';

class SuggestionService {
  static List<String> getPokeSuggestions(
      List<PokemonData> pokemons, String query) {
    List<PokemonData> newList = [];

    newList.addAll(pokemons);

    newList.removeWhere((element) => !element.name.contains(query));

    return newList.map((e) => e.name).toList();
  }
}
