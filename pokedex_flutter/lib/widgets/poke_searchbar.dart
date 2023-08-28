import 'package:flutter/material.dart';
import 'package:pokedex_flutter/providers/poke_provider.dart';
import 'package:provider/provider.dart';

class PokeSearchBar extends StatelessWidget {
  TextEditingController searchController = TextEditingController();
  PokeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {

    return Container();
  }
}

class PokeSearchDelegate extends SearchDelegate {


  @override
  List<Widget>? buildActions(BuildContext context) => [

        if (query.isNotEmpty)
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          },
        ),
      ];

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('teste');

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> pokeSuggestions = Provider.of(context).getPokeSuggestions(query);

    return ListView.builder(
      itemCount: 7,
      itemBuilder: (context, index) {
        final pokeSuggestion = pokeSuggestions[index];
            return ListTile(
              title: Text(pokeSuggestion),
              onTap: () {
                query = pokeSuggestion;
              },
            );
         }
    );
    }
  
    
  
}
