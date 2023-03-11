import 'package:test/test.dart';

import '../src/classes.dart';

void main() {
  test('class Parameter created', () {
    Map<String, dynamic> startData = {
      'name': Parameter.armor,
      'limitMax': 100,
      'limitMin': 0,
      'value': 5
    };
    CharacterParameter param = CharacterParameter(
        name: Parameter.armor,
        value: startData['value'],
        limitMin: startData['limitMin'],
        limitMax: startData['limitMax'],
    );
    expect(param.name, Parameter.armor.name);
    expect(param.limitMax, startData['limitMax']);
    expect(param.limitMin, startData['limitMin']);
    expect(param.value, startData['value']);
  });
}
