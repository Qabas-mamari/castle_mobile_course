import 'package:castle_mobile_course/Data/DatabaseHelper.dart';
import 'package:castle_mobile_course/Data/app_info_list.dart.txt';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:castle_mobile_course/BottomPart.dart';
import 'package:firebase_database/firebase_database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //DatabaseReference dbRef = FirebaseDatabase.instance.ref();

  // if(fortList.isNotEmpty){
  //   DatabaseHelper.createDataFirebaseRealtimeWithUniqueID("Castle3", fortList);
  // }else{
  //   print("Data can't therefore be saved into Firebase");
  // }
  //createDataFirebaseRealtime(dbRef);
  //createDataFirebaseRealtimeWithUniqueID(dbRef);
  //ReadDataFirebaseRealtime(dbRef);
  runApp(MyApp());
}




void createDataFirebaseRealtime(DatabaseReference dbRef) {
  dbRef.child("Castles").set(fortList).whenComplete(() => print("Data successfully saved in firebase!"));

}


class MyApp extends StatelessWidget {
  //final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const BottomPart(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String bar_title;

  const MyHomePage({super.key, required this.bar_title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("SQU !")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Name',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  'Country',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  'Age',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                //const Image(image: AssetImage("assets/img/3.jpg")),
                // Image(image: "/assets/img/3.jpg"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '====',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  '======',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  '===',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                //const Image(image: AssetImage("assets/img/3.jpg")),
                // Image(image: "/assets/img/3.jpg"),
              ],
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Text(
                  'Qabas',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
                  //style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  'Oman',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
                ),
                Text(
                  '23',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
                ),
                //const Image(image: AssetImage("assets/img/3.jpg")),
                // Image(image: "/assets/img/3.jpg"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Text(
                  'Hamed',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
                ),
                Text(
                  'KSA',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
                ),
                Text(
                  '23',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
                ),
                //const Image(image: AssetImage("assets/img/3.jpg")),
                // Image(image: "/assets/img/3.jpg"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Text(
                  'Ali',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
                ),
                Text(
                  'Qater',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
                ),
                Text(
                  '18',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
                ),
                //const Image(image: AssetImage("assets/img/3.jpg")),
                // Image(image: "/assets/img/3.jpg"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Text(
                  'Salim',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
                ),
                Text(
                  'UAE',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
                ),
                Text(
                  '40',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
                ),
                //const Image(image: AssetImage("assets/img/3.jpg")),
                // Image(image: "/assets/img/3.jpg"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
