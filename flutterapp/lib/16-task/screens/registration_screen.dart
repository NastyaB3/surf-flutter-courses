import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/16-task/cubit/set_checkbox_cubit.dart';
import 'package:flutterapp/16-task/cubit/set_pet_cubit.dart';
import 'package:flutterapp/16-task/data/form_data.dart';
import 'package:flutterapp/16-task/widget/button_widget.dart';
import 'package:flutterapp/16-task/widget/custom_date_picker.dart';
import 'package:flutterapp/16-task/utils/email_validator.dart';
import 'package:flutterapp/16-task/widget/checkbox_widget.dart';
import 'package:flutterapp/16-task/widget/icon_widget.dart';
import 'package:flutterapp/16-task/widget/text_field_widget.dart';
import 'package:intl/intl.dart';
import '../utils/images.dart';

enum Vaccine {
  rabies,
  covid,
  malaria,
}

enum Pet {
  dog,
  cat,
  parrot,
  hamster,
}

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  SetPetCubit get _registrationActiveCubit =>
      BlocProvider.of<SetPetCubit>(context);

  SetCheckboxCubit get _checkboxCubit =>
      BlocProvider.of<SetCheckboxCubit>(context);
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  final _controllerName = TextEditingController();
  final _controllerDate = TextEditingController();
  final _controllerWeight = TextEditingController();
  final _controllerEmail = TextEditingController();

  final Map<Vaccine, TextEditingController> _controllers = {
    Vaccine.rabies: TextEditingController(),
    Vaccine.covid: TextEditingController(),
    Vaccine.malaria: TextEditingController(),
  };

  @override
  void dispose() {
    _controllerName.dispose();
    _controllerDate.dispose();
    _controllerWeight.dispose();
    _controllerEmail.dispose();
    _controllers.forEach((vaccine, controller) {
      controller.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<SetPetCubit, Pet>(
            builder: (context, state) {
              return Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 16,
                        ),
                        for (final pet in Pet.values)
                          Padding(
                            padding: const EdgeInsets.only(right: 18.0),
                            child: CustomIcon(
                              image: getImage(pet),
                              onTap: () {
                                _registrationActiveCubit.setPet(pet);
                                _controllerName.clear();
                                _controllerDate.clear();
                                _controllerWeight.clear();
                                _controllerEmail.clear();
                                _controllers.forEach((vaccine, controller) {
                                  controller.clear();
                                });
                              },
                              isActive: state == pet,
                              text: getPet(pet),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFieldWidget(
                      labelText: 'Имя питомца',
                      controller: _controllerName,
                      validator: (value) {
                        if ((_controllerName.text.length < 3 ||
                            _controllerName.text.length > 20)) {
                          return 'Укажите имя питомца от 3 до 20 символов';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFieldWidget(
                      labelText: 'День рождения питомца',
                      controller: _controllerDate,
                      keyboardType: TextInputType.datetime,
                      onTap: () async {
                        DateTime? pickedDate = await customDatePicker(
                          context: context,
                        );
                        if (pickedDate != null) {
                          _controllerDate.text =
                              DateFormat('dd.MM.yyyy').format(pickedDate);
                        }
                      },
                      validator: (value) {
                        if (_controllerDate.text.isEmpty) {
                          return 'Укажите дату дд/мм/гггг';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFieldWidget(
                      controller: _controllerWeight,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      validator: (value) {
                        if (_controllerWeight.text.isEmpty ||
                            int.parse(_controllerWeight.text) < 1) {
                          return 'Укажите вес, больше 0 кг';
                        }
                        return null;
                      },
                      labelText: 'Вес, кг',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFieldWidget(
                      controller: _controllerEmail,
                      labelText: 'Почта хозяина',
                      validator: emailValidate,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    BlocBuilder<SetPetCubit, Pet>(
                      builder: (context, state) {
                        if (state != Pet.hamster && state != Pet.parrot) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Text(
                                  'Сделаны прививки от:',
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              for (final vaccine in Vaccine.values)
                                BlocBuilder<SetCheckboxCubit, List<Vaccine>>(
                                  builder: (context, state) {
                                    return CheckboxWidget(
                                      text: getCheckboxText(vaccine),
                                      value: state.contains(vaccine),
                                      onChanged: (value) {
                                        _checkboxCubit.setVaccine(vaccine);
                                      },
                                      onTapTextField: () async {
                                        DateTime? pickedDate =
                                            await customDatePicker(
                                          context: context,
                                        );
                                        if (pickedDate != null) {
                                          _controllers[vaccine]!.text =
                                              DateFormat('dd.MM.yyyy')
                                                  .format(pickedDate);
                                        }
                                      },
                                      controllerTextField:
                                          _controllers[vaccine],
                                    );
                                  },
                                ),
                              const SizedBox(
                                height: 32,
                              ),
                            ],
                          );
                        }
                        return Container();
                      },
                    ),
                    ButtonWidget(
                      onPressed: () {
                        setState(() {
                          _isLoading = true;
                        });
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Success'),
                            ),
                          );
                        }
                        Timer.periodic(const Duration(seconds: 2), (timer) {
                          setState(() {
                            _isLoading = false;
                          });
                        });
                        final FormData formData = FormData(
                          pet: state,
                          dateBirth: _controllerDate.text,
                          email: _controllerEmail.text,
                          vaccines: _checkboxCubit.state,
                          name: _controllerName.text,
                          weight: int.parse(
                            _controllerWeight.text,
                          ),
                        );
                        print(formData);
                      },
                      isLoading: _isLoading ? true : false,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  String getCheckboxText(
    Vaccine vaccine,
  ) {
    switch (vaccine) {
      case Vaccine.rabies:
        return 'бешенства';
      case Vaccine.covid:
        return 'коронавируса';
      case Vaccine.malaria:
        return 'малярии';
      default:
        return '';
    }
  }

  String getPet(Pet pet) {
    switch (pet) {
      case Pet.dog:
        return 'Собака';
      case Pet.cat:
        return 'Кошка';
      case Pet.parrot:
        return 'Попугай';
      case Pet.hamster:
        return 'Хомяк';
      default:
        return '';
    }
  }

  String getImage(Pet pet) {
    switch (pet) {
      case Pet.dog:
        return Images.iconDog;
      case Pet.cat:
        return Images.iconCat;
      case Pet.parrot:
        return Images.iconParrot;
      case Pet.hamster:
        return Images.iconHamster;
      default:
        return '';
    }
  }
}
