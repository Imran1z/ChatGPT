import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'openai_service.dart';

class DallEScreen extends StatefulWidget {
  const DallEScreen({Key? key}) : super(key: key);

  @override
  State<DallEScreen> createState() => _DallEScreenState();
}

class _DallEScreenState extends State<DallEScreen> {


  final OpenAIService openAIService = OpenAIService();
  String? generatedImageUrl;

  final dallEController=TextEditingController();
  bool isButtonPressed = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: BounceInDown(child: const Text("Dall-E"))),
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
                      fit: BoxFit.contain, // Adjust the fit as needed
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
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SingleChildScrollView(
                  child: TextField(
                    controller: dallEController,
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: 'type your command',
                      suffixIcon: InkWell(
                        onTap: () async {
                          setState(() {
                            isButtonPressed = true;
                          });

                          String inputText = dallEController.text;
                          if (inputText.isNotEmpty) {
                            final result = await openAIService.dallEAPI(inputText);
                            generatedImageUrl = result;
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



////////////////////////////////////////////////////////The Image will be appear here Section////////////////////////////////////////////////////////
            if(generatedImageUrl!=null)Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.network(generatedImageUrl!)),
            ),
          ],
        ),
      ),
    );
  }
}
