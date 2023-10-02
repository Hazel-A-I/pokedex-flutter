import 'package:flutter/material.dart';
import 'package:pokedex_flutter/models/card_model.dart';
import 'package:pokedex_flutter/models/poke_model.dart';
import 'package:pokedex_flutter/providers/poke_provider.dart';
import 'package:pokedex_flutter/widgets/poke_card.dart';
import 'package:provider/provider.dart';

class PokeGrid extends StatelessWidget {
  final VoidCallback function;
  const PokeGrid({super.key, required this.function});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonData>>(
      future: fetchPokemonData(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
              child: Container(
                  width: 100, height: 100, child: CircularProgressIndicator()));
        } else {
          final List<PokemonData> pokemons = snapshot.data!;
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 180,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
            ),
            itemCount: pokemons.length,
            itemBuilder: (context, index) {
              PokemonData pokemonData = pokemons[index];
              CardModel cardModel = CardModel(
                  pokemonName: pokemonData.name,
                  imageURL: pokemonData.imageURL,
                  pokemonTypes: pokemonData.types);
              return PokeCard(
                card: cardModel, // mobx please.
                onPressed: function,
              );
            },
          );
        }
      },
    );
  }
}

Future<List<PokemonData>> fetchPokemonData(BuildContext context) async {
  return Provider.of<PokeProvider>(context).allPokemons;
}
