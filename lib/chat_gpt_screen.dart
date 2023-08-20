import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gpt_v2/pallete.dart%20%20';

import 'openai_service.dart';

class ChatGPT extends StatefulWidget {
  const ChatGPT({Key? key}) : super(key: key);

  @override
  State<ChatGPT> createState() => _ChatGPTState();
}

class _ChatGPTState extends State<ChatGPT> {
  final OpenAIService openAIService = OpenAIService();
  final chatGPTController = TextEditingController();
  String? generatedContent;
  bool isButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: BounceInDown(child: const Text("ChatGPT"))),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
////////////////////////////////////////////////////////Image Logo Section////////////////////////////////////////////////////////
            ZoomIn(
              child: Center(
                child: Container(
                  height: 120,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/bot.png',),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),



////////////////////////////////////////////////////////The TextField Section////////////////////////////////////////////////////////
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding:EdgeInsets.symmetric(horizontal: 20) ,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SingleChildScrollView(
                  child: TextField(
                    controller: chatGPTController,
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: 'type your command',
                      suffixIcon: InkWell(
                        onTap: () async {
                          setState(() {
                            isButtonPressed = true;
                          });
////////////////////////////////////////////////////////To get the Generated text from the Api////////////////////////////////////////////////////////

                          String inputText = chatGPTController.text;
                          if (inputText.isNotEmpty) {
                            final result = await openAIService.chatGPTAPI(inputText);
                            generatedContent = result;
                          }

                          Future.delayed(Duration(milliseconds: 500), () {
                            setState(() {
                              isButtonPressed = false;
                            });
                          });
                        },
                        child: Pulse(
                          duration: Duration(milliseconds: 300),
                          child: Icon(
                            Icons.search,
                            color: isButtonPressed ? Colors.blue : Colors.grey.shade600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),



////////////////////////////////////////////////////////The text bubble Section////////////////////////////////////////////////////////
            FadeInRight(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                margin: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20).copyWith(
                  top: 30,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: Colors.black),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: SingleChildScrollView(
                    child: SelectableText(
                      generatedContent ?? 'Good morning, how may I help you',
                      style: TextStyle(
                        color: Pallete.mainFontColor,
                        fontSize: generatedContent == null ? 25 : 18,
                        fontFamily: 'Cera pro',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
