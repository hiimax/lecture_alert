import '../../models/lecture_model.dart';
import '../../res/import/import.dart';

class AuthenticationProvider extends ChangeNotifier {
  static AuthenticationProvider? _instance;
  static late ApiService apiService;

  AuthenticationProvider() {
    apiService = ApiServiceImpl();
    getRememberMeStatus();
  }

  static AuthenticationProvider get instance {
    _instance ??= AuthenticationProvider();
    return _instance!;
  }

  ///register
  //model for register
  //success boolean
  bool _registerBusy = false;
  bool get registerBusy => _registerBusy;

  //register controllers
  final TextEditingController _firstName = TextEditingController();
  TextEditingController get firstName => _firstName;
  final TextEditingController _lastName = TextEditingController();
  TextEditingController get lastName => _lastName;
  final TextEditingController _username = TextEditingController();
  TextEditingController get username => _username;
  final TextEditingController _email = TextEditingController();
  TextEditingController get email => _email;
  final TextEditingController _password = TextEditingController();
  TextEditingController get password => _password;

  Future<void> register({
    required context,
    VoidCallback? onFailure,
    VoidCallback? onSuccess,
  }) async {
    try {
      _registerBusy = true;
      notifyListeners();
      final pref = await SharedPreferences.getInstance();
      await pref.setString(
        "email",
        _email.text.trim(),
      );
      await pref.setString(
        "password",
        _password.text.trim(),
      );
      await pref.setString(
        "firstname",
        _firstName.text.trim(),
      );
      await pref.setString(
        "lastname",
        _lastName.text.trim(),
      );
      await pref.setString("matricNumber", _username.text.trim());
      showSuccessToast(message: 'Account creation successful');
      notifyListeners();
      onSuccess?.call();
    } on DioError {
      onFailure?.call();
    } finally {
      _registerBusy = false;
      notifyListeners();
    }
  }

  ///add lecture
  //model for register
  final bool _addLectureBusy = false;
  bool get addLectureBusy => _addLectureBusy;

  //register controllers
  final TextEditingController _courseName = TextEditingController();
  TextEditingController get courseName => _courseName;
  final TextEditingController _lecturer = TextEditingController();
  TextEditingController get lecturer => _lecturer;
  final TextEditingController _department = TextEditingController();
  TextEditingController get department => _department;
  final TextEditingController _room = TextEditingController();
  TextEditingController get room => _room;
  String _time = '';
  String get time => _time;
  set time(String value) {
    _time = value;
    notifyListeners();
  }

  String _date = '';
  String get date => _date;

  set date(String value) {
    _date = value;
    notifyListeners();
  }

  bool _rememberMe = false;
  bool get rememberMe => _rememberMe;

  void toggleRememberMe() {
    _rememberMe = !_rememberMe;
    LocalStorage.setItem("rememberMe", _rememberMe);
    notifyListeners();
  }

  Future<bool> getRememberMeStatus() async {
    _rememberMe = await LocalStorage.getItem("rememberMe") ?? false;
    notifyListeners();
    return _rememberMe;
  }

  ///login
  //model for login

  //success boolean
  bool _loginBusy = false;
  bool get loginBusy => _loginBusy;

  final bool _loginsuccess = false;
  bool get loginsuccess => _loginsuccess;
  //login controllers

  final TextEditingController _loginemail = TextEditingController();
  TextEditingController get loginemail => _loginemail;

  final TextEditingController _loginpassword = TextEditingController();
  TextEditingController get loginpassword => _loginpassword;

  Future<void> login({
    required context,
    VoidCallback? onFailure,
    VoidCallback? onSuccess,
    bool? showError,
  }) async {
    try {
      _loginBusy = true;
      notifyListeners();
      final pref = await SharedPreferences.getInstance();
      String matric = pref.getString(
            "matricNumber",
          ) ??
          '';
      String password = pref.getString(
            "password",
          ) ??
          '';

      if (matric == _loginemail.text && password == _loginpassword.text) {
        showSuccessToast(message: 'Login successful');
        notifyListeners();
        onSuccess?.call();
      } else {
        if (matric != _loginemail.text) {
          showErrorToast(message: 'Incorrect Matric number');
        }
        if (password != _loginpassword.text) {
          showErrorToast(message: 'Incorrect password');
        }
      }
    } on DioError {
      onFailure?.call();
    } finally {
      _loginBusy = false;
      notifyListeners();
    }
  }

  List<LectureModel> _lectures = [];
  List<LectureModel> get lectures => _lectures;

  Future<void> loadLectures() async {
    final prefs = await SharedPreferences.getInstance();
    final String tasksJson = prefs.getString('tasks') ?? '[]';
    _lectures = (json.decode(tasksJson) as List<dynamic>)
        .map((task) => LectureModel.fromMap(task))
        .toList();
    notifyListeners();
  }

  Future<void> saveLectures() async {
    final prefs = await SharedPreferences.getInstance();
    final String tasksJson =
        json.encode(_lectures.map((task) => task.toMap()).toList());
    prefs.setString('tasks', tasksJson);
    notifyListeners();
  }

  void addLecture({
    required LectureModel value,
    VoidCallback? onSuccess,
  }) {
    _lectures.add(value);

    saveLectures();
    showSuccessToast(message: 'A new lecture Added');
    onSuccess?.call();
  }
}
