import 'dart:math';
import 'dart:async';

import 'package:expense_track_vish/main.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

//void main() => runApp(SpeechMain());

class SpeechMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: Text('New Expense - Speech'),
          ),
          body: Speech2Text(),
        ),
      ),
    );
  }
}

class Speech2Text extends StatefulWidget {
  @override
  _Speech2TextState createState() => _Speech2TextState();
}

class _Speech2TextState extends State<Speech2Text> {
  bool _hasSpeech = false;
  double level = 0.0;
  double minSoundLevel = 50000;
  double maxSoundLevel = -50000;
  String lastWords = "";
  String lastError = "";
  String lastStatus = "";
  String _currentLocaleId = "en_IN";
  List<LocaleName> _localeNames = [];
  final SpeechToText speech = SpeechToText();

  @override
  void initState() {
    initSpeechState();
    super.initState();
  }

  Future<void> initSpeechState() async {
    bool hasSpeech = await speech.initialize(
        onError: errorListener, onStatus: statusListener);
    if (hasSpeech) {
      _localeNames = await speech.locales();

      var systemLocale = await speech.systemLocale();
      _currentLocaleId = systemLocale.localeId;
    }

    if (!mounted) return;

    setState(() {
      _hasSpeech = hasSpeech;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Recognized words',
                style: TextStyle(fontSize: 20),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                padding: EdgeInsets.all(5),
                //color: Colors.grey[300],
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    //border: RoundedRectangleBorder(borderRadius: 20),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  lastWords,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //     FlatButton(
                //       child: Text('Initialize'),
                //       onPressed: _hasSpeech ? null : initSpeechState,
                //     ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FloatingActionButton(
                      elevation: 3,
                      mini: true,
                      child: Icon(
                        Icons.cancel,
                      ),
                      backgroundColor: Colors.red,
                      onPressed: speech.isListening ? cancelListening : null,
                    ),
                    SizedBox(width: 10),
                    FloatingActionButton(
                      elevation: 20,
                      child: Icon(
                        Icons.mic,
                      ),
                      backgroundColor: Colors.green,
                      onPressed: !_hasSpeech || speech.isListening
                          ? null
                          : startListening,
                    ),
                    SizedBox(width: 10),
                    FloatingActionButton(
                      mini: true,
                      elevation: 3,
                      child: Icon(
                        Icons.stop,
                      ),
                      backgroundColor: Colors.blue,
                      onPressed: speech.isListening ? stopListening : null,
                    ),
                  ],
                ),
                // DropdownButton(
                //   onChanged: (selectedVal) => _switchLang(selectedVal),
                //   items: _localeNames
                //       .map((localeName) => DropdownMenuItem(
                //           value: localeName.localeId,
                //           child: Text(localeName.name)))
                //       .toList(),
                // )
              ],
            ),
          ),
        ),
        // Expanded(
        //   flex: 1,
        //   child: Column(
        //     children: <Widget>[
        //       Center(
        //         child: Text(
        //           'Error Message',
        //           style: TextStyle(fontSize: 22),
        //         ),
        //       ),
        //       Center(
        //         child: Text(
        //           lastError,
        //           textAlign: TextAlign.center,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          //color: Theme.of(context).backgroundColor,
          child: Center(
            child: speech.isListening
                ? Text(
                    "I'm listening...",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  )
                : Text(
                    'Not listening',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
          ),
        ),
      ],
    );
  }

  void startListening() {
    lastWords = "";
    lastError = "";
    speech.listen(
        onResult: resultListener,
        listenFor: Duration(seconds: 10),
        localeId: _currentLocaleId,
        onSoundLevelChange: soundLevelListener,
        cancelOnError: true,
        partialResults: true);
    setState(() {});
  }

  void stopListening() {
    speech.stop();
    setState(() {
      level = 0.0;
    });
  }

  void cancelListening() {
    speech.cancel();
    setState(() {
      level = 0.0;
    });
  }

  void resultListener(SpeechRecognitionResult result) {
    setState(() {
      lastWords = "${result.recognizedWords} - ${result.finalResult}";
    });
  }

  void soundLevelListener(double level) {
    minSoundLevel = min(minSoundLevel, level);
    maxSoundLevel = max(maxSoundLevel, level);
    //print("sound level $level: $minSoundLevel - $maxSoundLevel ");
    setState(() {
      this.level = level;
    });
  }

  void errorListener(SpeechRecognitionError error) {
    print("Received error status: $error, listening: ${speech.isListening}");
    setState(() {
      lastError = "${error.errorMsg} - ${error.permanent}";
    });
  }

  void statusListener(String status) {
    print(
        "Received listener status: $status, listening: ${speech.isListening}");
    setState(() {
      lastStatus = "$status";
    });
  }

  _switchLang(selectedVal) {
    setState(() {
      _currentLocaleId = selectedVal;
    });
    print(selectedVal);
  }
}
