import 'package:bloc/bloc.dart';
import 'package:flutterapp/16-task/screens/registration_screen.dart';

class SetPetCubit extends Cubit<Pet> {
  SetPetCubit() : super(Pet.dog);

  void setPet(Pet pet) {
    emit(pet);
  }
}
