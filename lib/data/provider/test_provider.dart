import '../../res/import/import.dart';

class TestProvider extends ChangeNotifier {
  static TestProvider? _instance;

  static late ApiService apiService;

  TestProvider() {
    apiService = ApiServiceImpl();
  }

  static TestProvider get instance {
    _instance ??= TestProvider();
    return _instance!;
  }

  bool _shortCharactersChecked = false;

  bool get shortCharactersChecked {
    return _shortCharactersChecked;
  }

  set shortCharactersChecked(bool value) {
    _shortCharactersChecked = value;
    notifyListeners();
  }

  bool _upperandLowerCharactersChecked = false;
  bool get upperandLowerCharactersChecked {
    return _upperandLowerCharactersChecked;
  }

  set upperandLowerCharactersChecked(bool value) {
    _upperandLowerCharactersChecked = value;
    notifyListeners();
  }

  bool _numberChecked = false;
  bool get numberChecked {
    return _numberChecked;
  }

  set numberChecked(bool value) {
    _numberChecked = value;
    notifyListeners();
  }

  bool _symbolCharactersChecked = false;
  bool get symbolCharactersChecked {
    return _symbolCharactersChecked;
  }

  set symbolCharactersChecked(bool value) {
    _symbolCharactersChecked = value;
    notifyListeners();
  }

  bool _sameAsOldPassword = false;
  bool get sameAsOldPassword {
    return _sameAsOldPassword;
  }

  set sameAsOldPassword(bool value) {
    _sameAsOldPassword = value;
    notifyListeners();
  }
}
