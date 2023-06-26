import 'package:flutter/material.dart';

import 'models.dart';

class TeamManager extends ChangeNotifier {
  
  var _myTeam = Team(teamId: 0);

  void createTeam(
    User userCreator,
    String teamName,
    {
    String teamRole = 'Game Development',
    String teamEmail = 'example@email.com',
    String description = 'Пока пусто',
    
    String teamPicture = 'assets/atb_assets/phototeam.png',}
    ) 
    {
      _myTeam = Team(
        teamId: teams.length, 
        teamName:teamName,
        teamRole:teamRole ,
        teamEmail:teamEmail,
        description:description,
        teamPicture:teamPicture,
      );
      _myTeam.teamContact = '${userCreator.firstName} ${userCreator
          .lastName}';
      _myTeam.members.add(userCreator);
      notifyListeners();
      teams.add(_myTeam);
    }
  


  void setCurrentTeam(thisTeamName){
    _myTeam = teams.singleWhere((element) => element.teamName 
      == thisTeamName);
  }
  
  Team get getTeam => _myTeam;

  void removeThisTeam() => teams.removeWhere((element) => element == _myTeam);

  void addToTeamCandidates(applier)  {
    _myTeam.teamCandidates.add(applier);
    notifyListeners();
  }
  void copyCandidatesList(listOfCandidates){
    _myTeam.teamCandidates = listOfCandidates;
  }

// Проверка, что лист кандидатов не пуст
  bool get areThereAnyCandidates => _myTeam.teamCandidates.isNotEmpty;
  // Проверка что никого нет
  bool get isCandidateListEmpty => _myTeam.teamCandidates.isEmpty;

  User get getCandidateToCheck => _myTeam.teamCandidates.last;
  void removeFromTeamCandidates(candidate) {
    _myTeam.teamCandidates.removeWhere((element) => element == candidate);
    notifyListeners();
    }
  void popLastFromTeamCandidates(candidate) { 
    _myTeam.teamCandidates.removeLast();
    notifyListeners();
    }

  void moveLastCandidateToFirst(candidate){
    final mover = _myTeam.teamCandidates.removeLast();
    _myTeam.teamCandidates.insert(0, mover);
    notifyListeners();
  }

  void acceptMembers(User candidate){
    if (!_myTeam.members.contains(candidate)) {
        _myTeam.members.add(candidate);}

    if (_myTeam.teamCandidates.contains(candidate))  
    {removeFromTeamCandidates(candidate);}
      
  }

}
