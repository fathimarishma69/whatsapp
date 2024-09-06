import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Widget buildCustomContainer(String text, double width) {
    return Container(
      height: 30,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Sample data for the ListView
    List<Map<String, String>> users = [
      {"name": "Shihana", "avatar": "assets/shihana.jpg", "message": "Hey there!", "time": "12:45 PM"},
      {"name": "Nesla", "avatar": "assets/nesla.jpg", "message": "What's up?", "time": "1:15 PM"},
      {"name": "Afeefa", "avatar": "assets/afeefa.jpg", "message": "Let's meet up!", "time": "2:30 PM"},
      {"name": "Reema", "avatar": "assets/reema.jpg", "message": "Got your message.", "time": "3:00 PM"},
      {"name": "motu", "avatar": "assets/img_1.png", "message": "Got your message.", "time": "3:00 PM"},
      {"name": "chotu", "avatar": "assets/img_2.png", "message": "Got your message.", "time": "3:00 PM"},
      {"name": "minnu", "avatar": "assets/img.png", "message":"hello", "time": "3:00 PM"},
      {"name": "mithu", "avatar": "assets/img.png", "message": "Got your message.", "time": "3:00 PM"},
      {"name": "kittu", "avatar": "assets/img.png", "message": "Got your message.", "time": "3:00 PM"},
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          "WhatsApp",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.qr_code_scanner_outlined, color: Colors.white),
            onPressed: () {
              // Add functionality here
            },
          ),
          IconButton(
            icon: const Icon(Icons.camera_alt_outlined, color: Colors.white),
            onPressed: () {
              // Add functionality here
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {
              // Add functionality here
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Ask Meta AI or Search",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [Colors.blue, Colors.purple, Colors.indigo],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: Center(
                              child: Container(
                                width: 22,
                                height: 22,
                                decoration: BoxDecoration(
                                  color: Colors.black87,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      buildCustomContainer("All", 40),
                      SizedBox(width: 8),
                      buildCustomContainer("Unread", 70),
                      SizedBox(width: 8),
                      buildCustomContainer("Favourites", 90),
                      SizedBox(width: 8),
                      buildCustomContainer("Groups", 70),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    child: Row(
                      children: [
                        Icon(Icons.add_box_outlined, color: Colors.white),
                        SizedBox(width: 20),
                        Text(
                          "Archived",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Spacer(),
                        Text(
                          "4",
                          style: TextStyle(color: Colors.green, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(users[index]["avatar"]!),
                    ),
                    title: Text(
                      users[index]["name"]!,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            users[index]["message"]!,
                            style: TextStyle(color: Colors.grey[300]),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          users[index]["time"]!,
                          style: TextStyle(color: Colors.grey[600], fontSize: 12),
                        ),
                      ],
                    ),
                    onTap: () {
                      // Handle tap
                    },
                  ),
                );
              },
              childCount: users.length,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.message_sharp),
        onPressed: () {
          // Handle new call action
        },
      ),
    );
  }
}
