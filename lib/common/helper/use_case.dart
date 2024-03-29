import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future<Type> call(Params param);
}

abstract class UseCaseF<Type, Params> {
  Type call(Params param);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
