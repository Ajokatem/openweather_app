import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.search, size: 100),
            SizedBox(height: 20),
            Text(
              'Search for a City or Weather Information',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
