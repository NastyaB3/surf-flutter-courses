import 'package:bloc/bloc.dart';
import 'package:flutterapp/16-task/screens/registration_screen.dart';

class SetCheckboxCubit extends Cubit<List<Vaccine>> {
  SetCheckboxCubit() : super([]);

  void setVaccine(Vaccine vaccine) {
    if (state.contains(vaccine)) {
      emit(List.from(state)..remove(vaccine));
    } else {
      emit(List.from(state)..add(vaccine));
    }
  }
}
