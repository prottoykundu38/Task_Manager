import 'package:flutter/material.dart';
import 'package:task_manager/ui/controllers/auth_controller.dart';
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
                    AuthController.userModel!.fullName,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    AuthController.userModel!.email,
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
    if (ModalRoute.of(context)!.settings.name != UpdateProfileScreen.name) {
      Navigator.pushNamed(context, UpdateProfileScreen.name);
    }
    return;
  }

  void _onTapLogoutButton() async {
    await AuthController.clearData();
    Navigator.pushNamedAndRemoveUntil(
        context, SignInScreen.name, (predicate) => false);
  }
}
