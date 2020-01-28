import 'dart:math';

int random() {
  var rng = Random();
  for (var i = 0; i < 10; i++) {
    return rng.nextInt(100);
  }
}
