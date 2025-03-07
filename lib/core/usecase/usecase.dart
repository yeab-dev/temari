import 'package:temari/core/typedef.dart';

abstract class Usecase<T, P> {
  ResultFuture<T> call(P param);
}
