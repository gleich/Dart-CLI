import 'dart:convert';
import 'package:args/args.dart';
import 'dart:io';

import 'package:Dart_CLI/Dart_CLI.dart' as Dart_CLI;

void main(List<String> arguments) {
  // Parsing Arguments
  final parser = ArgParser()
    ..addOption('problems', abbr: 'p', defaultsTo: '10')
    ..addOption('type', abbr: 't', defaultsTo: 'all');
  final argResults = parser.parse(arguments);

  // Casting Argument types
  final problemNumbers = int.parse(argResults['problems']);
  var type = argResults['type'].toLowerCase();

  // Checking Problem Types
  if ('a' != type &&
      'm' != type &&
      's' != type &&
      'd' != type &&
      'all' != type) {
    print('Please choose one of the valid problem types:');
    print('\na\nm\ns\nd');
    exit(2);
  }

  // Asking problems
  var correct = 0;
  var timesWrong = 0;
  for (var i = 1; i <= problemNumbers; i++) {
    clearOutput();
    print('Problem: $i/$problemNumbers');
    var num1 = Dart_CLI.random(100);
    var num2 = Dart_CLI.random(100);
    num solution;
    String sign;
    if (type == 'all') {
      var typeChoice = Dart_CLI.random(3);
      switch (typeChoice) {
        case 0:
          {
            type = 'a';
          }
          break;
        case 1:
          {
            type = 'm';
          }
          break;
        case 2:
          {
            type = 's';
          }
          break;
        case 3:
          {
            type = '-';
          }
          break;
      }
    }
    switch (type) {
      case 'a':
        {
          sign = '+';
          solution = num1 + num2;
        }
        break;
      case 'm':
        {
          sign = 'x';
          solution = num1 * num2;
        }
        break;
      case 's':
        {
          sign = '-';
          solution = num1 - num2;
        }
        break;
      case 'd':
        {
          sign = '*';
          while (true) {
            solution = num1 / num2;
            if (solution.runtimeType == 0.0.runtimeType) {
              num1 = Dart_CLI.random(100);
              num2 = Dart_CLI.random(100);
              continue;
            } else {
              break;
            }
          }
        }
        break;
    }
    print('\n$num1 $sign $num2');
    var input = stdin.readLineSync(encoding: Encoding.getByName('utf-8'));
    if (int.parse(input.trim()) == solution) {
      print('😁 Looks like you got the problem right!');
      correct += 1;
    } else {
      print('😟 Looks like you got the problem wrong!');
      timesWrong += 1;
    }
    print('Next problem in 5 seconds');
    sleep(const Duration(seconds: 5));
    clearOutput();
  }
  print('You got $correct correct out of $problemNumbers problems');
  print('YOu got $timesWrong wrong out of $problemNumbers problems');
}

void clearOutput() {
  for (var i = 0; i <= 50; i++) {
    print('\n');
  }
}
