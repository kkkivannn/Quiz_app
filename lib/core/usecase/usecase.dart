// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import '../error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
