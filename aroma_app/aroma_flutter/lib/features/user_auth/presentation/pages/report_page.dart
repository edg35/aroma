import 'package:flutter/material.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  String? smellType; // To store the selected smell type
  double severity = 1.0; // To store the selected severity rating

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report a Strange Smell'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Smell selection section
            DropdownButtonFormField<String>(
              value: smellType,
              hint: const Text('Select Smell Type'),
              items: const [
                DropdownMenuItem<String>(
                  value: 'Garbage',
                  child: Text('Garbage'),
                ),
                DropdownMenuItem<String>(
                  value: 'Sewage',
                  child: Text('Sewage'),
                ),
                DropdownMenuItem<String>(
                  value: 'Chemical',
                  child: Text('Chemical'),
                ),
                // Add more smell options here
                DropdownMenuItem<String>(
                  value: 'Other',
                  child: Text('Other'),
                ),
              ],
              onChanged: (value) => setState(() => smellType = value!),
            ),

            if (smellType == "Other")
              // Text field for custom smell type if "Other" is selected
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Enter Smell Description (optional)',
                ),
                onChanged: (value) => setState(() => smellType = value),
              ),

            const SizedBox(height: 16.0), // Add spacing

            // Severity rating section
            const Text('Severity (1 - Not Severe, 5 - Very Severe)'),
            Slider(
              value: severity,
              min: 1.0,
              max: 5.0,
              divisions: 4, // Show markers for each integer value (1-5)
              onChanged: (value) => setState(() => severity = value),
            ),

            const SizedBox(height: 16.0), // Add spacing

            // Optional description text field
            const TextField(
              decoration: InputDecoration(
                labelText: 'Additional Description (optional)',
              ),
              maxLines: 3, // Allow for multiple lines of text
            ),

            const SizedBox(height: 16.0), // Add spacing

            // Submit button
            ElevatedButton(
              onPressed: () {
                // Handle form submission (send report data)
                // You can add logic here to send the smellType, severity, and optional description to your backend service.
                // ignore: avoid_print
                print('Smell reported: $smellType, Severity: $severity');
              },
              child: const Text('Submit Report'),
            ),
          ],
        ),
      ),
    );
  }
}
