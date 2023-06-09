class Cabinet {
  String desk;
  String chair;
  Laptop laptop;
  List<String> _documents;
  String? flowers;
  String lamp;
  String? closet;
  static const String picture = 'Picture';
  bool light;

  Cabinet(
    this._documents, {
    this.flowers,
    this.light = false,
    required this.chair,
    this.closet,
    required this.lamp,
    required this.laptop,
    required this.desk,
  });

  Cabinet.my()
      : chair = 'chair black',
        lamp = 'lamp black',
        closet = 'closet',
        flowers = 'flowers',
        light = false,
        laptop = Laptop(
          ' Intel Core i5',
          [16],
          'mother board',
          wiFiModule: 'wiFiModule',
          keyboard: 'keyboard',
          screen: 'screen',
          powerSupply: 'powerSupply',
          touchPad: 'touchPad',
        ),
        desk = 'desk brown',
        _documents = [
          'medical documents',
          'ets',
        ];

  void lightTurnOn() {
    light = true;
  }

  void lightTurnOff() {
    light = false;
  }
}

class Laptop {
  final String screen;
  final String keyboard;
  final  String touchPad;
  final String _motherboard;
  final String powerSupply;
  final List<int> _ramCards;
  final String _cpu;
  final String? cdDrive;
  final String wiFiModule;

  Laptop(
    this._cpu,
    this._ramCards,
    this._motherboard, {
    this.cdDrive,
    required this.wiFiModule,
    required this.keyboard,
    required this.screen,
    required this.powerSupply,
    required this.touchPad,
  });
}
