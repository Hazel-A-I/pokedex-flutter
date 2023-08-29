import 'package:pokedex_flutter/models/poke_model.dart';

class SuggestionService {
  static List<String> getPokeSuggestions(List<PokemonData> pokemons, String query) {
    return pokemons
        .map((pokemon) => pokemon.name)
        .toList();
  }
}