import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final TextEditingController destinationController;

  ChatScreen({required this.destinationController});

  @override
  Widget build(BuildContext context) {
    // Read the destination from the shared controller.
    final String destination = destinationController.text.trim().isEmpty
        ? "Unknown Destination"
        : destinationController.text;

    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Destination: $destination",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            "Preset Questions:",
            style: TextStyle(fontSize: 16),
          ),
          ListTile(
            leading: Icon(Icons.question_answer),
            title: Text("What are the top attractions in $destination?"),
          ),
          ListTile(
            leading: Icon(Icons.question_answer),
            title: Text("What cultural experiences should I try in $destination?"),
          ),
          ListTile(
            leading: Icon(Icons.question_answer),
            title: Text("Where can I find the best local food in $destination?"),
          ),
          SizedBox(height: 20),
          Text(
            "Chat Response:",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          // Placeholder for the AI chat response.
          Container(
            padding: EdgeInsets.all(12.0),
            margin: EdgeInsets.only(top: 8.0),
            color: Colors.white,
            child: Text(
              "AI-generated chat response will appear here.",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
