import 'package:flutter/material.dart';

import '../reusable_components/custom_elevated_button.dart';
import '../reusable_components/custom_text_form_field.dart';

class ContactsScreen extends StatefulWidget {
  static const String route = 'Contacts App';
  ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List<Map<String, String>> _contacts = [];

  // adding contacts if list is less than 3
  void _addContact() {
    if (_nameController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty &&
        _contacts.length < 3) {
      setState(() {
        _contacts.add({
          'name': _nameController.text,
          'phone': _phoneController.text,
        });
        _nameController.clear();
        _phoneController.clear();
      });
    } else if (_contacts.length >= 3) {
      _showContactLimitMessage();
    }
  }

  //remove  specific contact
  void _deleteContact(int index) {
    setState(() {
      _contacts.removeAt(index);
    });
  }

  bool _canDelete(int index) => _contacts.isNotEmpty;

  // it will show that you want to enter more than 3 contact
  void _showContactLimitMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Maximum number of contacts reached.'),
        duration: Duration(seconds: 2),
      ),
    );
    _nameController.clear();
    _phoneController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: const Text(
          'Contacts App',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        color: Colors.grey,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                controller: _nameController,
                inputType: TextInputType.name,
                suffixIcon: Icons.edit,
                hintText: 'Enter Your Name',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a Number';
                  }
                  return null;
                },
                controller: _phoneController,
                inputType: TextInputType.phone,
                suffixIcon: Icons.phone,
                hintText: 'Enter Your Number',
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  CustomElevatedButton(
                    title: 'Add',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _addContact();
                      }
                    },
                    color: Colors.blueAccent,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (_, int index) => const Divider(
                    thickness: 5,
                    color: Colors.transparent,
                  ),
                  itemCount: _contacts.length,
                  itemBuilder: (context, index) {
                    final contact = _contacts[index];
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: InkWell(
                        child: ListTile(
                          title: Text(
                            'Name: ${contact['name']!}',
                            style: const TextStyle(fontSize: 20),
                          ),
                          subtitle: Text(
                            'Phone: ${contact['phone']!}',
                            style: const TextStyle(fontSize: 20),
                          ),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.redAccent,
                            ),
                            onPressed: _canDelete(index)
                                ? () {
                                    _deleteContact(index);
                                  }
                                : null,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
