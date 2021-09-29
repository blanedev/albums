import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

@injectableInit
final getIt = GetIt.instance;

void configureInjection() {
  $initGetIt(getIt);
}