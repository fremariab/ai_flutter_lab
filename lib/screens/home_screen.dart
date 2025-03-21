import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  // Controller to capture user input for destination or country
  final TextEditingController destinationController;

  const HomeScreen({super.key, required this.destinationController});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Display a welcome message for the user
          Text(
            "Welcome to the Travel Guide. This app offers travel advice and language translation to help you explore your destinations.",
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 70),
          // TextField for the user to enter their destination or country
          TextField(
            controller: destinationController,
            decoration: InputDecoration(
              labelText: "Enter Destination or Country",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 30),
          // text guiding the user on next steps
          Text(
            "Enter your travel destination above and then switch to the Translator tab for language support.",
            style: TextStyle(fontSize: 13),
          ),
        ],
      ),
    );
  }
}
