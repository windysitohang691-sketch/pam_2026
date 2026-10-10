
import 'package:flutter/material.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  bool isOn = false;

  String selected = 'Flutter';
  final List<String> dropdownList = [
    'Flutter',
    'Dart',
    'Java',
    'Scala',
    'Python',
  ];

  String selectedGender = 'Female';
  String sex = 'male';
  bool isChecked = false;

  final TextEditingController textController =
      TextEditingController(text: 'Windy Bestari Sitohang');

  final TextEditingController birthDateController =
      TextEditingController(text: '2004-01-01');

  @override
  void dispose() {
    textController.dispose();
    birthDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PAM Minggu 5 - Form'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. TextField: Name
              TextField(
                maxLength: 21,
                controller: textController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Colors.blueGrey),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey),
                  ),
                  helperText: "What's your name?",
                ),
              ),

              const SizedBox(height: 12),

              // 2. Dropdown: Favorite Language
              Row(
                children: [
                  const Flexible(
                    child: Text('Your Favorite Language:'),
                  ),
                  const SizedBox(width: 8),
                  DropdownButton<String>(
                    value: selected,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 20,
                    style: TextStyle(color: Colors.blue.shade600),
                    items: dropdownList.map((language) {
                      return DropdownMenuItem<String>(
                        value: language,
                        child: Text(language),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      if (value != null) {
                        setState(() {
                          selected = value;
                        });
                      }
                    },
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // 3. Dropdown: Gender
              DropdownButtonFormField<String>(
                value: selectedGender,
                decoration: const InputDecoration(
                  labelText: 'Gender',
                  helperText: 'Your gender',
                ),
                items: ['Female', 'Male'].map((gender) {
                  return DropdownMenuItem<String>(
                    value: gender,
                    child: Text(gender),
                  );
                }).toList(),
                onChanged: (String? value) {
                  if (value != null) {
                    setState(() {
                      selectedGender = value;
                    });
                  }
                },
              ),

              const SizedBox(height: 12),

              // 4. Switch: Connect Instagram
              Row(
                children: [
                  const Text('Connect Instagram'),
                  const SizedBox(width: 8),
                  Switch(
                    value: isOn,
                    onChanged: (bool value) {
                      setState(() {
                        isOn = value;
                      });
                    },
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // 5. Radio: Gender
              Row(
                children: [
                  const Text('Gender:'),
                  const SizedBox(width: 8),
                  Radio<String>(
                    value: 'male',
                    groupValue: sex,
                    onChanged: (String? value) {
                      if (value != null) {
                        setState(() {
                          sex = value;
                        });
                      }
                    },
                  ),
                  const Text('Male'),
                  const SizedBox(width: 8),
                  Radio<String>(
                    value: 'female',
                    groupValue: sex,
                    onChanged: (String? value) {
                      if (value != null) {
                        setState(() {
                          sex = value;
                        });
                      }
                    },
                  ),
                  const Flexible(child: Text('Female')),
                ],
              ),

              const SizedBox(height: 8),

              // 6. Checkbox: Terms and Conditions
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    activeColor: Colors.blue,
                    onChanged: (bool? value) {
                      if (value != null) {
                        setState(() {
                          isChecked = value;
                        });
                      }
                    },
                  ),
                  const Expanded(
                    child: Text(
                      'Agree Term & Conditions',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // 7. Date Picker: Birth date
              InkWell(
                onTap: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );

                  debugPrint('pickedDate: $pickedDate');

                  if (pickedDate != null && mounted) {
                    setState(() {
                      birthDateController.text =
                          pickedDate.toString().split(' ')[0];
                    });
                  }
                },
                child: IgnorePointer(
                  child: TextField(
                    controller: birthDateController,
                    decoration: const InputDecoration(
                      labelText: 'Birth date',
                      helperText: "What's your birth date?",
                      suffixIcon: Icon(Icons.date_range),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueGrey),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}