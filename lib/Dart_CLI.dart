import 'dart:math';

int random(int max) {
  var rng = Random();
  for (var i = 0; i < 100; i++) {
    return rng.nextInt(max);
  }
}
