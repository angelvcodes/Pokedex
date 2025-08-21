import 'package:dio/dio.dart';
import 'package:pokedex/features/data/models/pokemonmodel.dart';


class PokemonService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://pokeapi.co/api/v2/'));
 
  Future<List<PokemonModel>> getPokemons({int limit = 20, int offset = 0}) async {
  final response = await _dio.get('pokemon', queryParameters: {
    'limit': limit,
    'offset': offset,
  });

  final results = response.data['results'] as List;

 
  final futures = results.map((item) async {
    final detailResponse = await _dio.get(item['url']);
    return PokemonModel.fromJson(detailResponse.data);
  }).toList();

 
  return await Future.wait(futures);
}

  Future<PokemonModel> getPokemon(String nameOrId) async {
    final response = await _dio.get('pokemon/$nameOrId');
    return PokemonModel.fromJson(response.data);
  }
}
