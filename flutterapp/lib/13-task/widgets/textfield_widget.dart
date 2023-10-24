import 'package:flutter/material.dart';
import 'package:flutterapp/13-task/utils/extension_build_context.dart';

class TextFieldWidget extends StatelessWidget {
  final String initialValue;
  final String labelText;
  final bool isAction;
  final VoidCallback? onTap;
  final TextEditingController? controller;

  const TextFieldWidget({
    super.key,
    required this.initialValue,
    required this.labelText,
    this.isAction = false,
    this.onTap,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        initialValue: initialValue,
        controller: controller,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: context.colors.textFieldInitValueColor,
            ),
        readOnly: true,
        decoration: InputDecoration(
          labelText: labelText,
          suffix: isAction
              ? InkWell(
                  onTap: onTap,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Icon(
                      Icons.chevron_right_outlined,
                      color: context.colors.saveColor,
                    ),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
