class ParameterValueException implements Exception {
  String errorMessage() {
    return 'value of parameter without limits';
  }
}

class ParameterLimitException implements Exception {
  String errorMessage() {
    return 'invalid limit';
  }
}

enum Parameter {
  health,
  mana,
  power,
  armor,
  shield,
}

class CharacterParameter {
  late final Parameter _name;
  int _value = 0;
  int _limitMax = 1;
  int _limitMin = 0;

  CharacterParameter(
      {required Parameter name,
      int value = 0,
      int limitMin = 0,
      int limitMax = 100}) {
    _name = name;
    this.limitMin = limitMin;
    this.limitMax = limitMax;
    this.value = value;
  }

  String get name => _name.name;

  int get value => _value;

  int get limitMin => _limitMin;

  int get limitMax => _limitMax;

  set value(newValue) {
    if (newValue <= _limitMax && newValue >= _limitMin) {
      _value = newValue;
    } else {
      throw ParameterValueException();
    }
  }

  set limitMin(int newLimit) {
    if (_limitMax > newLimit) {
      _limitMin = newLimit;
    } else {
      throw ParameterLimitException();
    }
  }

  set limitMax(int newLimit) {
    if (_limitMin < newLimit) {
      _limitMax = newLimit;
    } else {
      throw ParameterLimitException();
    }
  }

  @override
  String toString() {
    return '$name: $limitMin | $value | $limitMax';
  }
}

class Character {
  late String name = 'no name';
  late CharacterParameter _health;
  late CharacterParameter _mana;
  late CharacterParameter _armor;
  late CharacterParameter _power;

  Character(String characterName) {
    name = characterName;
    CharacterParameter health =
        CharacterParameter(name: Parameter.health, value: 100);
    _health = health;
    CharacterParameter mana =
        CharacterParameter(name: Parameter.mana, value: 100);
    _mana = mana;
    _armor = CharacterParameter(
        name: Parameter.armor, value: 5, limitMin: 0, limitMax: 100);
    _power = CharacterParameter(
        name: Parameter.power, value: 5, limitMin: 0, limitMax: 100);
  }

  CharacterParameter get health => _health;

  CharacterParameter get mana => _mana;

  CharacterParameter get armor => _armor;

  CharacterParameter get power => _power;

  updateHealthOn(int health) {
    int lastHealth = this.health.value + health;
    if (lastHealth > this.health.limitMax) {
      this.health.value = this.health.limitMax;
    } else {
      this.health.value = lastHealth;
    }
  }

  updateManaOn(int mana) {
    int lastMana = this.mana.value + mana;
    if (lastMana > this.mana.limitMax) {
      this.mana.value = this.mana.limitMax;
    } else if (lastMana < this.mana.limitMin) {
      this.mana.value = this.mana.limitMin;
    } else {
      this.mana.value = lastMana;
    }
  }

  updateArmorOn(int armor) {
    int lastArmor = this.armor.value + armor;
    if (lastArmor > this.armor.limitMax) {
      this.armor.value = this.armor.limitMax;
    } else if (lastArmor < this.armor.limitMin) {
      this.armor.value = this.armor.limitMin;
    } else {
      this.armor.value = lastArmor;
    }
  }

  updatePowerOn(int power) {
    int lastPower = this.power.value + power;
    if (lastPower > this.power.limitMax) {
      this.power.value = this.power.limitMax;
    } else if (lastPower < this.power.limitMin) {
      this.power.value = this.power.limitMin;
    } else {
      this.power.value = lastPower;
    }
  }

  int calcIncomingDamage(int damage) {
    return armor.value - damage;
  }

  int calcOutgoingDamage() {
    return power.value;
  }

  void punch(Character enemy) {
    int damage = calcOutgoingDamage();
    damage = enemy.calcIncomingDamage(damage);
    if (damage < 0) {
      updateHealthOn(damage);
    } else {
      updateHealthOn(-1);
    }
  }

  @override
  String toString() {
    return 'name: $name\n$health\n$mana\n$power\n$armor';
  }
}


class Warrior extends Character {
  late CharacterParameter _shield;

  Warrior(characterName) : super(characterName) {
    updatePowerOn(5);
    updateArmorOn(10);
    _shield = CharacterParameter(
      name: Parameter.shield,
      value: armor.value,
      limitMin: armor.limitMin,
      limitMax: armor.limitMax,
    );
  }

  CharacterParameter get shield => _shield;

  updateShield() {
    shield.value = armor.value;
  }

  @override
  int calcIncomingDamage(int damage) {
    return (armor.value + shield.value) - damage;
  }

  @override
  String toString() {
    return '${super.toString()}\n$shield';
  }
}
