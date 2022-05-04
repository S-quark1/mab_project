import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SecondRoute extends StatefulWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  State<SecondRoute> createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  List newList = [];

  void initFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  @override
  void initState() {
    super.initState();
    initFirebase();
    // newList.addAll(['Test1', 'Test 2', 'Test3']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 60,
        elevation: 0,
        title: Row(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: IconButton(
                  onPressed: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    } else {
                      SystemNavigator.pop();
                    }
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                )),
            const Padding(
              padding: EdgeInsets.only(top: 5.0, left: 5.0),
              child: Text(
                "Updates",
                style: TextStyle(
                    fontSize: 23, fontFamily: "Zagolovok", color: Colors.black),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('news').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(
                'No News',
                style: TextStyle(
                  fontSize: 45,
                ),
              ),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Card(
                  elevation: 400,
                    shadowColor: Colors.purpleAccent,
                    child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      snapshot.data!.docs[index].get('title'),
                      style: const TextStyle(
                        fontFamily: 'Zagolovok',
                        fontSize: 25,
                      ),
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
                    child: Text(snapshot.data!.docs[index].get('subtitle')),
                  ),
                )),
              );
            },
          );
        },
      ),
    );
  }
}
