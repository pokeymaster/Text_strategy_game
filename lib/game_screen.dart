import 'dart:math';
import 'package:flutter/material.dart';
import 'dungeon.dart';
import 'character_status.dart';

class GameScreen extends StatefulWidget {
  final Dungeon dungeon;

  GameScreen({required this.dungeon});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int currentTileIndex = 0;
  CharacterStatus characterStatus = CharacterStatus(sanValue: 100, hpValue: 100, skill: '强力攻击');

  void moveToNextTile() {
    setState(() {
      if (currentTileIndex < widget.dungeon.tiles.length - 1) {
        currentTileIndex++;
      } else {
        print('你已经探索完所有地图');
      }
    });
  }

  void rollDice() {
    final random = Random();
    final result = random.nextInt(6) + 1;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('掷骰子结果'),
          content: Text('你掷出了 $result 点数'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('确定'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentTile = widget.dungeon.tiles[currentTileIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('探索副本'),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '当前位置: ${currentTile.type}',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 10),
                Text('SAN值: ${characterStatus.sanValue}, HP值: ${characterStatus.hpValue}', style: TextStyle(fontSize: 18)),
                SizedBox(height: 10),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                    ),
                    itemCount: widget.dungeon.tiles.length,
                    itemBuilder: (context, index) {
                      final tile = widget.dungeon.tiles[index];
                      return Container(
                        margin: EdgeInsets.all(4.0),
                        color: index == currentTileIndex ? Colors.yellow : tile.color,
                        child: Center(
                          child: Icon(tile.icon, color: Colors.white),
                        ),
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: moveToNextTile,
                  child: Text('移动到下一个地图'),
                ),
                ElevatedButton(
                  onPressed: rollDice,
                  child: Text('掷骰子'),
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Column(
              children: [
                Text('HP: ${characterStatus.hpValue}'),
                Text('SAN: ${characterStatus.sanValue}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
