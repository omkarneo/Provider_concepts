import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_concept/Provider/chgpro/chgnotifier.dart';
import 'package:provider_concept/Provider/chgpro/mainchgpro.dart';
import 'package:provider_concept/Provider/futurepro/futureprovideer.dart';
import 'package:provider_concept/Provider/futurepro/mainfutpro.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  Future<User> getuser() async {
    await Future.delayed(const Duration(milliseconds: 3000));
    return User(username: "Omkar2");
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MyModel()),
        FutureProvider(
            create: (context) => getuser(),
            initialData: User(username: "Omkaar"))
      ],
      child: const MaterialApp(
        home: All(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class All extends StatefulWidget {
  const All({super.key});

  @override
  State<All> createState() => _AllState();
}

class _AllState extends State<All> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Provider')),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChgProvider(),
                    ));
              },
              child: const Text("Change Notifier Provider")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FtuProvider(),
                    ));
              },
              child: const Text("Future Provider")),
        ]),
      ),
    );
  }
}
