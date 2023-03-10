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