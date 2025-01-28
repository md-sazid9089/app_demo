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
                                offset: const Offset(2, 2),
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
                spacing: 40.0, // Increased horizontal distance between icons
                runSpacing: 40.0, // Increased vertical distance between rows
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
                backgroundColor: const Color(0xff1A237E), // Darker shade to blend with the space night background
                selectedItemColor: const Color(0xffFFEB3B), // Starry Yellow for selected icon
                unselectedItemColor: const Color(0xffC0C0C0), // Moonlit Silver for unselected icons
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

  // Function to create icon buttons with enhanced visibility
  Widget _iconButton(BuildContext context, String label, IconData icon) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Increase the size of the icons and make them stand out
        double iconSize = constraints.maxWidth * 0.18; // 18% of the available width

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
                  gradient: LinearGradient(
                    colors: [Color(0xffFF8C00), Color(0xffFFD700)], // Bright gradient
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.yellow.withOpacity(0.5), // Add a glow effect
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                padding: EdgeInsets.all(iconSize * 0.25), // Padding based on icon size
                child: Icon(
                  icon,
                  size: iconSize,
                  color: Colors.black, // Contrast color for the icon
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold, // Make the label bold for visibility
              ),
            ),
          ],
        );
      },
    );
  }
}
