//21. Create an application like gmail and display Screens according to
// user selection and design each page with dummy data
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gmail Clone',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Email> emails = [
    Email('John Doe', 'Meeting tomorrow', 'Hey, let\'s meet tomorrow at 10 AM.'),
    Email('Jane Smith', 'Project update', 'Here is the latest update on the project.'),
    Email('Alice Johnson', 'Lunch invitation', 'Would you like to join for lunch today?'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inbox'),
      ),
      body: ListView.builder(
        itemCount: emails.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(emails[index].sender),
            subtitle: Text(emails[index].subject),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EmailDetailScreen(email: emails[index])),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ComposeEmailScreen()),
          );
        },
        child: Icon(Icons.mail),
      ),
    );
  }
}

class Email {
  final String sender;
  final String subject;
  final String body;

  Email(this.sender, this.subject, this.body);
}

class EmailDetailScreen extends StatelessWidget {
  final Email email;

  EmailDetailScreen({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(email.subject),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('From: ${email.sender}'),
            SizedBox(height: 8),
            Text('Subject: ${email.subject}'),
            SizedBox(height: 16),
            Text(email.body),
          ],
        ),
      ),
    );
  }
}

class ComposeEmailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compose Email'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'To'),
            ),
            SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(labelText: 'Subject'),
            ),
            SizedBox(height: 16),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Compose your email...'),
                maxLines: null,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _sendEmail(context);
          Navigator.pop(context); // Close the compose screen
        },
        child: Icon(Icons.send),
      ),
    );
  }
}
void _sendEmail(BuildContext context) {
  // In a real-world application, you would send the email to a server or use a third-party service.
  // For this example, we'll simulate sending by printing to the console.

  print('Email sent!');

  // Close the compose screen
  Navigator.pop(context);
}
