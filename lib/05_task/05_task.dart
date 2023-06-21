abstract class Person {
  String get name;

  int get age;

  void printInformation();
}

class Sportsmen extends Person {
  final String weightCategory;
  final int numberOfFights;
  final int numberOfWon;

  Sportsmen(
    this.weightCategory,
    this.numberOfFights,
    this.numberOfWon,
  );

  @override
  String get name => "Muhammad";

  @override
  int get age => 74;

  @override
  void printInformation() {
    print(
        'Sportsmen ${name}, ${age} years old from ${weightCategory} weight category had ${numberOfFights} fights and ${numberOfWon} of them won');
  }
}

class Trainer extends Person {
  final String boxingTechnique;

  Trainer(
    this.boxingTechnique,
  );

  @override
  String get name => 'Angelo';

  @override
  int get age => 90;

  @override
  void printInformation() {
    print(
        'Sportsmen ${name}, ${age} years old had ${boxingTechnique} boxing technique');
  }
}
