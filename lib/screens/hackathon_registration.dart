import 'dart:io';

import 'package:collabworks/screens/organization_signup_screen.dart';
import 'package:collabworks/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'mainScaffold.dart';

class HackathonRegistrationScreen extends StatefulWidget {
  const HackathonRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<HackathonRegistrationScreen> createState() =>
      _HackathonRegistrationScreenState();
}

class _HackathonRegistrationScreenState
    extends State<HackathonRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _hackathonNameController = TextEditingController();
  final _hackathonDescriptionController = TextEditingController();
  final _hackathonStartDate = TextEditingController();
  String? region = 'APAC';

  @override
  void dispose() {
    _hackathonNameController.dispose();
    _hackathonDescriptionController.dispose();
    super.dispose();
  }

  Widget _buildForm() {
    String? requiredValidator(String? value) {
      if (value == null || value.isEmpty) {
        return "Please enter a Hackathon Name";
      }
      return null;
    }

    Null anyValidator(String? value) {
      return null;
    }

    return Column(
      children: [
        HackathonInputField(
          controller: _hackathonNameController,
          label: 'Hackathon Name',
          error: 'This field is required.',
          validator: requiredValidator,
          prefixIcon: const Icon(CupertinoIcons.profile_circled),
        ),
        const SizedBox(height: 20),
        HackathonInputField(
            controller: _hackathonDescriptionController,
            label: 'Hackathon Description',
            error: '',
            validator: anyValidator),
        const SizedBox(height: 20),
        DropdownButtonFormField(
            value: "NAEU",
            decoration: const InputDecoration(
              filled: true,
              fillColor: Color(0xFFb8c1ec),
              border: OutlineInputBorder(),
              counterStyle: TextStyle(color: Colors.white),
              labelStyle: TextStyle(color: Colors.white),
              hintText: 'Region',
            ),
            dropdownColor: Color(0xFFb8c1ec),
            style: TextStyle(
              color: Colors.white,
            ),
            items: const [
              DropdownMenuItem(value: "APAC", child: Text('APAC')),
              DropdownMenuItem(value: "NAEU", child: Text('NA/EU')),
            ],
            onChanged: ((value) {
              setState(() {
                region = value;
              });
            })),
        const SizedBox(height: 20),
        TextField(
          controller: _hackathonStartDate,
          decoration: const InputDecoration(
            filled: true,
            fillColor: Color(0xFFb8c1ec),
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.calendar_today),
            counterStyle: TextStyle(color: Colors.white),
            labelStyle: TextStyle(color: Colors.white),
            hintText: 'Start Date',
          ),
          style: TextStyle(
            color: Colors.white,
          ),
          onTap: () async {
            FocusScope.of(context).requestFocus(FocusNode());
            DateTime? date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100));
            if (date != null) {
              _hackathonStartDate.text = date.toString();
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ElevatedButton(
            onPressed: () {
              // Validate returns true if the form is valid, or false otherwise.
              if (_formKey.currentState!.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
                debugPrint(_formKey.currentState!.toString());
              }
            },
            child: const Text('Submit'),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        child: Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(top: 30, left: 20),
            child: Container(
              padding: const EdgeInsets.all(50),
              child: Column(children: [
                const Text("Register Hackathon",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
                const SizedBox(height: 20),
                Form(key: _formKey, child: _buildForm()),
              ]),
            )));
  }
}

class HackathonInputField extends StatelessWidget {
  const HackathonInputField({
    Key? key,
    required TextEditingController controller,
    required String label,
    required String error,
    required String? Function(String?) validator,
    Widget? prefixIcon,
  })  : _controller = controller,
        _label = label,
        _error = error,
        _prefixIcon = prefixIcon,
        _validator = validator,
        super(key: key);

  final TextEditingController _controller;
  final String _label;
  final String _error;
  final Widget? _prefixIcon;
  final String? Function(String?) _validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFb8c1ec),
        border: const OutlineInputBorder(),
        counterStyle: const TextStyle(color: Colors.white),
        labelStyle: const TextStyle(color: Colors.white),
        labelText: _label,
        prefixIcon: _prefixIcon,
      ),
      validator: _validator,
    );
  }
}
