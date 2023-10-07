import 'package:bloc/bloc.dart';
import 'package:flutterapp/12-task/data/model/colors_list.dart';
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
      final ColorsList colorData = await _repository.getColors();
      final filteredColors = colorData.colors.where((color) => color.value != null).toList();
      final filteredColorData = ColorsList(colors: filteredColors);
      emit(ColoredBoxSuccess(filteredColorData));
    } catch (e) {
      emit(
        ColoredBoxError(
          e.toString(),
        ),
      );
    }
  }
}
