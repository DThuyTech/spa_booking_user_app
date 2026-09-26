import 'package:uuid/uuid.dart';

abstract interface class IdempotencyKeyStore {
  String generateKey([String? prefix]);
}

class UuidIdempotencyKeyStore implements IdempotencyKeyStore {
  final Uuid _uuid;

  const UuidIdempotencyKeyStore([Uuid? uuid]) : _uuid = uuid ?? const Uuid();

  @override
  String generateKey([String? prefix]) {
    final key = _uuid.v4();
    if (prefix != null && prefix.isNotEmpty) {
      return '$prefix-$key';
    }
    return key;
  }
}
