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
  final type = argResults['type'].toLowerCase();

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
  for (var i = 0; i <= problemNumbers; i++) {
    clearOutput();
    print('Problem: $i/$problemNumbers');
    var num1 = Dart_CLI.random();
    var num2 = Dart_CLI.random();
    switch (type) {
      case 'a':
        {
          var solution = num1 + num2;
          print('What is $num1 + $num2');
          var line = stdin.readLineSync(encoding: Encoding.getByName('utf-8'));
          if (line.trim().toString() == solution) {
            print('😁 Looks like you got the problem right!');
            correct += 1;
          }
        }
    }
  }
}

void clearOutput() {
  for (var i = 0; i <= 50; i++) {
    print('\n');
  }
}
