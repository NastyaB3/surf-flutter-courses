import 'package:flutter/material.dart';
import 'package:flutterapp/13-task/theme/theme.dart';

enum SortType {
  system,
  light,
  dark,
}

class BottomDialogWidget extends StatefulWidget {
  final SortType initialSortType;

  const BottomDialogWidget({super.key, required this.initialSortType});

  @override
  State<BottomDialogWidget> createState() => _BottomDialogWidgetState();
}

class _BottomDialogWidgetState extends State<BottomDialogWidget> {
  late SortType sortType;

  @override
  void initState() {
    super.initState();
    sortType = widget.initialSortType;
  }

  void _onSortTypeChanged(SortType? value) {
    setState(() {
      sortType = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  InkWell(
                    child: const Icon(
                      Icons.close,
                      color: AppColors.greenLightAndDark,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            RadioListTile(
              title: const Text(
                'Системная',
              ),
              value: SortType.system,
              groupValue: sortType,
              onChanged: _onSortTypeChanged,
            ),
            RadioListTile(
              title: const Text(
                'Светлая',
              ),
              value: SortType.light,
              groupValue: sortType,
              onChanged: _onSortTypeChanged,
            ),
            RadioListTile(
              title: const Text(
                'Темная',
              ),
              value: SortType.dark,
              groupValue: sortType,
              onChanged: _onSortTypeChanged,
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: 335,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                      sortType,
                    );
                  },
                  child: const Text(
                    'Готово',
                  ),
                ),
              ),
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
