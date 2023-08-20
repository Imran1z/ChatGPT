import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gpt_v2/chat_gpt_screen.dart';
import 'package:gpt_v2/dalle_screen.dart';
import 'package:gpt_v2/pallete.dart%20%20';

import 'feature.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int start =400;
  int delay=250;
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
                      image: AssetImage('assets/images/black_img.png',),
                      fit: BoxFit.contain, // Adjust the fit as needed
                    ),
                  ),
                ),
              ),
            ),



////////////////////////////////////////////////////////Some Text Section////////////////////////////////////////////////////////
            SlideInLeft(
              child: Container(
                  padding: EdgeInsets.all(20).copyWith(top: 20),
                  alignment: Alignment.centerLeft,
                  child: const Text('Here are some features',style: TextStyle(fontFamily:'Cera pro',fontSize: 18.0,fontWeight: FontWeight.bold,color: Pallete.mainFontColor),)
              ),
            ),



////////////////////////////////////////////////////////Features Section////////////////////////////////////////////////////////
            Column(
              children: [
                SlideInLeft(
                  delay: Duration(milliseconds: start),
                  child:const FeatureWidget(
                    color: Pallete.firstSuggestionBoxColor,
                    title: 'ChatGPT',
                    description: 'I am ChatGpt, I know you have heard about me',),
                ),
                SlideInLeft(
                  delay: Duration(milliseconds: start+delay),
                  child:const FeatureWidget(
                    color: Pallete.secondSuggestionBoxColor,
                    title: 'Dall-E',
                    description: 'I am Dall-E, I can create awesome pictures for you',),
                ),
                SlideInLeft(
                  delay: Duration(milliseconds: start+ 2* delay),
                  child: const FeatureWidget(
                    color: Pallete.firstSuggestionBoxColor,
                    title: 'Dual Assistance',
                    description: 'Get the best of both worlds with both assistants powered by Dall-E and ChatGPT',),
                ),

              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 80),
              child: Row(
                children: [
                  Expanded(child: ZoomIn(
                    delay: Duration(milliseconds: start+ 4 *delay),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:  Pallete.thirdSuggestionBoxColor,
                        foregroundColor: Pallete.mainFontColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0.0,
                        side: BorderSide(color: Colors.blue.shade800),
                        padding: EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const ChatGPT()));
                      },
                      child: const Text('Chat GPT'),
                    ),
                  )),
                  const SizedBox(
                    width: 40,
                  ),
                  Expanded(child: ZoomIn(
                    delay: Duration(milliseconds: start+ 5 *delay),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:  Pallete.thirdSuggestionBoxColor,
                        foregroundColor: Pallete.mainFontColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0.0,
                        side: BorderSide(color: Colors.blue.shade800),
                        padding: EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const DallEScreen()));
                      },
                      child: const Text('Dall-E'),
                    ),
                  ))

                ],
              ),
            )

          ],
        ),
      ),

    );
  }
}
