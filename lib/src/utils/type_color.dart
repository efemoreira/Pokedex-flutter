import 'package:flutter/material.dart';

Color getColorByType(String type) {
  switch (type) {
    case 'fire':
      return Colors.red;
    case 'water':
      return Colors.blue;
    case 'grass':
      return Colors.green;
    case 'electric':
      return Colors.yellow;
    case 'normal':
      return Colors.brown;
    case 'poison':
      return Colors.purple;
    case 'flying':
      return Colors.deepPurpleAccent;
    case 'bug':
      return Colors.greenAccent;
    case 'ground':
      return Colors.orangeAccent;
    case 'fighting':
      return Colors.pink;
    case 'psychic':
      return Colors.pinkAccent;
    case 'rock':
      return Colors.lime;
    case 'ice':
      return Colors.cyan;
    case 'ghost':
      return Colors.deepPurpleAccent;
    case 'dragon':
      return Colors.purpleAccent;
    default:
      return Colors.grey;
  }
}