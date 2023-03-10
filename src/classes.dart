import 'exeptions.dart';

enum Parameter {
  health,
  mana,
  power,
  armor,
}

class CharacterParameter {
  Parameter _name;
  int _value;
  int _limitMax;
  int _limitMin;

  CharacterParameter(this._name, this._value, this._limitMin, this._limitMax);

  String get name => _name.name;

  int get value => _value;

  int get limitMax => _limitMax;

  int get limitMin => _limitMin;

  void setName(Parameter newName) {
    _name = newName;
  }

  void setLimitMax(int newLimit) {
    if (_limitMin < newLimit) {
      _limitMax = newLimit;
    } else {
      throw ParameterLimitException();
    }
  }

  void setLimitMin(int newLimit) {
    if (_limitMax > newLimit) {
      _limitMin = newLimit;
    } else {
      throw ParameterLimitException();
    }
  }

  setValue(int value) {
    if (value <= _limitMax && value >= _limitMin) {
      _value = value;
    } else {
      throw ParameterValueException();
    }
  }
}

class Character {
  String name = 'no name';
  int _health = 100;
  int _mana = 100;
  int _power = 15;
  int _armor = 10;

  Character(this.name);

  int get health {
    return _health;
  }

  int get mana {
    return _mana;
  }

  int get power {
    return _power;
  }

  int get armor {
    return _armor;
  }

  punch(Character enemy) {
    int damage = power - enemy.armor;
  }

  healthUpOn(int health)

}
