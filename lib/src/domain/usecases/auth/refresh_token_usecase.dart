import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../../core/network/auth/token_pair.dart';
import '../../repositories/auth/auth_repository.dart';

class RefreshTokenUseCase {
  final AuthRepository _repository;

  const RefreshTokenUseCase(this._repository);

  Future<Either<Failure, TokenPair>> call(String refreshToken) {
    return _repository.refreshToken(refreshToken);
  }
}
