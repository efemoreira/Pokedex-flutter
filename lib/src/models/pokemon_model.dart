class Pokemon {
  final String name;
  final String imageUrl;
  final List<String> types;
  final List<String> moves;
  final double height;
  final double weight;

  Pokemon({
    this.name = '',
    this.imageUrl = '',
    this.types = const [],
    this.moves = const [],
    this.height = 0,
    this.weight = 0,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      imageUrl: json['sprites']['front_default'],
      types: (json['types'] as List<dynamic>)
          .map((type) => type['type']['name'].toString())
          .toList(),
      moves: (json['moves'] as List<dynamic>)
          .map((ability) => ability['move']['name'].toString())
          .toList(),
      height: json['height'] * 0.1,
      weight: json['weight'] * 0.1,
    );
  }
}