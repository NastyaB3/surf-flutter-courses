import 'package:flutter/material.dart';
import 'package:flutterapp/13-task/theme/theme.dart';

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
      child: TextFormField(
        initialValue: initialValue,
        //todo:
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: AppColors.appBarTitleLight,
        ),
        readOnly: true,
        decoration: InputDecoration(
          labelText: labelText,
          suffix: isAction
              ? InkWell(
            onTap: onTap,
            child: const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(
                Icons.chevron_right_outlined,
                color: AppColors.greenLightAndDark,
              ),
            ),
          )
              : null,
        ),
      ),
    );
  }
}
