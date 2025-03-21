import 'package:flutter/material.dart';
import '../services/ai_translator.dart';

class TranslatorScreen extends StatefulWidget {
  final TextEditingController destinationController;

  TranslatorScreen({required this.destinationController});

  @override
  _TranslatorScreenState createState() => _TranslatorScreenState();
}

class _TranslatorScreenState extends State<TranslatorScreen> {
    // Controller to capture text input for translation.
  final TextEditingController _inputController = TextEditingController();
  String _translatedText = "";

    // This method handles translating the input text.

  void _translateInputText() async {
    // If destination input is empty, assign "Unknown Destination"
    String destination = widget.destinationController.text.trim().isEmpty
        ? "Unknown Destination"
        : widget.destinationController.text.trim();

 // Get the user-entered text for translation.
     String inputText = _inputController.text.trim();
    if (inputText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        // Show a SnackBar if no text is entered.
        SnackBar(content: Text("Please enter text to translate.")),
      );
      return;
    }
        // Use the AI translator service to translate the input text.

    String translation = await TranslatorService().translateText(inputText, destination);
    setState(() {
      _translatedText = translation;
    });
  }

  @override
  Widget build(BuildContext context) {
    String destination = widget.destinationController.text.trim().isEmpty
        ? "Unknown Destination"
        : widget.destinationController.text.trim();

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
            "Enter text to translate it into the native language for $destination.",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _inputController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Enter text here",
            ),
            maxLines: null,
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: _translateInputText,
              child: Text("Translate"),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Translated Text:",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Container(
            padding: EdgeInsets.all(12.0),
            margin: EdgeInsets.only(top: 8.0),
            color: Colors.white,
            child: Text(
              _translatedText.isEmpty ? "Translated text ." : _translatedText,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
