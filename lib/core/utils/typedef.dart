import 'package:dartz/dartz.dart';
import 'package:edu_app/core/errors/failiure.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;

typedef DataMap = Map<String, dynamic>;
