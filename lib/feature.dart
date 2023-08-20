import 'package:flutter/cupertino.dart';
import 'package:gpt_v2/pallete.dart%20%20';

class FeatureWidget extends StatelessWidget {
  const FeatureWidget({Key? key, required this.color, required this.title, required this.description}) : super(key: key);

  final Color color;
  final String title;
  final String description;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 14),
      decoration:  BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(16.0)
        )
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0,left: 15.0,bottom: 20.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
                child: Text(title,style: const TextStyle(fontFamily: 'Cera pro',color: Pallete.blackColor,fontWeight: FontWeight.bold,fontSize: 20.0),)),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Text(description,style: const TextStyle(fontFamily: 'Cera pro',color: Pallete.blackColor,fontWeight: FontWeight.w400,fontSize: 14.0),),
            )

          ],
        ),
      ),
    );
  }
}
