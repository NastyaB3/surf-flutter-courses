import 'package:bloc/bloc.dart';
import 'package:flutterapp/12-task/data/model/color_data.dart';
import 'package:flutterapp/12-task/data/repository/repository_colored_box.dart';
import 'package:meta/meta.dart';

part 'colored_box_state.dart';

class ColoredBoxCubit extends Cubit<ColoredBoxState> {
  final ColoredBoxRepository _repository;

  ColoredBoxCubit(
    this._repository,
  ) : super(ColoredBoxInitial());

  Future<void> getColoredBox() async {
    emit(ColoredBoxLoading());
    try {
      final List<ColorData> colorData = await _repository.getColors();
      final filteredColors =
          colorData.where((color) => color.value != null).toList();
      emit(ColoredBoxSuccess(filteredColors));
    } catch (e) {
      emit(
        ColoredBoxError(
          e.toString(),
        ),
      );
    }
  }
}
