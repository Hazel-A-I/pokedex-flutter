import 'package:flutter/material.dart';
import 'package:pokedex_flutter/models/card_model.dart';
import 'package:pokedex_flutter/models/poke_model.dart';

class PokeCard extends StatefulWidget {
  final CardModel card;
  final VoidCallback onPressed;

  const PokeCard({super.key, required this.card, required this.onPressed});

  @override
  _PokeCardState createState() => _PokeCardState();
}

class _PokeCardState extends State<PokeCard> {
  // apply mobx, please.
  bool isHovered = false;
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: GestureDetector(
        onTap: () {
          widget.onPressed();
        },
        onTapDown: (_) {
          setState(() {
            isPressed = true;
          });
        },
        onTapUp: (_) {
          setState(() {
            isPressed = false;
          });
        },
        child: Card(
          elevation: isPressed ? 1.0 : (isHovered ? 2.0 : 0.0),
          child: Container(
            color: Colors.pink,
            child: Column(
              children: [
                SizedBox(height: 10),
                Container(
                    child: Image.network(widget.card.imageURL, height: 60),
                    color: Colors.black12),
                Text(widget.card.pokemonName,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: widget.card.pokemonTypes.map((type) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
                      padding: EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        type,
                        style: TextStyle(color: Colors.white, fontSize: 10),
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
