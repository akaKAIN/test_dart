import 'package:test/test.dart';

import '../src/main.dart';

List<int> defaultArgs = [0 , 0];

class TestCase {
  late List<int> args;
  late int expect;
  late int result;

  TestCase({required this.args, required this.expect});
}

void main() {
  test('testing sum func', () {
    List<TestCase> testCases = [
      TestCase(args: [1, 2], expect: 3),
      TestCase(args: [2, 10], expect: 12),
      TestCase(args: [0, 0], expect: 0),
      TestCase(args: [-11, 0], expect: -11),
    ];

    for (var tc in testCases) {
      expect(sumFn(a: tc.args[0], b: tc.args[1]), (tc.expect));
    }
  });
}