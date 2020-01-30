import 'package:Dart_CLI/Dart_CLI.dart';
import 'package:test/test.dart';

void main() {
  test(
    'type of random',
    () {
      expect(random(100).runtimeType, 0.runtimeType);
    },
  );
  test(
    'random max val',
    () {
      expect(random(100) <= 100, true);
    },
  );
}
