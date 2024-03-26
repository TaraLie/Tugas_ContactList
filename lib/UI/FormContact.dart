import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/DetailContact.dart';

class FormContact extends StatefulWidget {
  const FormContact({Key? key}) : super(key: key);

  @override
  _FormContactState createState() => _FormContactState();
}

class _FormContactState extends State<FormContact> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Kontak'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nama',
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _phoneNumberController,
              decoration: const InputDecoration(
                labelText: 'Nomor Telepon',
              ),
              keyboardType: TextInputType.phone,
              // Validasi untuk memastikan input hanya berupa angka
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  if (int.tryParse(value) == null) {
                    return 'Masukkan nomor telepon yang valid';
                  }
                }
                return null;
              },
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                String name = _nameController.text;
                String phoneNumber = _phoneNumberController.text;

                // Check if both fields are not empty
                if (name.isNotEmpty && phoneNumber.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailContact(
                        name: name,
                        phoneNumber: phoneNumber,
                      ),
                    ),
                  );
                } else {
                  // Show a snackbar if any field is empty
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Harap lengkapi semua bidang')),
                  );
                }
              },
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }
}
