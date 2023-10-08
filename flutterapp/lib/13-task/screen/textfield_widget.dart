import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String initialValue;
  final String labelText;
  final bool isAction;
  final VoidCallback? onTap;

  const TextFieldWidget({
    super.key,
    required this.initialValue,
    required this.labelText,
    this.isAction = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        padding: const EdgeInsets.only(left: 20.0),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: TextFormField(
          initialValue: initialValue,
          readOnly: true,
          style: Theme.of(context).textTheme.titleMedium!,
          decoration: InputDecoration(
            labelText: labelText,
            fillColor: Colors.grey,
            focusColor: Colors.grey,
            border: InputBorder.none,
            suffix: isAction
                ? InkWell(
                    onTap: onTap,
                    child: const Padding(
                      padding: EdgeInsets.only(right: 16.0),
                      child: Icon(Icons.chevron_right_outlined),
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
