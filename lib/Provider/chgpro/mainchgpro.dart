import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_concept/Provider/chgpro/chgnotifier.dart';

class ChgProvider extends StatefulWidget {
  const ChgProvider({super.key});

  @override
  State<ChgProvider> createState() => _ChgProviderState();
}

class _ChgProviderState extends State<ChgProvider> {
  TextEditingController text = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // print(MyModel().count);
    return Scaffold(
      appBar: AppBar(title: const Text("Provider")),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Consumer<MyModel>(
            builder: (context, value, child) => Text("${value.count}")),
        Consumer<MyModel>(
          builder: (context, value, child) => Text(value.data),
        ),
        TextFormField(
          controller: text,
          decoration: InputDecoration(border: OutlineInputBorder()),
          onChanged: (value) {
            context.read<MyModel>().input(text.text);
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Provider.of<MyModel>(context, listen: false)
                      .increment(); // both will work
                  // context.read<MyModel>().increment();
                },
                child: Text(
                    'Increment ${Provider.of<MyModel>(context, listen: false).count}')),
            Consumer<MyModel>(
              builder: (context, value, child) => ElevatedButton(
                  onPressed: () {
                    // value.increment();
                    Provider.of<MyModel>(context, listen: false).increment();
                  },
                  child: Text('Increment ${value.count}')),
            ),
            Consumer<MyModel>(
              builder: (context, value, child) => ElevatedButton(
                  onPressed: () {
                    value.decrement();
                    // Provider.of<MyModel>(context, listen: false).decrement();
                  },
                  child: Text('Decrement ${value.count}')),
            ),
          ],
        )
      ])),
    );
  }
}
