import 'package:flutter/material.dart';

class BugPage extends StatelessWidget {
  const BugPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Bug Report'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Your bug report has been submitted.'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Report a bug'),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromRGBO(232, 234, 246, 1),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Text(
                'Please report any bugs you encounter here.',
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Your name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                minLines: 7,
                maxLines: 10,
                decoration: InputDecoration(
                  labelText: 'Bug description',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _showMyDialog,
                  child: const Text('Submit'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
