import 'package:flutter/material.dart';

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
                    child: const Icon(Icons.close),
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
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              value: SortType.system,
              groupValue: sortType,
              onChanged: _onSortTypeChanged,
            ),
            RadioListTile(
              title: Text(
                'Светлая',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              value: SortType.light,
              groupValue: sortType,
              onChanged: _onSortTypeChanged,
            ),
            RadioListTile(
              title: Text(
                'Темная',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              value: SortType.dark,
              groupValue: sortType,
              onChanged: _onSortTypeChanged,
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
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Готово',
                    style: Theme.of(context).textTheme.bodyMedium,
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
