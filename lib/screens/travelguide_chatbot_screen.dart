import 'package:flutter/material.dart';
import '../services/ai_chatter.dart';

class ChatScreen extends StatefulWidget {
  final TextEditingController destinationController;

  const ChatScreen({super.key, required this.destinationController});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String _chatResponse = "";
  bool _isLoading = false;

  void _fetchQuestionResponse(String question) async {
    final destination = widget.destinationController.text.trim();
    if (destination.isEmpty) return;

    setState(() {
      _isLoading = true;
      _chatResponse = "";
    });

    try {
      // Builds a combined prompt that includes the preset question and destination.
      final prompt = "$question in $destination?";
      final response = await getTravelRecommendations(prompt);
      setState(() {
        _chatResponse = response;
      });
    } catch (e, stackTrace) {
      setState(() {
        _chatResponse = "Error: $e";
      });
      debugPrint("Exception in getTravelRecommendations: $e");
      debugPrint("StackTrace: $stackTrace");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final String destination = widget.destinationController.text.trim().isEmpty
        ? "Unknown Destination"
        : widget.destinationController.text;
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
            "Preset Questions (tap to ask):",
            style: TextStyle(fontSize: 16),
          ),
          ListTile(
            leading: Icon(Icons.question_answer),
            title: Text("What are the top attractions"),
            onTap: () => _fetchQuestionResponse("What are the top attractions"),
          ),
          ListTile(
            leading: Icon(Icons.question_answer),
            title: Text("What cultural experiences should I try"),
            onTap: () => _fetchQuestionResponse("What cultural experiences should I try"),
          ),
          ListTile(
            leading: Icon(Icons.question_answer),
            title: Text("Where can I find the best local food"),
            onTap: () => _fetchQuestionResponse("Where can I find the best local food"),
          ),
          SizedBox(height: 20),
          _isLoading
              ? Center(child: CircularProgressIndicator())
              : _chatResponse.isNotEmpty
                  ? Text(
                      _chatResponse,
                      style: TextStyle(fontSize: 16),
                    )
                  : Container(),
        ],
      ),
    );
  }
}
