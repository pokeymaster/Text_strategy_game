import 'dart:math';
import 'package:flutter/material.dart';

class MapTile {
  final String type;
  bool hasChest;
  final bool hasEnemy;
  final bool hasClue;
  bool hasNPC;
  String? puzzle;
  int? enemyHP;
  List<String>? chestContents;

  MapTile({
    required this.type,
    this.hasChest = false,
    this.hasEnemy = false,
    this.hasClue = false,
    this.hasNPC = false,
    this.puzzle,
  });

  IconData get icon {
    switch (type) {
      case '大厅':
        return Icons.meeting_room;
      case '客房':
        return Icons.bedroom_parent;
      case '书房':
        return Icons.book;
      case '庭院':
        return Icons.park;
      default:
        return Icons.map;
    }
  }

  Color get color {
    switch (type) {
      case '大厅':
        return Colors.blue;
      case '客房':
        return Colors.green;
      case '书房':
        return Colors.brown;
      case '庭院':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  String toString() {
    return 'MapTile(type: $type, hasChest: $hasChest, hasEnemy: $hasEnemy, hasClue: $hasClue, hasNPC: $hasNPC, puzzle: $puzzle, enemyHP: $enemyHP, chestContents: $chestContents)';
  }
}



class Dungeon {
  final int difficulty;
  final List<MapTile> tiles;

  Dungeon(this.difficulty) : tiles = _generateTiles(difficulty);

  static List<MapTile> _generateTiles(int difficulty) {
    final random = Random();
    final int numOfTiles = 15 + random.nextInt(16); // 15-30 张地图
    final List<MapTile> generatedTiles = [];

    final List<String> tileTypes = ['大厅', '客房', '书房', '庭院'];

    for (int i = 0; i < numOfTiles; i++) {
      final type = tileTypes[random.nextInt(tileTypes.length)];
      final hasChest = random.nextBool();
      final hasEnemy = random.nextBool();
      final hasClue = random.nextBool();
      generatedTiles.add(MapTile(
        type: type,
        hasChest: hasChest,
        hasEnemy: hasEnemy,
        hasClue: hasClue,
      ));
    }

    return generatedTiles;
  }
}
