import 'dart:convert';
import 'dart:math';

import 'classes.dart';
import 'robo_fabric.dart';

void main() {
  func1(name: "ivan", age: 23);
  var a = 1;
  var b = a;
  b = 2;
  print('$a, $b');
  print(MyFriends.ivan.name);
  List friends = MyFriends.values;
  print(friends);
  print(a.compareTo(b));
  print('Ivan' 'df');

  int? e;
  print(e);

  List<int> list1 = [1, 2, 4, 1];
  List<int> list2 = list1;
  list2[1] = 222;
  list1.firstWhere((elem) => elem == 1);
  int sum = list1.fold(0, (i, j) => i + j);
  print('list1: $list1 was sum: $sum');

  list1.forEach(show);
  print('sublist of $list1 is');
  print(list1.sublist(1).sublist(1));
  print(list1.where((elem) => elem > 0).toList());

  List list3 = List.filled(3, null, growable: false);
  print(list3);

  print(getUser('123'));

  User? user;
  print(user?.name);

  Item item = Item();
  print('item name: ${item.name} of $item');

  Person<String> person = Person("IvanPersonName");
  print('person name is ${person.name}');
  assert(2 == 3, "assert 2>=3");
  if (person.name is String) {
    print('no');
  }

  null ?? show(2);

  print(Person('ivan')
    ..name = 'semen'
  );
  printAbs(value: 123);

  print(optionalFn('23123'));
  print(optionalFn());

  int s = sumFn(a: 1, b: 2);
  print(s);

  workingFabric();

  Citizen c = Citizen( 'Ivan', 62);
  print(c.check());

  MaxTeacher mt = MaxTeacher(10,  "teacher name", 'shit');
  mt.playTogether();
  Future<int> rp = mt.check();
  rp.then((result) => print(result));
  print('wait');
}

void func1({required String name, required int age}) {
  print("$name is $age ${Random().nextInt(10)}");
}

enum MyFriends {
  ivan,
  semen,
  bob,
}

void show(int arg) {
  print(arg);
}

void printAbs({required int value}) {
  print(value.abs());
}

int optionalFn([String? strNum]) {
  if (strNum == null) return 0;

  var num = int.parse(strNum);
  if (!num.isNaN) {
    return int.parse(strNum);
  } else {
    return 0;
  }
}

int sumFn({int a = 0, int b = 0}) {
  return a + b;
}

void workingFabric() {
  Fabric fabric = Fabric();
  Robot firstRobot = fabric.createRobot('R2D2');
  firstRobot.start();
}

