import 'models.dart';

class Team {
  String teamName;
  String teamRole;
  List<User> members = [];
  List<User> teamCandidates = candidatesExample;
  String teamEmail;
  String teamContact;
  String description;
  final int teamId;
  String teamPicture;
  

  Team({
    required this.teamId,
    this.teamName = 'Komandaros',
    this.teamRole = 'Game Development',
    this.teamEmail = 'example@email.com',
    this.teamContact = 'Discord PhantomRU#1289',
    this.description = '''Хотел бы чтобы вы сделали игру, 3Д-экшон суть такова... Пользователь может играть лесными эльфами, охраной дворца и злодеем. 
    И если пользователь играет эльфами то эльфы в лесу, домики деревяные набигают солдаты дворца и злодеи. 
    Можно грабить корованы... И эльфу раз лесные то сделать так что там густой лес...\n\nP.S. Я джва года хочу такую игру.\n''', 
    this.teamPicture = 'assets/atb_assets/phototeam.png', 

  });
}

List<Team> teams = [
  Team(teamId: 0, teamName: 'MyTeam'),
  Team(teamId: 1, teamName: 'Komandaros'),
];

List<User> teamCandidates = [];

// временно для списка
List <User> candidatesExample = [
    User(id:'666', firstName: 'Farhod', lastName: 'Dohor', email: '1'),
    User(id:'777', firstName: 'Hsas', lastName: 'Kjhg', email: '2'),
    User(id:'888', firstName: 'Grusss', lastName: 'Wseue', email: '3'),
    User(id:'999', firstName: 'Kodkd', lastName: 'Oplds', email: '4'),
    User(id:'111', firstName: 'Klajs', lastName: 'Nvejs', email: '5'),
  ];
  