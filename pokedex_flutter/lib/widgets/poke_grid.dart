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
          return Text('No Pokémon data available.');
        } else {
          final List<PokemonData> pokemons = snapshot.data!;
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 160,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
            ),
            itemCount: pokemons.length,
            itemBuilder: (context, index) {
              PokemonData pokemonData = pokemons[index];
              return FutureBuilder<CardModel?>(
                future: createCardModel(context, pokemonData),
                builder: (context, cardSnapshot) {
                  if (cardSnapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (cardSnapshot.hasError) {
                    return Text('Error: ${cardSnapshot.error}');
                  } else if (!cardSnapshot.hasData) {
                    return Text('No CardModel data available.');
                  } else {
                    CardModel cardModel = cardSnapshot.data!;
                    return PokeCard(
                      card: cardModel,
                      onPressed: function,
                    );
                  }
                },
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

Future<CardModel?> createCardModel(
    BuildContext context, PokemonData pokemonData) async {
  String? pokemonName = pokemonData.name;
  String? imageURL = pokemonData.imageURL;
  List<String>? pokemonTypes = pokemonData.types;

  if (pokemonName.isNotEmpty &&
      imageURL.isNotEmpty &&
      pokemonTypes.isNotEmpty) {
    return CardModel(
      pokemonName: pokemonName,
      imageURL: imageURL,
      pokemonTypes: pokemonTypes,
    );
  }
  return null;
}
