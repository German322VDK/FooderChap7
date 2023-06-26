import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:provider/provider.dart';
import '../models/models.dart';
import 'screens.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
    required this.currentTab,
  });

  final int currentTab;

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  static List<Widget> pages = <Widget>[
    const ProfileInfoPage(),
    const TeamPage(),
    const SearchMemberPage(),
    ExploreScreen(),
    RecipesScreen(),
    const GroceryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ATB Flutter Demo',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          profileButton(widget.currentTab),
        ],
      ),
      body: IndexedStack(
        index: widget.currentTab,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        currentIndex: widget.currentTab,
        onTap: (index) {
          Provider.of<AppStateManager>(context, listen: false).goToTab(index);
          context.goNamed(
            'home',
            pathParameters: {
              'tab': '$index',
            },
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Team',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_search),
            label: 'LFG',
          ),
          // ниже обучающие вкладки из примера
          /*
          BottomNavigationBarItem(
            icon: Icon(Icons.person_search),
            label: 'explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_search),
            label: 'recipes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_search),
            label: 'to buy',
          ),
          */
        ],
      ),
    );
  }

  Widget profileButton(int currentTab) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: GestureDetector(
        child: const CircleAvatar(
          radius: 24,
          backgroundColor: Colors.purple,
          child: CircleAvatar(
            radius: 22,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage(
              'assets/profile_pics/photoprofile.png',
            ),
          ),
        ),
        onTap: () {
          context.goNamed('profile', pathParameters: {
            'tab': '$currentTab',
          });
        },
      ),
    );
  }
}
