class User {
  String? name;
  User(String userName) {
    name = userName;
  }

  @override
  String toString() {
    assert(name != null);
    return name!;
  }
}

User getUser(String name) {
  return User(name);
}

class Item {
  String? name;
}

/// name { String } - person name
class Person<T> {
  String name = '';
  Person(T option) {
    if (option is String) {
      name = option;
    } else if (option is int) {
      name = option.toString();
    } else {
      name = 'wrong name';
    }
  }

  String check() {
    return '';
  }
}

class Teacher {
  String name;
  String subject;

  Teacher(this.name, this.subject);
  Teacher.custom(this.name, this.subject);
}

class MaxTeacher extends Teacher with Parents, Friend {
  int count = 0;

  MaxTeacher(int count, String name, String subject) : super(name, subject);

}

class Citizen extends Person {
  String name;
  int age;
  static const int ageBorder = 65;

  Citizen(this.name, this.age) : super(null);

  @override
  String check() {
    int result = Citizen.ageBorder - age;
    if (result.isNegative) {
      return 'На пенсии уже ${result.abs()} лет';
    } else {
      return 'До пенсии: ${result.abs()} лет';
    }
  }
}

mixin Friend {
  int status = 0;
  playTogether() {
    print('friends playing');
  }
}

mixin Parents {
  playTogether() {
    print('parents playing');
  }

  check() {
    return Future.delayed(Duration(seconds: 3),() => 32);
  }
}