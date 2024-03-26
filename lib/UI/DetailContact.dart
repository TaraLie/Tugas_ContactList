import 'package:flutter/material.dart';

class DetailContact extends StatelessWidget {
  final String? name;
  final String? phoneNumber;

  const DetailContact({
    Key? key,
    this.name,
    this.phoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Kontak'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Align items at the top
          crossAxisAlignment: CrossAxisAlignment.center, // Center items horizontally
          children: [
            SizedBox(height: 16),
            CircleAvatar(
              radius: 50,
              child: Icon(Icons.person), // Placeholder for profile photo
            ),
            SizedBox(height: 16),
            Text(
              'Nama:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(name ?? ''),
            SizedBox(height: 16),
            Text(
              'Nomor Telepon:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(phoneNumber ?? ''),
          ],
        ),
      ),
    );
  }
}
