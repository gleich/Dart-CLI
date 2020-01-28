import 'package:Dart_CLI/Dart_CLI.dart' as Dart_CLI;
import 'package:args/args.dart';
import 'dart:io';

void main(List<String> arguments) {
  // Parsing Arguments
  final parser = ArgParser()
    ..addOption('problems', abbr: 'p', defaultsTo: '10')
    ..addOption('type', abbr: 't', defaultsTo: 'all');
  final argResults = parser.parse(arguments);

  // Casting Argument types
  print(argResults['divison']);
  final problemNumbers = int.parse(argResults['problems']);
  var problemType;

  // Setting Problem Types
  switch (argResults['type']) {
    case 'a':
      problemType = 'addition';
      break;
    case 's':
      problemType = 'subtraction';
      break;
    case 'm':
      problemType = 'multiplication';
      break;
    case 'd':
      problemType = 'divison';
      break;
    default:
      clearOutput();
      print('Please choose a valid problem type');
      exit(2);
  }

  // Asking problems
  for (var i = 0; i <= problemNumbers; i++) {
    clearOutput();
    print('Problem: $i/$problemNumbers');
  }
}

void clearOutput() {
  for (var i = 0; i <= 50; i++) {
    print('\n');
  }
}
