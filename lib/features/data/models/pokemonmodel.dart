class PokemonModel {
  final int id;
  final String name;
  final int height;
  final int weight;
  final List<String> types;
  final String imageUrl;
  final List<String> abilities;
  final List<StatModel> stats;
  final List<MoveModel> moves;

  PokemonModel({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.types,
    required this.imageUrl,
    required this.abilities,
    required this.stats,
    required this.moves,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      id: json['id'],
      name: json['name'],
      height: json['height'],
      weight: json['weight'],
      types: (json['types'] as List)
          .map((t) => t['type']['name'] as String)
          .toList(),
      imageUrl: json['sprites']['other']['official-artwork']['front_default'],
      abilities: (json['abilities'] as List)
          .map((a) => a['ability']['name'] as String)
          .toList(),
      stats: (json['stats'] as List).map((s) => StatModel.fromJson(s)).toList(),
      moves: (json['moves'] as List).map((m) => MoveModel.fromJson(m)).toList(),
    );
  }
}

class StatModel {
  final String name;
  final int baseStat;

  StatModel({required this.name, required this.baseStat});

  factory StatModel.fromJson(Map<String, dynamic> json) {
    return StatModel(name: json['stat']['name'], baseStat: json['base_stat']);
  }
}

class MoveModel {
  final String name;

  MoveModel({required this.name});

  factory MoveModel.fromJson(Map<String, dynamic> json) {
    return MoveModel(name: json['move']['name']);
  }
}
