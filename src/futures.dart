import 'dart:async';
import 'dart:io';

Future<void> delayPrint({required String str, required int delay}) async {
  Future.delayed(Duration(seconds: delay), () => print(str));
}

void say() async {
  try {
    await delayPrint(str: "str", delay: 2);
  } catch (e) {
    print(e);
  }
}

void printFileText() async {
  File file = File('./src/some_file.txt');
  bool isFileExist = await file.exists();
  if (isFileExist) {
    String text = await file.readAsString();
    print(text);
  }


}
