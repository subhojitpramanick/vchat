import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '17.09 TUE',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/call'),
              child: Text('+ Plan new call'),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    child: Text('M'),
                  ),
                  title: Text('Marketing Team'),
                  subtitle: Text('Meeting at 2:00 PM'),
                  trailing: Text('30 min'),
                  onTap: () => Navigator.pushNamed(context, '/chat'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
