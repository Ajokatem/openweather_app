import 'package:flutter/material.dart'; 
import '../services/weather_api_service.dart';
import 'search_screen.dart';  
import 'profile_screen.dart';  

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _cityController = TextEditingController();
  String? errorMessage;
  Map<String, dynamic>? weatherData;
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(), // Home Screen
    SearchScreen(), // Search Screen
    ProfileScreen(), // Profile Screen
  ];

  void fetchWeather() async {
    final service = WeatherApiService();
    try {
      final data = await service.fetchWeather(_cityController.text);
      setState(() {
        weatherData = data;
        errorMessage = null;
      });
    } catch (e) {
      setState(() {
        weatherData = null;
        errorMessage = 'City not found!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      // Drawer for additional navigation options
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Navigation Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _cityController,
              decoration: const InputDecoration(
                labelText: 'Enter City Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: fetchWeather,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text('Get Weather'),
            ),
            const SizedBox(height: 16),
            if (errorMessage != null)
              Text(
                errorMessage!,
                style: const TextStyle(color: Color.fromARGB(255, 226, 162, 158)),
              ),
            if (weatherData != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('City: ${weatherData!['name']}'),
                  Text('Temperature: ${weatherData!['main']['temp']} °C'),
                  Text('Condition: ${weatherData!['weather'][0]['description']}'),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/details',
                        arguments: weatherData,
                      );
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: const Text('View Details'),
                  ),
                ],
              ),
          ],
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          // Update the selected screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => _screens[index]),
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
