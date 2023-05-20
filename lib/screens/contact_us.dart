import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsPage extends StatelessWidget {
  final List<Map<String, String>> contributors = [
    {
      'name': 'Jinam Jain',
      'github': 'https://github.com/JJaguar657',
    },
    {
      'name': 'Parth Maheshwari',
      'github': 'https://github.com/maheshwariparth',
    },
    {
      'name': 'Tushar Kumar',
      'github': 'https://github.com/TUSHAR203',
    },
    {
      'name': 'Pragati Gupta',
      'github': 'https://github.com/poga0204',
    },
    {
      'name': 'Gaurav Singh',
      'github': 'https://github.com/CodeWithGauravSingh',
    },
  ];

  @override
  _sendEmail() async {
    final emailUri = Uri(
      scheme: 'mailto',
      path: 'infotohelpmeout@gmail.com',
      queryParameters: {
        'subject': 'Subject',
        'body': 'Body',
      },
    );
    if (await canLaunchUrl(Uri.parse(emailUri.toString()))) {
      await launchUrl(Uri.parse(emailUri.toString()));
    } else {
      throw 'Could not launch email';
    }
  }
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
        actions: [
          IconButton(onPressed: _sendEmail, icon: const Icon(Icons.mail_outline)),
        ],
      ),
      body: ListView.builder(
        itemCount: contributors.length,
        itemBuilder: (BuildContext context, int index) {
          final contributor = contributors[index];
          return ListTile(
            leading: Image.asset(
              'assets/github_icon.png',
              height: screenSize.height * 0.05,
              width: screenSize.height * 0.05,
            ),
            title: Text(contributor['name']!),
            subtitle: Text(contributor['github']!),
            onTap: () => launchUrl(Uri.parse(contributor['github']!)),
          );
        },
      ),
    );
  }
}