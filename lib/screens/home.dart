import 'package:flutter/material.dart';
import 'package:job_seeker/screens/task_one/task_one.dart';
import 'package:job_seeker/screens/task_two/task_two.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TaskOne(),
                      ));
                },
                child: Text('Task 1')),
            ElevatedButton(
                onPressed: () {
                   Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TaskTwo(),
                      ));
                },
                child: Text('Task 2'))
          ],
        ),
      ),
    );
  }
}
