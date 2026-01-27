import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/controllers/auth_controller.dart';
import 'package:task_manager/ui/screens/sign_in_screen.dart';
import 'package:task_manager/ui/screens/update_profile_screen.dart';

class TMAppBar extends StatefulWidget implements PreferredSizeWidget {
  const TMAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<TMAppBar> createState() => _TMAppBarState();
}

class _TMAppBarState extends State<TMAppBar> {
  @override
  Widget build(BuildContext context) {
    final user = AuthController.userModel;

    return AppBar(
      backgroundColor: Colors.green,
      title: Row(
        children: [
          /// ✅ Profile Image
          CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: user?.photo != null
                ? MemoryImage(base64Decode(user!.photo!))
                : null,
            child: user?.photo == null
                ? const Icon(Icons.person, color: Colors.green)
                : null,
          ),
          const SizedBox(width: 16),

          /// ✅ Only profile area clickable
          Expanded(
            child: GestureDetector(
              onTap: _onTapProfileBar,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user?.fullName ?? '',
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    user?.email ?? '',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// ✅ Logout works correctly
          IconButton(
            onPressed: _onTapLogoutButton,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
    );
  }

  void _onTapProfileBar() {
    if (ModalRoute.of(context)?.settings.name !=
        UpdateProfileScreen.name) {
      Navigator.pushNamed(context, UpdateProfileScreen.name);
    }
  }

  void _onTapLogoutButton() async {
    await AuthController.clearData();
    Navigator.pushNamedAndRemoveUntil(
      context,
      SignInScreen.name,
      (predicate) => false,
    );
  }
}
