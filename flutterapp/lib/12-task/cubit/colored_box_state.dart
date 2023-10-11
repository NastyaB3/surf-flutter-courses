part of 'colored_box_cubit.dart';


sealed class ColoredBoxState {}

class ColoredBoxInitial extends ColoredBoxState {}

class ColoredBoxLoading extends ColoredBoxState {}

class ColoredBoxSuccess extends ColoredBoxState {
  final List<ColorData> colorData;

  ColoredBoxSuccess(this.colorData);
}

class ColoredBoxError extends ColoredBoxState {
  final String message;

  ColoredBoxError(this.message);
}
