import 'package:surf_dart_courses/02_task/02_task.dart';

void main() {
  Cabinet myCabinet = Cabinet.my();
  myCabinet.lightTurnOn();
  myCabinet.lightTurnOff();
  print(
    'I have in my cabinet ${myCabinet.chair}, ${myCabinet.lamp}, ${myCabinet.desk}, ${myCabinet.flowers}, ${myCabinet.closet}, etс. ',
  );
}
