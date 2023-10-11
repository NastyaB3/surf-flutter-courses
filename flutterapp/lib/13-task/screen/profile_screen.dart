import 'package:flutter/material.dart';
import 'package:flutterapp/13-task/widgets/botton_dialog_widget.dart';
import 'package:flutterapp/13-task/widgets/textfield_widget.dart';
import 'package:flutterapp/13-task/theme/theme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  SortType sortType = SortType.system;

  @override
  Widget build(BuildContext context) {
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
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColors.greenLightAndDark,
                  ),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/ellipse_230.png'),
          const SizedBox(
            height: 24,
          ),
           Text(
            'Мои награды',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.formTextLightAndDark),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '🥇',
                style: TextStyle(fontSize: 32),
              ),
              Text(
                '🥇',
                style: TextStyle(fontSize: 32),
              ),
              Text(
                '🥉',
                style: TextStyle(fontSize: 32),
              ),
              Text(
                '🥈',
                style: TextStyle(fontSize: 32),
              ),
              Text(
                '🥉',
                style: TextStyle(fontSize: 32),
              ),
            ],
          ),
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
          TextFieldWidget(
            initialValue: 'Системная',
            labelText: 'Тема оформления',
            isAction: true,
            onTap: () async {
              final res = await showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return BottomDialogWidget(
                      initialSortType: sortType,
                    );
                  });
              // if (res != null) {
              //   setState(() {
              //     sortType = res;
              //   });
              // }
            },
          ),
          const Spacer(),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 21.0),
            // child: ElevatedButton(
            //   onPressed: () {},
            //   child: const Text(
            //     'Log out',
            //   ),
            // ),
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
