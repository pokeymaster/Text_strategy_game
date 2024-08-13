import 'package:flutter/material.dart';

class CharacterSelectionScreen extends StatelessWidget {
  final List<Map<String, dynamic>> characters = [
    {
      'name': '战士',
      'strength': 8,
      'agility': 5,
      'knowledge': 3,
      'sanity': 4,
      'skill': '强力攻击'
    },
    {
      'name': '盗贼',
      'strength': 5,
      'agility': 8,
      'knowledge': 5,
      'sanity': 3,
      'skill': '额外移动'
    },
    {
      'name': '法师',
      'strength': 3,
      'agility': 4,
      'knowledge': 8,
      'sanity': 5,
      'skill': '法术攻击'
    },
    {
      'name': '僧侣',
      'strength': 4,
      'agility': 3,
      'knowledge': 5,
      'sanity': 8,
      'skill': '恢复法术'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('选择角色'),
      ),
      body: ListView.builder(
        itemCount: characters.length,
        itemBuilder: (context, index) {
          final character = characters[index];
          return Card(
            child: ListTile(
              title: Text(character['name']),
              subtitle: Text(
                  '力量: ${character['strength']}, 敏捷: ${character['agility']}, 知识: ${character['knowledge']}, 理智: ${character['sanity']}'),
              trailing: Text('技能: ${character['skill']}'),
              onTap: () {
                Navigator.pop(context, character);
              },
            ),
          );
        },
      ),
    );
  }
}
