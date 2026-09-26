import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

Future<void> resetDependencies() async {
  await sl.reset();
}
