import 'package:flutter/material.dart';
import 'package:pokedex_flutter/providers/poke_provider.dart';
import 'package:provider/provider.dart';

class PokeSearchBar extends StatelessWidget {
  const PokeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final pokemonProvider = Provider.of<PokeProvider>(context);
    final suggestions = pokemonProvider.getSuggestions;

    return Container();
  }
}
