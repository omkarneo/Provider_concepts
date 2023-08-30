import 'package:flutter/material.dart';
import 'package:provider_concept/Provider/chgpro/chgnotifier.dart';
import 'package:provider/provider.dart';
import 'package:provider_concept/Provider/futurepro/futureprovideer.dart';

class FtuProvider extends StatefulWidget {
  const FtuProvider({super.key});

  @override
  State<FtuProvider> createState() => _FtuProviderState();
}

class _FtuProviderState extends State<FtuProvider> {
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("${Provider.of<MyModel>(context, listen: false).count}")),
      body: Center(
        child: Consumer<User>(
            builder: (context, value, child) => Text("${value.username}")),
      ),
    );
  }
}
