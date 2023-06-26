import 'dart:convert';
import 'package:http/http.dart' as http;
class User {
  String firstName;
  String lastName;
  String role;
  String profileImageUrl;
  int points;
  bool darkMode; 
  final String login;
  String email;
  String phone;
  String longtext;
  final String id;
  bool completedOnboarding;
  String myTeamName;

  User({
    required this.id,
    this.firstName = 'Марго',
    this.lastName = 'Лучиано',
    this.role = 'Заполните специальность',
    this.profileImageUrl = 'assets/profile_pics/photoprofile.png',
    this.points = 100,
    this.darkMode = false,
    this.login = 'Введите логин',
    this.email = 'example@email.com',
    this.phone = '+78887776655',
    this.longtext = '''Работаю работу, компетентен во всем и ничем.\nЗнаю языки шарпа, питона, мертвые языки.\nУмею призывать суперсотону.
    \nЗдесь должна быть ссылка на мой гитхаб и\nличные проекты.''',  
    this.completedOnboarding = false,
    this.myTeamName = 'Komandaros',
    

  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        login: json['userName'] ?? '',
        email: json['email'] ?? '',
        phone: json['phoneNumber'] ?? '',
        role: json['role'] ?? '',
        longtext: json['longtext'] ?? '',
        firstName: json['firstName'] ?? '',
        lastName: json['secondName'] ?? '',
        myTeamName: json['teamName'] ?? ''
    );
  }


}

// вход в приложение проверяется по этому списку. заменить в будущем
List<String> users = <String> ['Empty User', 'ivanov', 'Login UI'];

// чтоб искать по логину, заменить в будущем
var loginToId = {'Empty User': 0, 'ivanov': 1, 'Login UI': 2};

// заменить на DB 
List<User> userDatabase = <User>[];

void GetUsers() async {
  var url = Uri.http('10.0.2.2:5000', 'api/user/all');
  var response = await http.get(url);
  var data = json.decode(response.body);
  userDatabase =  List<User>.from(data.map((x) => User.fromJson(x)));
  users = List<String>.from(userDatabase.map((e) => e.login));
}

Future<String> HTTP_Register(String path, Map<String, dynamic>? qp) async{
  var url = Uri.http('10.0.2.2:5000', path, qp);
  var response = await http.get(url);
  GetUsers();
  return response.body ?? '';
}

Future<bool> HTTP_Login(String path, Map<String, dynamic>? qp) async{
  var url = Uri.http('10.0.2.2:5000', path, qp);
  var response = await http.get(url);
  return json.decode(response.body);
}

void HTTP_Edit(String path, Map<String, dynamic>? qp) async{
  var url = Uri.http('10.0.2.2:5000', path, qp);
  var response = await http.get(url);
}