import 'package:flutter/material.dart';
import 'package:pokedex_flutter/widgets/poke_drawer.dart';
import 'package:pokedex_flutter/widgets/poke_grid.dart';
import 'package:pokedex_flutter/widgets/poke_searchbar.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlutterDex'),
        actions: [
          IconButton(
              onPressed: () =>
                  showSearch(context: context, delegate: PokeSearchDelegate()),
              icon: const Icon(Icons.search))
        ],
      ),
      body: Flex(direction: Axis.vertical, children: [
        Flexible(
          flex: 1,
          child: PokeDrawer(),
        ),
        Expanded(
          flex: 2,
          child: PokeGrid(
            function: () {},
          ),
        ),
        Expanded(flex: 2, child: Container()),
      ]),
    );
  }
}
