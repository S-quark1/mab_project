import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Information extends StatefulWidget {
  const Information({Key? key}) : super(key: key);

  @override
  State<Information> createState() => _CreatorsState();
}

class NoToGlow extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

_launchURLApp(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class _CreatorsState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
        behavior: NoToGlow(),
        child: ListView(
          children: [
            Image.asset(
              'assets/image/logotadam.png',
              height: 250,
            ),
            const Text(
              'Calling Version: 2022.04.15.01.100',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Infoblock',
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Tadam Corporation \nCopyright @2022',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontFamily: 'Infoblock'),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15.0),
                const Padding(
                  padding: EdgeInsets.only(top: 15.0, left: 15.0),
                  child: Text(
                    "Account",
                    style: TextStyle(
                        fontSize: 19,
                        fontFamily: 'Zagolovok',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15.0, left: 15.0),
                  child: Text(
                    "Name",
                    style: TextStyle(fontSize: 17.5, fontFamily: 'Zagolovok'),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                const Padding(
                    padding: EdgeInsets.only(top: 1.0, left: 15.0),
                    child: Text(
                      "Your Name and Surname",
                      style: TextStyle(
                        fontSize: 17.5,
                      ),
                    )),
                const SizedBox(
                  height: 10.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15.0, left: 15.0),
                  child: Text(
                    "Email",
                    style: TextStyle(fontSize: 17.5, fontFamily: 'Zagolovok'),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 1.0, left: 15.0),
                  child: Text(
                    "youremail@gmail.com",
                    style: TextStyle(
                      fontSize: 17.5,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15.0, left: 15.0),
                  child: Text(
                    "About",
                    style: TextStyle(
                        fontSize: 19,
                        fontFamily: 'Zagolovok',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15.0, left: 15.0),
                  child: Text(
                    "Version",
                    style: TextStyle(fontSize: 17.5, fontFamily: 'Zagolovok'),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                const Padding(
                    padding: EdgeInsets.only(top: 1.0, left: 15.0),
                    child: Text(
                      "1.01.001",
                      style: TextStyle(
                        fontSize: 17.5,
                      ),
                    )),
                const SizedBox(
                  height: 10.0,
                ),
                FlatButton(
                    onPressed: (() => _launchURLApp(
                        'https://www.termsfeed.com/live/b3e3cb4f-63d6-4d48-b171-d4f20a16f589')),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(top: 15.0),
                          child: Text(
                            "Terms and Conditions",
                            style: TextStyle(
                                fontSize: 17.5, fontFamily: 'Zagolovok'),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 1.0),
                          child: Text(
                            "All the stuff you need to know",
                            style: TextStyle(
                              fontSize: 17.5,
                            ),
                          ),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 10.0,
                ),
                // ignore: deprecated_member_use
                FlatButton(
                    onPressed: (() => _launchURLApp(
                        'https://www.freeprivacypolicy.com/live/55f361c0-e12d-4a77-a512-d02cc55cd208')),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(top: 15.0),
                          child: Text(
                            "Privacy Policy",
                            style: TextStyle(
                                fontSize: 17.5, fontFamily: 'Zagolovok'),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 1.0),
                          child: Text(
                            "Important for both of us",
                            style: TextStyle(
                              fontSize: 17.5,
                            ),
                          ),
                        ),
                      ],
                    )),
                const SizedBox(height: 15.0),
                const Padding(
                  padding: EdgeInsets.only(top: 15.0, left: 15.0),
                  child: Text(
                    "Creators",
                    style: TextStyle(
                        fontSize: 19,
                        fontFamily: 'Zagolovok',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15.0, left: 15.0),
                  child: Text(
                    "Abdullayev Meirkhan",
                    style: TextStyle(fontSize: 17.5, fontFamily: 'Zagolovok'),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                const Padding(
                    padding: EdgeInsets.only(top: 1.0, left: 15.0),
                    child: Text(
                      "Front-End Developer",
                      style: TextStyle(
                        fontSize: 17.5,
                      ),
                    )),
                const SizedBox(
                  height: 10.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15.0, left: 15.0),
                  child: Text(
                    "Binara Kuanysheva",
                    style: TextStyle(fontSize: 17.5, fontFamily: 'Zagolovok'),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                const Padding(
                    padding: EdgeInsets.only(top: 1.0, left: 15.0),
                    child: Text(
                      "Back-End Developer",
                      style: TextStyle(
                        fontSize: 17.5,
                      ),
                    )),
                const SizedBox(
                  height: 15.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15.0, left: 15.0),
                  child: Text(
                    "Useful Links",
                    style: TextStyle(
                        fontSize: 19,
                        fontFamily: 'Zagolovok',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                FlatButton(
                    onPressed: (() => _launchURLApp(
                        "https://github.com/S-quark1/mab_project")),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(top: 15.0),
                          child: Text(
                            "GitHub",
                            style: TextStyle(
                                fontSize: 17.5, fontFamily: 'Zagolovok'),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 1.0),
                            child: Text(
                              "Our code that you can use for your purposes",
                              style: TextStyle(
                                fontSize: 17.5,
                              ),
                            )),
                      ],
                    )),
                SizedBox(
                  height: 10.0,
                ),
                FlatButton(
                    onPressed: (() =>
                        _launchURLApp("https://t.me/+w2yWIx3kgYI0MWNi")),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(top: 15.0),
                          child: Text(
                            "Telegram",
                            style: TextStyle(
                                fontSize: 17.5, fontFamily: 'Zagolovok'),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 1.0),
                            child: Text(
                              "The latest version of the app, and the news",
                              style: TextStyle(
                                fontSize: 17.5,
                              ),
                            )),
                      ],
                    )),
                const SizedBox(
                  height: 15.0,
                ),
              ],
            )
          ],
        ));
  }
}
