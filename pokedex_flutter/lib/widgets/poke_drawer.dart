import 'package:flutter/material.dart';
import 'package:pokedex_flutter/models/filter_options.dart';
import 'package:pokedex_flutter/styles/styles.dart';

class PokeDrawer extends StatelessWidget {
  const PokeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    FilterOptions filters = FilterOptions();
    TextEditingController abilityController = TextEditingController();
    return Container(
      color: Colors.grey[300],
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          'F I L T E R S',
          textAlign: TextAlign.center,
          style: AppStyles.vintageTitleStyle,
        ),
        Container(
          height: 1.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.grey.withOpacity(0.2),
                Colors.grey,
                Colors.grey.withOpacity(0.2),
              ],
              stops: const [0, 0.3, 1],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        TextButton(
            child: Text(
              'A B I L I T I E S',
              textAlign: TextAlign.center,
              style: AppStyles.vintageTextStyle,
            ),
            onPressed: () {}),
        Container(
          height: 1.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.grey.withOpacity(0.2),
                Colors.grey,
                Colors.grey.withOpacity(0.2),
              ],
              stops: [0, 0.3, 1],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ]),
    );
  }
}
