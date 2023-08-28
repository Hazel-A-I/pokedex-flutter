import 'package:flutter/material.dart';
import 'package:pokedex_flutter/widgets/poke_drawer.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlutterDex'),
        actions: [
          // search bar
        ],
      ),

      body: Row(
        children: [
          Flexible(
            flex: 1,
              child: PokeDrawer(),
          ),
          Expanded(
            flex: 2,
            child: Container(
            
          )),
          Expanded(child: Container(
            
          ))
        ],
      )
    );
  }
}