import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex_flutter/models/card_model.dart';
import 'package:pokedex_flutter/stores/poke_card_store.dart';

class PokeCard extends StatelessWidget {
  final CardModel card;
  final VoidCallback onPressed;
  final PokeCardStore pokeCardStore;
  final double gridTileSize;

  const PokeCard({
    super.key,
    required this.card,
    required this.onPressed,
    required this.pokeCardStore,
    required this.gridTileSize,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        pokeCardStore.setHovered(true);
      },
      onExit: (event) {
        pokeCardStore.setHovered(false);
      },
      child: InkWell(
        onTap: onPressed,
        child: Card(
          elevation: pokeCardStore.isHovered ? 5.0 : 0.0,
          shadowColor: Colors.black45,
          child: Container(
            width: gridTileSize,
            height: gridTileSize,
            color: Colors.pink,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                Image.network(card.imageURL,
                    height: gridTileSize <= 400 ? 40 : 60),
                Text(
                  card.pokemonName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: card.pokemonTypes.map((type) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 1.0),
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                      child: Text(
                        type,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: gridTileSize <= 400 ? 10 : 16),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
