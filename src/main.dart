import 'dart:math';
import 'classes.dart';
import 'robo_fabric.dart';

void main() {
  Character character = Character('Bob');
  print(character);
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

