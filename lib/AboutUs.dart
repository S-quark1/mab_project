import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  final List locale = [
    {'nameoflanguage': 'English', 'locale': Locale('en', 'US')},
    {'nameoflanguage': 'Russian', 'locale': Locale('ru', 'IN')},
  ];

  updateLanguage(Locale locale){
    Get.back();
    Get.updateLocale(locale);
  }

  builddialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: Text('choose'.tr),
            content: Container(
                width: double.maxFinite,
                child: ListView.separated(
                  shrinkWrap: true,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                            onTap: (){
                          updateLanguage(locale[index]['locale']);
                        },
                               child : Text(locale[index]['nameoflanguage'])),
                      );
                    },
                    separatorBuilder:(context,index){
                      return Divider(
                        color: Colors.transparent
                      );
                    },
                    itemCount: locale.length) // ListView.separated
                ), // Container
          ); // AlertDialog
        });
  }

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
            Text(
              'callingVersion'.tr,
              textAlign: TextAlign.center,
              style: const TextStyle(
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
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 15.0),
                  child: Text(
                    'account'.tr,
                    style: const TextStyle(
                        fontSize: 19,
                        fontFamily: 'Zagolovok',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 15.0),
                  child: Text(
                    'name'.tr,
                    style: const TextStyle(
                        fontSize: 17.5, fontFamily: 'Zagolovok'),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 1.0, left: 15.0),
                    child: Text(
                      'subname'.tr,
                      style: const TextStyle(
                        fontSize: 17.5,
                      ),
                    )),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 15.0),
                  child: Text(
                    'email'.tr,
                    style: const TextStyle(
                        fontSize: 17.5, fontFamily: 'Zagolovok'),
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
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 15.0),
                  child: Text(
                    'about'.tr,
                    style: const TextStyle(
                        fontSize: 19,
                        fontFamily: 'Zagolovok',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 15.0),
                  child: Text(
                    'version'.tr,
                    style: const TextStyle(
                        fontSize: 17.5, fontFamily: 'Zagolovok'),
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
                    onPressed: () {
                      builddialog(context);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Text(
                            'lang'.tr,
                            style: const TextStyle(
                                fontSize: 17.5, fontFamily: 'Zagolovok'),
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 1.0),
                          child: Text(
                            'sublang'.tr,
                            style: const TextStyle(
                              fontSize: 17.5,
                            ),
                          ),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 10.0,
                ),
                FlatButton(
                    onPressed: (() => _launchURLApp(
                        'https://www.termsfeed.com/live/b3e3cb4f-63d6-4d48-b171-d4f20a16f589')),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Text(
                            'terms'.tr,
                            style: const TextStyle(
                                fontSize: 17.5, fontFamily: 'Zagolovok'),
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 1.0),
                          child: Text(
                            'subterms'.tr,
                            style: const TextStyle(
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
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Text(
                            'privacy'.tr,
                            style: const TextStyle(
                                fontSize: 17.5, fontFamily: 'Zagolovok'),
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 1.0),
                          child: Text(
                            'subprivacy'.tr,
                            style: const TextStyle(
                              fontSize: 17.5,
                            ),
                          ),
                        ),
                      ],
                    )),
                const SizedBox(height: 15.0),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 15.0),
                  child: Text(
                    'creators'.tr,
                    style: const TextStyle(
                        fontSize: 19,
                        fontFamily: 'Zagolovok',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 15.0),
                  child: Text(
                    'meir'.tr,
                    style: const TextStyle(
                        fontSize: 17.5, fontFamily: 'Zagolovok'),
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
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 15.0),
                  child: Text(
                    'binara'.tr,
                    style: const TextStyle(
                        fontSize: 17.5, fontFamily: 'Zagolovok'),
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
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 15.0),
                  child: Text(
                    'links'.tr,
                    style: const TextStyle(
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
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Text(
                            'git'.tr,
                            style: const TextStyle(
                                fontSize: 17.5, fontFamily: 'Zagolovok'),
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 1.0),
                            child: Text(
                              'subgit'.tr,
                              style: const TextStyle(
                                fontSize: 17.5,
                              ),
                            )),
                      ],
                    )),
                const SizedBox(
                  height: 10.0,
                ),
                FlatButton(
                    onPressed: (() =>
                        _launchURLApp("https://t.me/+w2yWIx3kgYI0MWNi")),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Text(
                            'telegram'.tr,
                            style: const TextStyle(
                                fontSize: 17.5, fontFamily: 'Zagolovok'),
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 1.0),
                            child: Text(
                              'subtelegram'.tr,
                              style: const TextStyle(
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
