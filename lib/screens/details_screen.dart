import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherData = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(title: const Text('Weather Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('City: ${weatherData['name']}'),
            Text('Temperature: ${weatherData['main']['temp']} °C'),
            Text('Condition: ${weatherData['weather'][0]['description']}'),
          
          ],
        ),
      ),
    );
  }
}

