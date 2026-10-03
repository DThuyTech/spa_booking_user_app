import 'package:equatable/equatable.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class ProfileStarted extends ProfileEvent {
  const ProfileStarted();
}

class ProfileRefreshed extends ProfileEvent {
  const ProfileRefreshed();
}

class ProfileLogoutRequested extends ProfileEvent {
  const ProfileLogoutRequested();
}
