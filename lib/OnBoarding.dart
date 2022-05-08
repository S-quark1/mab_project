import 'package:flutter/material.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:tadam/main.dart';
import 'package:tadam/start.dart';

class Info extends StatefulWidget {
  const Info({Key? key}) : super(key: key);

  @override
  _Info createState() => _Info();
}

class _Info extends State<Info> {
  List<Slide>? slides = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    slides!.add(
      Slide(
        title: "Hello Cinema!",
        description:
            "The easiest way to find any movie you were looking for, or found with a single picture!",
        pathImage: "assets/image/slide1.jpg",
      ),
    );
    slides!.add(
      Slide(
        title: "Quick and Convinient",
        description:
            "Now you won’t have to spend time searching for one movie like before. Your search,"
                "under your hands. Save time!",
        pathImage: "assets/image/slide2.jpg",
      ),
    );
    slides!.add(
      Slide(
        title: "Try us now!",
        description: "Just tadam your picture, and our server will find you its name. Your search history, will be available only to both of us! ",
        pathImage: "assets/image/slide3.jpg",
      ),
    );
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = [];
    for (int i = 0; i < slides!.length; i++) {
      Slide noon = slides![i];
      tabs.add(
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Container(
            margin: const EdgeInsets.only(bottom: 160, top: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(),
                  child: Image.asset(
                    noon.pathImage!,
                    height: 200,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Text(
                    noon.title!,
                    style:
                        const TextStyle(fontSize: 30, fontFamily: 'Zagolovok'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Text(
                    noon.description!,
                    style: const TextStyle(
                        fontSize: 14, height: 1.5, fontFamily: 'Shrift'),
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                  margin: const EdgeInsets.only(
                    top: 15,
                    left: 20,
                    right: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      backgroundColorAllSlides: Colors.white,
      renderSkipBtn: const Text(
        "SKIP",
        style: TextStyle(color: Colors.black, fontFamily: 'Shrift'),
      ),
      renderNextBtn: const Icon(
        Icons.navigate_next,
        color: Colors.black,
      ),
      renderDoneBtn: const Icon(
        Icons.done,
        color: Colors.black,
      ),
      colorDot: Colors.black,
      colorActiveDot: Colors.black,
      sizeDot: 8.0,
      typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,
      listCustomTabs: renderListCustomTabs(),
      scrollPhysics: const BouncingScrollPhysics(),
      onDonePress: () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const MyHomePage(
            title: '',
          ),
        ),
      ),
    );
  }
}
