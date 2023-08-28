import 'package:flutter/material.dart';
import 'package:pokedex_flutter/styles/styles.dart';

class PokeDrawer extends StatelessWidget {
  const PokeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[300],
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          'F I L T E R S',
          textAlign: TextAlign.center,
          style: AppStyles.vintageTextStyle,
        ),
        Divider(
          color: Colors.grey,
          thickness: 1.0,
          indent: 16,
          endIndent: 16,
        ),
        Text(
          'data',
          textAlign: TextAlign.center,
          style: AppStyles.vintageTextStyle,
        ),
        Divider(
          color: Colors.grey,
          thickness: 1.0,
          indent: 16,
          endIndent: 16,
        ),
      ]),
    );
  }
}
