import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
part 'api.g.dart';

class PokeApi = _PokeApiBase with _$PokeApi;

abstract class _PokeApiBase with Store {
  var url2 = Uri.parse('https://pokeapi.co/api/v2/pokemon');

  @observable
  List pokedex = [];

  @action
  fetchPokemonList() {
    fetchData();
  }

  fetchData() async {
    var res = await http.get(url2);
    var decodeJson = jsonDecode(res.body);
    pokedex = decodeJson['results'];
    //debugPrint(pokedex[0]['name']);
  }
}
