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

  String get name     => _name.name;
  int    get value    => _value;
  int    get limitMin => _limitMin;
  int    get limitMax => _limitMax;

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

  Character(String characterName) {
    name = characterName;
    CharacterParameter health =
        CharacterParameter(name: Parameter.health, value: 100);
    _health = health;
    CharacterParameter mana =
        CharacterParameter(name: Parameter.mana, value: 100);
    _mana = mana;
  }

  CharacterParameter get health {
    return _health;
  }

  CharacterParameter get mana {
    return _mana;
  }

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

  @override
  String toString() {
    return 'name: $name\n$health\n$mana';
  }

}
