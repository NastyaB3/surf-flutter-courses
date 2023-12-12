String? emailValidate(value) {
  const pattern = r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  final regex = RegExp(pattern);
  return value!.isNotEmpty && !regex.hasMatch(value) ? 'Введите email' : null;
}
