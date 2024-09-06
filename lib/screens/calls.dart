import 'package:flutter/material.dart';

class Calls extends StatefulWidget {
  const Calls({super.key});

  @override
  State<Calls> createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  final List<Map<String, String>> callLogs = [
    {
      'name': "nesla",
      'time': 'Today, 10:00 AM',
      'type': 'outgoing',
      'image': 'assets/nesla.jpg'
    },
    {
      'name': 'Afeefa',
      'time': 'Yesterday, 4:30 PM',
      'type': 'incoming',
      'image': 'assets/afeefa.jpg'
    },
    {
      'name': 'Reema',
      'time': '2 days ago, 8:45 PM',
      'type': 'missed',
      'image': 'assets/reema.jpg'
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          "Calls",
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
            onPressed: () {

            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Favourites",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 25,
                  child:Icon(Icons.favorite,color: Colors.black,),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Text(
                    "Add favourite",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Recent",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: callLogs.length,
              itemBuilder: (context, index) {
                final call = callLogs[index];
                final callType = call['type'] ?? 'unknown';
                final imageUrl = call['image'] ?? '';

                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(imageUrl),
                  ),
                  title: Text(
                    call['name'] ?? 'Unknown',
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    call['time'] ?? 'No time',
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailing: Icon(
                    Icons.call,
                    color: Colors.green,
                  ),
                  onTap: () {

                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.add_call),
        onPressed: () {

        },
      ),
    );
  }
}
