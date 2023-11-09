part of 'ball_cubit.dart';

sealed class BallState {}

class BallInitial extends BallState {}

class BallLoading extends BallState {}

class BallSuccess extends BallState {
  ResultModel result;

  BallSuccess({required this.result});
}

class BallError extends BallState {
  final String message;

  BallError(this.message);
}
