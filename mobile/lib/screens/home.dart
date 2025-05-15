import 'package:flutter/material.dart';
import '../services/text_to_speech_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextToSpeechService _ttsService = TextToSpeechService();
  final String _greetingText =
      'Hi there, I am your assistant, lets say something';

  @override
  void initState() {
    super.initState();
    // Speak the greeting when the page loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _ttsService.speak(_greetingText);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/gifs/assistant.gif',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            Text(
              'Listening...',
              style: TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 105, 100, 141),
              ),
            ),
            GestureDetector(
              onTap: () {
                _ttsService.speak(_greetingText);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  _greetingText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Stop any ongoing speech when leaving the page
    _ttsService.stop();
    super.dispose();
  }
}
