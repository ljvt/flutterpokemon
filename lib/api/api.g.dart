// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokeApi on _PokeApiBase, Store {
  final _$pokedexAtom = Atom(name: '_PokeApiBase.pokedex');

  @override
  List<dynamic> get pokedex {
    _$pokedexAtom.reportRead();
    return super.pokedex;
  }

  @override
  set pokedex(List<dynamic> value) {
    _$pokedexAtom.reportWrite(value, super.pokedex, () {
      super.pokedex = value;
    });
  }

  final _$_PokeApiBaseActionController = ActionController(name: '_PokeApiBase');

  @override
  dynamic fetchPokemonList() {
    final _$actionInfo = _$_PokeApiBaseActionController.startAction(
        name: '_PokeApiBase.fetchPokemonList');
    try {
      return super.fetchPokemonList();
    } finally {
      _$_PokeApiBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokedex: ${pokedex}
    ''';
  }
}
