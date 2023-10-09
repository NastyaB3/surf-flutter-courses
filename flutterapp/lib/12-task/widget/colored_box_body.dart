import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/12-task/screens/color_info_screen.dart';
import 'package:flutterapp/12-task/cubit/colored_box_cubit.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/12-task/widget/convert_color.dart';

class ColoredBoxBody extends StatefulWidget {
  const ColoredBoxBody({super.key});

  @override
  State<ColoredBoxBody> createState() => _ColoredBoxBodyState();
}

class _ColoredBoxBodyState extends State<ColoredBoxBody> {
  @override
  void initState() {
    super.initState();
    context.read<ColoredBoxCubit>().getColoredBox();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColoredBoxCubit, ColoredBoxState>(
        builder: (context, state) {
      switch (state.runtimeType) {
        case ColoredBoxSuccess:
          final successState = state as ColoredBoxSuccess;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.7,
              ),
              itemCount: successState.colorData.length,
              itemBuilder: (context, index) {
                final color = successState.colorData[index];
                final Color colorValue = color.value != null
                    ? hexToColor(color.value!)
                    : Colors.white;
                if (color.value == null) {
                  return Container();
                }
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ColorInfoScreen(
                                name: color.name,
                                colorValue: colorValue,
                                colorName: color.value!,
                              )),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: color.value!,
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: colorValue,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        color.name,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      InkWell(
                        onLongPress: () async {
                          Clipboard.setData(ClipboardData(text: color.value!))
                              .then((_) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Hex скопирован")));
                          });
                        },
                        child: Text(color.value!,
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        case ColoredBoxLoading:
          return const Center(child: CircularProgressIndicator());
        case ColoredBoxError:
          final errorState = state as ColoredBoxError;
          return Text(errorState.message);
      }
      return Container();
    });
  }
}
