import 'package:flutter/material.dart';
import 'character_selection_screen.dart';
import 'dungeon.dart';
import 'game_screen.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Adventure Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                final selectedCharacter = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CharacterSelectionScreen()),
                );

                if (selectedCharacter != null) {
                  // 根据难度生成副本
                  int difficulty = 1; // 这里可以设置默认难度，稍后实现难度选择
                  Dungeon dungeon = Dungeon(difficulty);
                  print('生成的副本:');
                  dungeon.tiles.forEach((tile) {
                    print(tile);
                  });

                  // 导航到游戏界面
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            GameScreen(dungeon: dungeon)),
                  );
                }
              },
              child: Text('开始游戏'),
            ),
            ElevatedButton(
              onPressed: () {
                // 这里可以添加选择难度的逻辑
              },
              child: Text('选择难度'),
            ),
            ElevatedButton(
              onPressed: () {
                // 这里可以添加设置的逻辑
              },
              child: Text('设置'),
            ),
            ElevatedButton(
              onPressed: () {
                // 退出游戏
                Navigator.of(context).pop();
              },
              child: Text('退出游戏'),
            ),
          ],
        ),
      ),
    );
  }
}
