import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> emptyList = [];

  @override
  void initState() {
    super.initState();
    String value = emptyList.firstWhere((element) => element == 'a');
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crash Test'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Este app não irá funcionar. :D'),
            ElevatedButton(
              onPressed: () {},
              child: const Text('CRASH'),
            ),
          ],
        ),
      ),
    );
  }
}
