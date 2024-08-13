class CharacterStatus {
  int sanValue;
  int hpValue;
  String skill;  // 添加技能属性

  CharacterStatus({
    required this.sanValue,
    required this.hpValue,
    required this.skill,  // 添加到构造函数中
  });

  void reduceSan(int amount) {
    sanValue = (sanValue - amount).clamp(0, 100);
  }

  void reduceHP(int amount) {
    hpValue = (hpValue - amount).clamp(0, 100);
  }

  void recoverSan(int amount) {
    sanValue = (sanValue + amount).clamp(0, 100);
  }

  void recoverHP(int amount) {
    hpValue = (hpValue + amount).clamp(0, 100);
  }

  bool isAlive() {
    return hpValue > 0;
  }
}
