import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              "assets/space_bg3.png", // Ensure this is correctly added in pubspec.yaml
              fit: BoxFit.cover,
            ),
          ),

          // Content Layout
          Column(
            children: [
              const SizedBox(height: 50), // Adjust for status bar

              // Profile Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage("assets/profile.jpg"),
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
                              "Anika Rahnum",
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

              // Grid of Buttons
              Wrap(
                spacing: 30.0,
                runSpacing: 30.0,
                alignment: WrapAlignment.center,
                children: [
                  _iconButton(context, "Puzzle", Icons.extension),
                  _iconButton(context, "Quiz", Icons.quiz),
                  _iconButton(context, "Sorting", Icons.sort),
                  _iconButton(context, "Live", Icons.live_tv),
                  _iconButton(context, "Key Facts", Icons.rocket_launch),
                ],
              ),

              const Spacer(),

              // Bottom Navigation Bar
              BottomNavigationBar(
                backgroundColor: const Color(0xff4A235A),
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.grey[400],
                currentIndex: 1, // Default selected tab is "Home"
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

  // Function to create icon buttons
  Widget _iconButton(BuildContext context, String label, IconData icon) {
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
            padding: const EdgeInsets.all(16),
            child: Icon(
              icon,
              size: 40,
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
  }
}
