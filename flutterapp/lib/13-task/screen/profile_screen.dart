import 'package:flutter/material.dart';
import 'package:flutterapp/13-task/widgets/get_theme.dart';
import 'package:flutterapp/13-task/utils/extension_build_context.dart';
import 'package:flutterapp/13-task/utils/images.dart';
import 'package:flutterapp/13-task/utils/theme_notif.dart';
import 'package:flutterapp/13-task/widgets/botton_dialog_widget.dart';
import 'package:flutterapp/13-task/widgets/medal_widget.dart';
import 'package:flutterapp/13-task/widgets/textfield_widget.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final TextStyle? titleMedium = Theme.of(context).textTheme.titleMedium;
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Center(
          child: Text('Профиль'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Text(
              'Save',
              style: titleMedium!.copyWith(
                color: context.colors.saveColor,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Images.avatar),
          const SizedBox(
            height: 24,
          ),
          Text(
            'Мои награды',
            style: titleMedium.copyWith(
              color: context.colors.secondaryTextColor,
            ),
          ),
          const MedalWidget(),
          const SizedBox(
            height: 24,
          ),
          const TextFieldWidget(
            initialValue: 'Маркус Хассельбор',
            labelText: 'Имя',
          ),
          const SizedBox(
            height: 8,
          ),
          const TextFieldWidget(
            initialValue: 'MarkusHSS@gmail.com',
            labelText: 'Email',
          ),
          const SizedBox(
            height: 8,
          ),
          const TextFieldWidget(
            initialValue: '03.03.1986',
            labelText: 'Дата рождения',
          ),
          const SizedBox(
            height: 8,
          ),
          const TextFieldWidget(
            initialValue: 'Сборная Швеции',
            labelText: 'Команда',
            isAction: true,
          ),
          const SizedBox(
            height: 8,
          ),
          const TextFieldWidget(
            initialValue: 'Скип',
            labelText: 'Позиция',
            isAction: true,
          ),
          const SizedBox(
            height: 8,
          ),
          Consumer<ThemeNotifier>(
            builder: (context, ThemeNotifier themeNotifier, child) {
              return TextFieldWidget(
                initialValue: getThemeName(themeNotifier.theme),
                key: ValueKey(themeNotifier.theme),
                labelText: 'Тема оформления',
                isAction: true,
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return BottomDialogWidget(
                          initThemeType: themeNotifier.theme,
                        );
                      });
                },
              );
            },
          ),
          const Spacer(),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 21.0),
            child: OutlinedButton(
              onPressed: () {},
              child: const Text(
                'Log out',
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
