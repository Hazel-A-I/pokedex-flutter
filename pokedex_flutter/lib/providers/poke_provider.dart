import 'package:flutter/material.dart';
import 'package:pokedex_flutter/models/poke_model.dart';
import 'package:pokedex_flutter/models/filter_options.dart';
import 'package:pokedex_flutter/models/searchbar_suggest.dart';
import 'package:pokedex_flutter/repositories/poke_repo.dart';

class PokeProvider extends ChangeNotifier {
  List<PokemonData> _allPokemons = [];
  List<PokemonData> _filteredPokemons = [];
  List<String> _filteredSuggestions = [];

  PokeProvider() {
    _fetchPokemons();
  }

  Future<void> _fetchPokemons() async {
    _allPokemons = await PokeRepo.getPokemon();
    _filteredPokemons = List.from(_allPokemons);
    notifyListeners();
  }

  Future<void> filterPokemons(FilterOptions options) async {
    _filteredPokemons = await PokeRepo.filterPokemons(options);
    notifyListeners();
  }

  List<PokemonData> get allPokemons => _allPokemons;
  List<PokemonData> get filteredPokemons => _filteredPokemons;
  List<String> pokeSearch(String query) {
    return SuggestionService.getPokeSuggestions(allPokemons, query);
  }

}