import 'package:bloc/bloc.dart';
import 'package:flutterapp/15-task/data/repository/repository.dart';
import 'package:flutterapp/15-task/data/result_model.dart';

part 'ball_state.dart';

class BallCubit extends Cubit<BallState> {
  final BallRepository _repository;

  BallCubit(this._repository) : super(BallInitial());

  Future<void> getAnswer() async {
    emit(BallLoading());
    try {
      Duration duration = const Duration(milliseconds: 300);
      await Future.delayed(duration);
      final res = await _repository.getResultBall();
      emit(
        BallSuccess(
          result: res,
        ),
      );
    } catch (e) {
      BallError(
        e.toString(),
      );
    }
  }
}
