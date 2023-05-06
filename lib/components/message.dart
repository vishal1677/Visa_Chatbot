import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:visachatbot/components/recommendation.dart';
import '../models/user_model.dart';
import '../sign_In/sign_in_screen.dart';

void main() {
  runApp(Chat());
}

class Chat extends StatefulWidget {
  static String routeName = "/messaging";
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  final storage = new FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.notification_add_outlined),
            onPressed: () async => {
              // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>MobileLogin()), (route) => false)
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => RecommendSystem()),
                  (route) => false)
            },
            color: Colors.black,
          ),
          backgroundColor: Colors.teal,
          elevation: 0.0,
          centerTitle: true,
          title: const Text(
            "Visa Chat Bot",
            style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async => {
                await FirebaseAuth.instance.signOut(),
                await storage.delete(key: "uid"),
                // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>MobileLogin()), (route) => false)
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => SignInScreen()),
                    (route) => false)
              },
              color: Colors.black,
            ),
          ]),
      body: Home(),
      //bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
    ;
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Press the button and start speaking';
  double _confidence = 1.0;
  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    super.initState();
  }

  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: AvatarGlow(
        animate: _isListening,
        glowColor: Theme.of(context).primaryColor,
        endRadius: 25.0,
        duration: const Duration(milliseconds: 2000),
        repeatPauseDuration: const Duration(milliseconds: 100),
        repeat: true,
        child: FloatingActionButton(
          backgroundColor: Colors.teal,
          onPressed: _listen,
          child: Icon(_isListening ? Icons.mic : Icons.mic_none),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 55),
        child: Column(
          children: [
            Container(
              child: Text(
                _text,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(
              width: 100,
            ),
            Expanded(child: MessagesScreen(messages: messages)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: _controller,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w400),
                  )),
                  IconButton(
                      onPressed: () {
                        if (_controller == null) {
                          sendMessage(_text);
                        } else {
                          sendMessage(_controller.text);
                          _controller.clear();
                        }
                      },
                      icon: Icon(Icons.send))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(
            () {
              _controller.text = val.recognizedWords;
              if (val.hasConfidenceRating && val.confidence > 0) {
                _confidence = val.confidence;
              }
            },
          ),
        );
      }
    } else {
      setState(() {
        _isListening = false;
      });
      _speech.stop();
      // sendMessage(_text);
    }
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      print('Message is empty');
    } else {
      setState(() {
        addMessage(Message(text: DialogText(text: [text])), true);
      });

      // DetectIntentResponse response = await dialogFlowtter.detectIntent(
      //     queryInput: QueryInput(text: TextInput(text: text)));
      // final request = http.MultipartRequest("POST",
      //     Uri.parse("https://f7c7-115-248-146-117.in.ngrok.io/give_answer"));
      // final headers = {"Content-type": "multipart/form-data"};
      var url = "https://a802-115-248-146-117.in.ngrok.io/give_answer";
      var body = {'text': _controller.text};
      var response = await http.post(Uri.parse(url), body: body);
      Map<String, dynamic> responseBody = jsonDecode(response.body);

      print(responseBody);
      if (responseBody == null) return;
      setState(() {
        // messages.add({'message': responseBody['answer'], 'isUserMessage': true});
        addMessage(
            Message(text: DialogText(text: [responseBody['answer']])), false);
      });
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }
}

class MessagesScreen extends StatefulWidget {
  final List messages;
  const MessagesScreen({Key? key, required this.messages}) : super(key: key);

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return ListView.separated(
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: widget.messages[index]['isUserMessage']
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(
                            20,
                          ),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(
                              widget.messages[index]['isUserMessage'] ? 0 : 20),
                          topLeft: Radius.circular(
                              widget.messages[index]['isUserMessage'] ? 20 : 0),
                        ),
                        color: widget.messages[index]['isUserMessage']
                            ? Colors.teal
                            : Colors.orange.withOpacity(0.9)),
                    constraints: BoxConstraints(maxWidth: w * 2 / 3),
                    child:
                        Text(widget.messages[index]['message'].text.text[0])),
              ],
            ),
          );
        },
        separatorBuilder: (_, i) => Padding(padding: EdgeInsets.only(top: 10)),
        itemCount: widget.messages.length);
  }
}
