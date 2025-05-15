import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeechService {
  final FlutterTts _tts = FlutterTts();

  // Initialize the TTS settings
  Future<void> initialize() async {
    await _tts.setLanguage("en-US");
    await _tts.setPitch(1.0);
  }

  // Speak the provided text
  Future<void> speak(String text) async {
    await initialize(); // Ensure settings are applied
    await _tts.speak(text);
  }

  // Stop speaking
  Future<void> stop() async {
    await _tts.stop();
  }

  // Set the language
  Future<void> setLanguage(String language) async {
    await _tts.setLanguage(language);
  }

  // Set the pitch
  Future<void> setPitch(double pitch) async {
    await _tts.setPitch(pitch);
  }
}
