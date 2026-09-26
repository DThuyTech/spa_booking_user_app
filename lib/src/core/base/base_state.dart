import 'package:equatable/equatable.dart';

/// Base state class for BLoC architectures with Equatable value semantics.
abstract class BaseState extends Equatable {
  const BaseState();

  @override
  List<Object?> get props => [];
}
