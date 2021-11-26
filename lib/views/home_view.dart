import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_pokemon/api/api.dart';
import 'package:http/http.dart' as http;

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  var url = Uri.parse('https://pokeapi.co/api/v2/pokemon/ditto');
  var url2 = Uri.parse('https://pokeapi.co/api/v2/pokemon');
  List pokedex = [];
  late TabController _tabController;

  fetchData() async {
    var res = await http.get(url2);
    var decodeJson = jsonDecode(res.body);
    pokedex = decodeJson['results'];
    //debugPrint(pokedex[0]['name']);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    //fetchData();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PokeApi pokeApi = PokeApi();
    pokedex = pokeApi.fetchData();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: Image.asset(
            'assets/images/pokeapi.png',
            scale: 1.8,
          ),
          centerTitle: true,
          bottom: TabBar(
              labelColor: Colors.black,
              indicatorColor: Colors.black,
              controller: _tabController,
              tabs: const [
                Tab(
                  text: 'Favorito',
                ),
                Tab(
                  text: 'Procurar',
                ),
                Tab(
                  text: 'Ver todos',
                ),
              ]),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
            Observer(
                builder: (context) => GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1.4),
                    itemCount: pokedex.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Text(pokedex[index]['name']),
                      );
                    }))

            /*GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1.4),
                itemCount: pokedex.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Text(pokedex[index]['name']),
                  );
                }),*/
          ],
        ));
  }

  void fetchPokemonData() async {
    var res = await http.get(url2);
    var decodeJson = jsonDecode(res.body);
    pokedex = decodeJson['results'];
    debugPrint(pokedex[0]['name']);
  }
}
