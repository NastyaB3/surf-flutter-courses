import 'package:flutter/material.dart';

import 'package:flutterapp/11-task/model/products_model.dart';

enum SortType {
  withoutSort,
  alphabetFromA,
  alphabetToA,
  highToLowPrice,
  lowToHighPrice,
  typeFromA,
  typeToA
}

class FilterListScreen extends StatefulWidget {
  final List<ProductEntity> products;

  final SortType sortType;

  const FilterListScreen({
    super.key,
    required this.products,
    required this.sortType,
  });

  @override
  State<FilterListScreen> createState() => _FilterListScreenState();
}

class _FilterListScreenState extends State<FilterListScreen> {
  late SortType sortType = widget.sortType;

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
              padding: const EdgeInsets.only(left: 20.0, top: 24),
              child: Text(
                'Сортировка',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            RadioListTile(
              title: Text(
                'Без сортировки',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              value: SortType.withoutSort,
              groupValue: sortType,
              onChanged: _onSortTypeChanged,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'По имени',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(),
            ),
            RadioListTile(
              title: Text(
                'По имени от А до Я',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              value: SortType.alphabetFromA,
              groupValue: sortType,
              onChanged: _onSortTypeChanged,
            ),
            ListTile(
              title: Text(
                'По имени от Я до А',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              leading: Radio<SortType>(
                value: SortType.alphabetToA,
                groupValue: sortType,
                onChanged: _onSortTypeChanged,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'По цене',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            ListTile(
              title: Text(
                'По возрастанию',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              leading: Radio<SortType>(
                  value: SortType.lowToHighPrice,
                  groupValue: sortType,
                  onChanged: _onSortTypeChanged),
            ),
            ListTile(
              title: Text(
                'По убыванию',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              leading: Radio<SortType>(
                  value: SortType.highToLowPrice,
                  groupValue: sortType,
                  onChanged: _onSortTypeChanged),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'По типу',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            ListTile(
              title: Text(
                'По типу  от А до Я',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              leading: Radio<SortType>(
                  value: SortType.typeFromA,
                  groupValue: sortType,
                  onChanged: _onSortTypeChanged),
            ),
            ListTile(
              title: Text(
                'По типу  от Я до А',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              leading: Radio<SortType>(
                  value: SortType.typeToA,
                  groupValue: sortType,
                  onChanged: _onSortTypeChanged),
            ),
            const SizedBox(
              height: 40,
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
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                        ),
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
