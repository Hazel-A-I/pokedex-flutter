import 'package:flutter/material.dart';

class PokeButton extends StatefulWidget {
  final String? label;
  final Function()? action;
  const PokeButton({this.action, this.label, super.key});

  @override
  State<PokeButton> createState() => _PokeButtonState();
}

class _PokeButtonState extends State<PokeButton> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white70),
        ),
        child: Text(widget.label!),
        onPressed: () {
          widget.action!;
        },
      ),
      Divider(
        color: Colors.grey,
        thickness: 1.0,
        indent: 16,
        endIndent: 16,
      ),
    ]);
  }
}
