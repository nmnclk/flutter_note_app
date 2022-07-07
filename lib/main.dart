import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_note_app/controller/note_controller.dart';
import 'package:flutter_note_app/firebase_options.dart';
import 'package:flutter_note_app/root.dart';
import 'package:provider/provider.dart';
/*import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
*/
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //deneme

  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) {
        return NoteController();
      },
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Note App',
      home: Root(),
    );
  }
}
