class Fabric {
  int quantity = 0;
  Robot createRobot(String model) {
    Robot robot = Robot(model);
    quantity++;
    return robot;
  }
}

class Robot {
  String? model;

  Robot(String robotModel) {
    model = robotModel;
  }

  void start() {
    print('$model was started');
  }
}