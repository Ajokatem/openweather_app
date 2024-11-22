import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.account_circle, size: 100),
            SizedBox(height: 20),
            Text(
              'User Profile Details',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
