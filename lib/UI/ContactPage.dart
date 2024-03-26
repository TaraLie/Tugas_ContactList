import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/DetailContact.dart';
import 'package:flutter_application_1/UI/FormContact.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> _filteredContactList = List.from(contactList);

  @override
  void initState() {
    _searchController.addListener(() {
      filterContacts();
    });
    super.initState();
  }

  void filterContacts() {
    setState(() {
      if (_searchController.text.isEmpty) {
        _filteredContactList = List.from(contactList);
        return;
      }
      _filteredContactList = contactList
          .where((contact) =>
              contact['name']!.toLowerCase().contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Kontak'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FormContact(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Cari Kontak',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: _filteredContactList.isEmpty
                ? Center(child: Text('Tidak ada kontak'))
                : ListView.separated(
                    itemCount: _filteredContactList.length,
                    separatorBuilder: (context, index) => Divider(),
                    itemBuilder: (context, index) {
                      final contact = _filteredContactList[index];
                      return ContactItem(
                        name: contact['name']!,
                        phoneNumber: contact['phoneNumber']!,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailContact(
                                name: contact['name'],
                                phoneNumber: contact['phoneNumber'],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class ContactItem extends StatelessWidget {
  final String name;
  final String phoneNumber;

  const ContactItem({
    Key? key,
    required this.name,
    required this.phoneNumber, required Null Function() onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(Icons.person),
        // Placeholder for profile photo
      ),
      title: Text(
        name,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        phoneNumber,
        style: TextStyle(
          color: Colors.grey[600],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailContact(
              name: name,
              phoneNumber: phoneNumber,
            ),
          ),
        );
      },
    );
  }
}

// Dummy contact data
List<Map<String, String>> contactList = [
  {"name": "Tara", "phoneNumber": "08123456789"},
  {"name": "Skyla", "phoneNumber": "08234567890"},
  {"name": "Chelyne", "phoneNumber": "08345678901"},
  {"name": "Johnny", "phoneNumber": "08456789012"},
  {"name": "Mark", "phoneNumber": "08567890123"},
  {"name": "Jaehyun", "phoneNumber": "08678901234"},
  {"name": "Jeno", "phoneNumber": "08789012345"},
  {"name": "Jaemin", "phoneNumber": "08890123456"},
  {"name": "Haechan", "phoneNumber": "08901234567"},
  {"name": "Dohyun", "phoneNumber": "09012345678"},
  {"name": "Yeonjun", "phoneNumber": "08678901234"},
  {"name": "Soobin", "phoneNumber": "08789012345"},
  {"name": "Taehyun", "phoneNumber": "08890123456"},
  {"name": "Hueningkai", "phoneNumber": "08901234567"},
  {"name": "Beomgyu", "phoneNumber": "09012345678"},
];