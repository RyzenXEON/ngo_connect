import 'package:flutter/material.dart';
//import 'package:ngo_connect/pages/ngo_page.dart';
import 'package:ngo_connect/pages/ngo_screen.dart';
import 'package:ngo_connect/pages/home_page.dart';
import 'package:ngo_connect/pages/profile_page.dart';
import 'package:ngo_connect/pages/volunteer_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  int _index=0;
  final List<Widget> widgetList= [
          Home(
            key: const PageStorageKey('Home'),
          ),
          const NGOScreen(),
          const VolunteerPage(),
          const ProfilePage(),
        ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body: widgetList[_index],

        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 182, 181, 181),
          ),
          child: Stack(
            children: [
              BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: const Color.fromRGBO(4, 224, 92, 1), 
                onTap: (index) {
                  setState(() {
                    _index=index;
                  });
                },
                
                unselectedItemColor: const Color.fromARGB(255, 100, 100, 100),
                unselectedIconTheme: const IconThemeData(color: Color.fromARGB(255, 100, 100, 100)),
                showUnselectedLabels: true,
                currentIndex: _index,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      size: 30,
                      color: (_index==0)?const Color.fromRGBO(107, 189, 147, 1):const Color.fromARGB(255, 151, 151, 151),
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    
                    icon: ImageIcon(
                      const AssetImage('assets/images/donate.png'),
                      size: 30,
                      color: (_index==1)?const Color.fromRGBO(107, 189, 147, 1):const Color.fromARGB(255, 151, 151, 151),
                    ),
                    label: 'Donate',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      const AssetImage('assets/images/volunteer.png'),
                      size: 40,
                      color: (_index==2)? const Color.fromRGBO(107, 189, 147, 1): const Color.fromARGB(255, 151, 151, 151),
                    ),
                    label: 'Volunteer',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person,
                      size: 30,
                      color: (_index==3)?const Color.fromRGBO(107, 189, 147, 1):const Color.fromARGB(255, 151, 151, 151),
                    ),
                    label: 'Profile',
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  }
}