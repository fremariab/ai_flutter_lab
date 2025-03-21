// Importing the json package to handle JSON encoding and decoding
import 'dart:convert';
// Importing the http package to send HTTP requests
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

// Function to fetch travel recommendations for a given destination
Future<String> getTravelRecommendations(String prompt) async {
  // API key for authenticating the request.
  const geminiAPIKey = 'AIzaSyCabcLexlRoEoWrCoSMiwUrSl6dOFC2qBE';
  // Gemini API endpoint with the API key as a query parameter to send requests
  const url =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=$geminiAPIKey';
  debugPrint("1 WORKING");

  // Sending a POST request to the OpenAI API with the necessary headers and body content
  final response = await http.post(
      // Parse the URL to get the correct endpoint
      Uri.parse(url),
      headers: {
        // Specify that the body content is in JSON format
        "Content-Type": "application/json",
      },
      // Request body in JSON format specifying the model and message content
      body: jsonEncode({
        // Use model for processing
        "contents": [
          {
            "parts": [
              {
                "text": prompt,
              }
            ]
          }
        ]
      }));
  debugPrint("2 WORKING");
  debugPrint("${response.statusCode}");

  // Check if the response status is 200 (OK), meaning the request was successful
  if (response.statusCode == 200) {
    debugPrint("3 WORKING");

    debugPrint("Response status: ${response.statusCode}");
    debugPrint("Response body: ${response.body}");

    // If successful, return the content from the response body
    return jsonDecode(response.body)['candidates'][0]['content']['parts'][0]
        ['text'];
  } else {
    debugPrint("NOT WORKING");

    // If there's an error, throw an exception with a failure message
    throw Exception("Failed to fetch travel recommendations");
  }
}
