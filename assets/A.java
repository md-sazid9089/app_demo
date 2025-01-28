import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = true; // Default mode is Dark Mode

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _isDarkMode ? darkTheme() : lightTheme(),
      home: const HomePage(),
    );
  }

  ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      backgroundColor: Colors.black,
      primaryColor: Colors.purple,
      accentColor: Colors.amber,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        titleTextStyle: TextStyle(color: Colors.white),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xff0A0C1A),
        selectedItemColor: Color(0xffFFEB3B),
        unselectedItemColor: Color(0xffC0C0C0),
      ),
    );
  }

  ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      primaryColor: Colors.blue,
      accentColor: Colors.orange,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blue,
        titleTextStyle: TextStyle(color: Colors.white),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Space Night App"),
        actions: [
          Switch(
            value: Theme.of(context).brightness == Brightness.dark,
            onChanged: (value) {
              final _MyAppState state = context.findAncestorStateOfType<_MyAppState>()!;
              state.setState(() {
                _isDarkMode = value;
              });
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              "assets/space_bg2.png", // Ensure this is correctly added in pubspec.yaml
              fit: BoxFit.cover,
            ),
          ),

          // Content Layout
          Column(
            children: [
              const SizedBox(height: 50), // Adjust for status bar

              // Profile Section with updated styling
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        // Profile Avatar with added style
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 3), // White border
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 10,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                          child: const CircleAvatar(
                            radius: 40, // Larger size for the profile icon
                            backgroundImage: AssetImage("assets/profile.png"),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Welcome!",
                              style: TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            Text(
                              "Abrar Ahmed",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        // Online Status
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: const [
                              Icon(Icons.circle, color: Colors.green, size: 12),
                              SizedBox(width: 4),
                              Text("Online", style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Icon(Icons.notifications, color: Colors.white),
                      ],
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Grid of Buttons with adjusted spacing
              Wrap(
                spacing: 40.0,  // Increased horizontal distance between icons
                runSpacing: 40.0,  // Increased vertical distance between rows
                alignment: WrapAlignment.center,
                children: [
                  _iconButton(context, "Puzzle", Icons.extension),
                  _iconButton(context, "Quiz", Icons.quiz),
                  _iconButton(context, "Feed", Icons.sort),
                  _iconButton(context, "Live", Icons.live_tv),
                  _iconButton(context, "Chats", Icons.rocket_launch),
                ],
              ),

              const Spacer(),

              // Bottom Navigation Bar with updated styling
              BottomNavigationBar(
                backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                selectedItemColor: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
                unselectedItemColor: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
                currentIndex: 1, // Default selected tab is "Home"
                elevation: 8, // Slight elevation for shadow effect
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.history),
                    label: "History",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: "Setting",
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Function to create icon buttons with dynamic size based on screen width
  Widget _iconButton(BuildContext context, String label, IconData icon) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Dynamically calculate the size of the icons based on screen width
        double iconSize = constraints.maxWidth * 0.15; // 15% of the available width

        return Column(
          children: [
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("$label Clicked!")),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(iconSize * 0.25), // Padding based on icon size
                child: Icon(
                  icon,
                  size: iconSize,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        );
      },
    );
  }
}
