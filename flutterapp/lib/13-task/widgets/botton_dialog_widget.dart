import 'package:flutter/material.dart';
import 'package:flutterapp/13-task/utils/extension_build_context.dart';
import 'package:flutterapp/13-task/utils/images.dart';
import 'package:flutterapp/13-task/utils/theme_notif.dart';
import 'package:flutterapp/13-task/widgets/radio_element_widget.dart';
import 'package:provider/provider.dart';

enum ThemeType {
  system,
  light,
  lightOrange,
  lightBlue,
  dark,
  darkOrange,
  darkBlue,
}

class BottomDialogWidget extends StatefulWidget {
  final ThemeType initThemeType;

  const BottomDialogWidget({
    super.key,
    required this.initThemeType,
  });

  @override
  State<BottomDialogWidget> createState() => _BottomDialogWidgetState();
}

class _BottomDialogWidgetState extends State<BottomDialogWidget> {
  late ThemeType themeType = widget.initThemeType;

  void _onSortTypeChanged(ThemeType? value) {
    setState(() {
      themeType = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final TextStyle bodyMediumStyle = textTheme.bodyMedium!
        .copyWith(color: context.colors.textFieldInitValueColor);
    return Wrap(
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 24, right: 26),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Тема оформления',
                    style: textTheme.labelLarge!.copyWith(
                        color: context.colors.textFieldInitValueColor),
                  ),
                  InkWell(
                    child: Icon(
                      Icons.close,
                      color: context.colors.saveColor,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            RadioListTile(
              title: Text(
                'Системная',
                style: bodyMediumStyle,
              ),
              value: ThemeType.system,
              groupValue: themeType,
              onChanged: _onSortTypeChanged,
            ),
            RadioListTile(
              title: Text(
                'Светлая',
                style: bodyMediumStyle,
              ),
              value: ThemeType.light,
              groupValue: themeType,
              onChanged: _onSortTypeChanged,
            ),
            if (themeType == ThemeType.light ||
                themeType == ThemeType.lightOrange ||
                themeType == ThemeType.lightBlue)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RadioElementWidget(
                    image: Images.iconGreen,
                    text: 'Схема 1',
                    isSelected: themeType == ThemeType.light,
                    onTap: () {
                      _onSortTypeChanged(ThemeType.light);
                    },
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  RadioElementWidget(
                    image: Images.iconBlue,
                    text: 'Схема 2',
                    isSelected: themeType == ThemeType.lightBlue,
                    onTap: () {
                      _onSortTypeChanged(ThemeType.lightBlue);
                    },
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  RadioElementWidget(
                    image: Images.iconOrange,
                    text: 'Схема 3',
                    isSelected: themeType == ThemeType.lightOrange,
                    onTap: () {
                      _onSortTypeChanged(ThemeType.lightOrange);
                    },
                  ),
                ],
              ),
            RadioListTile(
              title: Text(
                'Темная',
                style: bodyMediumStyle,
              ),
              value: ThemeType.dark,
              groupValue: themeType,
              onChanged: _onSortTypeChanged,
            ),
            if (themeType == ThemeType.dark ||
                themeType == ThemeType.darkOrange ||
                themeType == ThemeType.darkBlue)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RadioElementWidget(
                    image: Images.iconGreen,
                    text: 'Схема 1',
                    isSelected: themeType == ThemeType.dark,
                    onTap: () {
                      _onSortTypeChanged(ThemeType.dark);
                    },
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  RadioElementWidget(
                    image: Images.iconBlue,
                    text: 'Схема 2',
                    isSelected: themeType == ThemeType.darkBlue,
                    onTap: () {
                      _onSortTypeChanged(ThemeType.darkBlue);
                    },
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  RadioElementWidget(
                    image: Images.iconOrange,
                    text: 'Схема 3',
                    isSelected: themeType == ThemeType.darkOrange,
                    onTap: () {
                      _onSortTypeChanged(ThemeType.darkOrange);
                    },
                  ),
                ],
              ),
            const SizedBox(
              height: 25,
            ),
            Consumer<ThemeNotifier>(
              builder: (context, ThemeNotifier themeNotifier, child) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    width: 335,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(
                          context,
                          themeType,
                        );
                        themeNotifier.setTheme(themeType);
                      },
                      child: const Text(
                        'Готово',
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ],
    );
  }
}
