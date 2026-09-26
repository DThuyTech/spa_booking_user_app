import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/logging/app_logger.dart';

class AppBlocObserver extends BlocObserver {
  final Logger _logger;

  const AppBlocObserver(this._logger);

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    _logger.debug('${bloc.runtimeType} event: $event');
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    _logger.debug('${bloc.runtimeType} transition: $transition');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    _logger.error('${bloc.runtimeType} error: $error', error, stackTrace);
    super.onError(bloc, error, stackTrace);
  }
}
