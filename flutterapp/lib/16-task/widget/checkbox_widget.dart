import 'package:flutter/material.dart';
import 'package:flutterapp/16-task/widget/text_field_widget.dart';

class CheckboxWidget extends StatelessWidget {
  final bool value;
  final String text;
  final ValueChanged<bool?>? onChanged;
  final VoidCallback? onTapTextField;
  final TextEditingController? controllerTextField;

  const CheckboxWidget({
    super.key,
    required this.value,
    required this.text,
    this.onChanged,
    this.onTapTextField,
    this.controllerTextField,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              activeColor: Theme.of(context).colorScheme.secondary,
              fillColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.focused) ||
                    states.contains(MaterialState.selected) ||
                    states.contains(MaterialState.pressed)) {
                  return Theme.of(context).colorScheme.secondaryContainer;
                } else {
                  return Theme.of(context).colorScheme.primaryContainer;
                }
              }),
              checkColor: Theme.of(context).colorScheme.primaryContainer,
              value: value,
              onChanged: onChanged,
            ),
            Text(text),
          ],
        ),
        if (value == true)
          TextFieldWidget(
            labelText: 'Дата последней прививки',
            onTap: onTapTextField,
            controller: controllerTextField,
          ),
      ],
    );
  }
}
