import 'package:flutter/material.dart';

class Updates extends StatefulWidget {
  const Updates({super.key});

  @override
  State<Updates> createState() => _UpdatesState();
}

class _UpdatesState extends State<Updates> {
  // Updated list of profiles
  final List<Map<String, String>> profiles = [
    {"name": "Reema", "avatar": "assets/reema.jpg", "time": "10 minutes ago"},
    {"name": "Nesla", "avatar": "assets/nesla.jpg", "time": "1 hour ago"},
    {"name": "Afeefa", "avatar": "assets/afeefa.jpg", "time": "5 hours ago"},
  ];

  bool _isListViewVisible = false;
  bool _isSecondListViewVisible = true; // New boolean for the second ListView visibility

  void _toggleListViewVisibility() {
    setState(() {
      _isListViewVisible = !_isListViewVisible;
      _isSecondListViewVisible = !_isSecondListViewVisible; // Toggle second ListView visibility
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          "Updates",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.qr_code_scanner_outlined, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.camera_alt_outlined, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Stack(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage("assets/shihana.jpg"),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.green,
                        child: Icon(
                          Icons.add,
                          size: 12,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              title: Text(
                "My Status",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "Tap to add status update",
                style: TextStyle(color: Colors.grey),
              ),
              onTap: () {},
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Viewed updates",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: _toggleListViewVisibility,
                    child: Icon(
                      _isListViewVisible
                          ? Icons.arrow_drop_up
                          : Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            // Conditionally show the first ListView.builder
            if (_isListViewVisible)
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(), // Prevent scrolling inside ListView
                itemCount: profiles.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: SizedBox(
                        width: 60,
                        height: 56,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CircleAvatar(
                              radius: 28,
                              backgroundColor: Colors.grey,
                            ),
                            CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage(profiles[index]["avatar"]!),
                            ),
                          ],
                        ),
                      ),
                      title: Text(
                        profiles[index]["name"]!,
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        profiles[index]["time"]!,
                        style: TextStyle(color: Colors.grey),
                      ),
                      onTap: () {},
                    ),
                  );
                },
              ),
            // Second ListView.builder for another list of profiles or updates
            if (_isSecondListViewVisible)
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: profiles.length, // You can change this or use another list
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: SizedBox(
                        width: 60,
                        height: 56,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CircleAvatar(
                              radius: 28,
                              backgroundColor: Colors.green, // Change color for a different look
                            ),
                            CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage(profiles[index]["avatar"]!),
                            ),
                          ],
                        ),
                      ),
                      title: Text(
                        profiles[index]["name"]!,
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        profiles[index]["time"]!,
                        style: TextStyle(color: Colors.grey),
                      ),
                      onTap: () {},
                    ),
                  );
                },
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.camera_alt_outlined),
        onPressed: () {},
      ),
    );
  }
}
