import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        elevation: 0,

        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.search),
            hoverColor: Colors.transparent),
          )
        ],
      ),
      drawer: Drawer(
            key: ValueKey<String>("myDrawer"),
            width: MediaQuery.of(context).size.width,
            elevation: 0,
            child: LayoutBuilder(builder: (context, constraints) {
              if(constraints.maxWidth > 400) {
                return Text('wsfasda');
              }else {
                return Text('adfadf');
              }
              
            },),
          ),
      body: Row(
        children: [
          

        ],
      )
    );
  }
}
