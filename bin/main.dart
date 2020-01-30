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
  final problemNumbers = int.parse(argResults['problems']);
  final type = argResults['type'].toLowerCase();

  // Setting Problem Types
  if ('a' != type && 'm' != type && 's' != type && 'd' != type) {
    print('Please choose one of the valid problem types:');
    print('\na\nm\ns\nd');
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
