import 'package:flutter/material.dart';
import 'package:get_movie/views/search_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Node server demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const SearchPage(),
      // home: Scaffold(
      //   appBar: AppBar(title: Text('Flutter Client')),
      //   body: BodyWidget(),
      // ),
    );
  }
}

// class BodyWidget extends StatefulWidget {
//   @override
//   BodyWidgetState createState() {
//     return new BodyWidgetState();
//   }
// }
//
// class BodyWidgetState extends State<BodyWidget> {
//   String serverResponse = 'Server response';
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Padding(
//       padding: const EdgeInsets.all(32.0),
//       child: Align(
//         alignment: Alignment.topCenter,
//         child: SizedBox(
//           width: 200,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               ElevatedButton(
//                 child: Text('Send request to server'),
//                 onPressed: () {
//                   _makeGetRequest();
//                 },
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(serverResponse),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   _makeGetRequest() async {
//     final url = Uri.parse(_localhost());
//     Response response = await get(url);
//     setState(() {
//       serverResponse = response.body;
//     });
//   }
//
//   String _localhost() {
//     if (Platform.isAndroid)
//       return 'http://10.0.2.2:3000';
//     else // for iOS simulator
//       return 'http://localhost:3000';
//   }
// }
