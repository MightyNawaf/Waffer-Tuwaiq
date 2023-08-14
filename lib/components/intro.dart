
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:waffer/pages/home.dart';

class IntroScreenDefault extends StatefulWidget {
  const IntroScreenDefault({super.key});

  @override
  State<IntroScreenDefault> createState() => IntroScreenDefaultState();
}

class IntroScreenDefaultState extends State<IntroScreenDefault> {
  List<ContentConfig> listContentConfig = [];

  @override
  void initState() {
    super.initState();

    listContentConfig.add(
      const ContentConfig(
        title: "Waffer",
        styleTitle: TextStyle(
            color: Color.fromARGB(255, 6, 86, 151),
            fontWeight: FontWeight.w300,
            fontSize: 40),
        description: "Allows to know your balance ,income,outcome and more!",
        styleDescription:
            TextStyle(fontSize: 24, color: Color.fromARGB(255, 6, 86, 151)),
        pathImage: "assets/images/20943661.jpg",
        widthImage: 250,
        heightImage: 250,
        backgroundColor: Colors.white,
      ),
    );

    listContentConfig.add(
      const ContentConfig(
        title: "How to use it?",
        styleTitle: TextStyle(
            color: Color.fromARGB(255, 6, 86, 151),
            fontWeight: FontWeight.w300,
            fontSize: 40),
        description:
            "all you need to use waffer is add your budget then enter your purchess , transactions easily!",
        styleDescription:
            TextStyle(fontSize: 24, color: Color.fromARGB(255, 6, 86, 151)),
        pathImage: "assets/images/20945238.jpg",
        widthImage: 250,
        heightImage: 250,
        backgroundColor: Colors.white,
      ),
    );
  }

  void onDonePress() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyHomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      key: UniqueKey(),
      listContentConfig: listContentConfig,
      onDonePress: onDonePress,
    );
  }
}
