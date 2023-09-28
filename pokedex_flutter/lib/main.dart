import 'package:flutter/material.dart';
import 'package:pokedex_flutter/providers/poke_provider.dart';
import 'package:pokedex_flutter/repositories/poke_repo.dart';
import 'package:pokedex_flutter/screens/desktop_layout.dart';
import 'package:pokedex_flutter/screens/homeScreen.dart';
import 'package:pokedex_flutter/screens/mobile_layout.dart';
import 'package:pokedex_flutter/screens/tablet_layout.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PokeProvider(),
        ),
      ],
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return constraints.maxWidth > 768
                ? DesktopLayout()
                : (constraints.maxWidth > 480
                    ? TabletLayout()
                    : MobileLayout());
          },
        ),
      ),
      theme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(),
      ),
    );
  }
}
