// lib/core/service_locator.dart
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'service_locator.config.dart';

final di = GetIt.I;

@InjectableInit()
Future<void> configureDependencies() async => di.init();
// Package imports:
