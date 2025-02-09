import 'package:flutter/material.dart';
import 'live_page.dart';
import 'space_tarvel.dart';

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
              "assets/space_bg4.jpg",
              fit: BoxFit.cover,
            ),
          ),

          // Content Layout
          Column(
            children: [
              const SizedBox(height: 50), // Status bar adjustment

              // Profile Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        // Profile Image
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 3),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 10,
                                offset: const Offset(2, 2),
                              ),
                            ],
                          ),
                          child: const CircleAvatar(
                            radius: 40,
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
                                fontWeight: FontWeight.bold,
                              ),
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

              // Buttons Section
              Wrap(
                spacing: 40.0,
                runSpacing: 40.0,
                alignment: WrapAlignment.center,
                children: [
                  _iconButton(context, "Puzzle", Icons.extension),
                  _iconButton(context, "SpaceX", Icons.rocket),
                  _iconButton(context, "Feed", Icons.sort),
                  _iconButton(context, "Live", Icons.live_tv),
                  _iconButton(context, "Chats", Icons.rocket_launch),
                ],
              ),

              const Spacer(),

              // Bottom Navigation Bar
              BottomNavigationBar(
                backgroundColor: const Color(0xff1A237E),
                selectedItemColor: const Color(0xffFFEB3B),
                unselectedItemColor: const Color(0xffC0C0C0),
                currentIndex: 1, // Default tab selected is "Home"
                elevation: 8, // Shadow effect
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
                    label: "Settings",
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _iconButton(BuildContext context, String label, IconData icon) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            if (label == "Live") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LiveTrackingPage()),
              );
            } else if (label == "SpaceX") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SpaceTravelHome()),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("$label Clicked!")),
              );
            }
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xffFF8C00), Color(0xffFFD700)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.yellow.withOpacity(0.5),
                  blurRadius: 10,
                  spreadRadius: 5,
                ),
              ],
            ),
            padding: const EdgeInsets.all(15),
            child: Icon(
              icon,
              size: 30,
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
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
