import 'package:flutter/material.dart';
import 'package:task_manager/ui/app.dart';
import 'package:task_manager/ui/screens/sign_in_screen.dart';
import 'package:task_manager/ui/screens/update_profile_screen.dart';

class TMAppBar extends StatefulWidget implements PreferredSizeWidget {
  const TMAppBar({
    super.key,
  });

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  State<TMAppBar> createState() => _TMAppBarState();
}

class _TMAppBarState extends State<TMAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      title: GestureDetector(
        onTap: _onTapProfileBar,
        child: Row(
          children: [
            CircleAvatar(),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Prottoy kundu',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'turjakundu2016@gmail.com',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: _onTapLogoutButton,
              icon: Icon(Icons.logout),
            ),
          ],
        ),
      ),
    );
  }

  void _onTapProfileBar() {
    var navigator = TaskManagerApp.navigatorKey.currentState;

    String? currentRoute;
    navigator?.popUntil((route) {
      currentRoute = route.settings.name;
      return true;
    });

    if (currentRoute != UpdateProfileScreen.name) {
      navigator?.pushNamed(UpdateProfileScreen.name);
    }
  }

  void _onTapLogoutButton() {
    Navigator.pushNamedAndRemoveUntil(
        context, SignInScreen.name, (predicate) => false);
  }
}
