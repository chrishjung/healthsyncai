import 'package:flutter/material.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  Widget _sectionTile(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade200,
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String today =
        "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Icon(Icons.check_circle, color: Colors.green, size: 28),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Consultation Complete',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              today,
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _sectionTile('News'),
              _sectionTile('Consultation Summary'),
              _sectionTile('Treatment Updates'),
              _sectionTile('Your Progress'),
              _sectionTile('Follow Up Instructions'),
              _sectionTile('When To Contact Your Clinician'),
              _sectionTile('Continuous Monitoring'),
            ],
          ),
        ),
      ),
    );
  }
}
