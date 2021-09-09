import 'package:flutter/material.dart';
import 'package:food_khata/presentation/bottom_nav_bar.dart/pages/dashboard_page.dart';
import 'package:food_khata/presentation/bottom_nav_bar.dart/pages/users_balance_page.dart';
import 'package:food_khata/presentation/pages/signin_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    DashboardPage(),
    UsersBalancePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: <AppBar>[
        AppBar(
          elevation: 0,
          title: const Text("Home"),
          actions: [
            TextButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInPage(),
                  ),
                )
              },
              child: const Text(
                "Admin",
                style: TextStyle(color: Colors.white),
              ),
            )
            // state.map(
            //   initial: (value) => const CustomCircularProgressIndicator(),
            //   authenticated: (value) => IconButton(
            //     onPressed: () {
            //       showDialog<String>(
            //         context: context,
            //         builder: (BuildContext context) => AlertDialog(
            //           title: Row(
            //             children: const [
            //               Icon(
            //                 Icons.logout,
            //               ),
            //               SizedBox(width: 8),
            //               Text('Logout'),
            //             ],
            //           ),
            //           content: const Text('Are you sure you want to Logout?'),
            //           actions: <Widget>[
            //             TextButton(
            //               onPressed: () => Navigator.pop(context),
            //               child: const Text(
            //                 'No',
            //                 style: TextStyle(color: Color(0xffff6347)),
            //               ),
            //             ),
            //             TextButton(
            //               onPressed: () {
            //                 context
            //                     .read<AuthBloc>()
            //                     .add(const AuthEvent.signedOut());
            //                 Navigator.pop(context);
            //               },
            //               child: const Text(
            //                 'Yes',
            //                 style: TextStyle(
            //                   color: Color(0xffff6347),
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //       );
            //     },
            //     icon: const Icon(Icons.logout),
            //   ),
            //   unauthenticated: (value) => TextButton(
            //     onPressed: () => {context.router.push(const SignInRoute())},
            //     child: const Text(
            //       "Login",
            //       style: TextStyle(color: Colors.white),
            //     ),
            //   ),
            // ),
          ],
        ),
        AppBar(
          title: const Text("Individuals balance"),
        ),
      ].elementAt(_selectedIndex),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Users',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xffff6347),
        onTap: _onItemTapped,
      ),
    );
  }
}
