import 'package:flutter/material.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  String? smellType; // To store the selected smell type
  double severity = 1.0; // To store the selected severity rating
  bool _isSubmitting = false; // To handle loading icon on button click
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report a Strange Smell'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
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

            /* if (smellType == "Other")
              // Text field for custom smell type if "Other" is selected // Add spacing
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter Smell Description (optional)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (value) => setState(() => smellType = value),
                ),
              ),
            */

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
            //TODO: change this to form_container_widget and update the widget
            /* 
            the widget should have a parameter for maxlines, and outlineinput
            border. Change to make it as reusable as possible. Look into custom 
            slider and dropdown widget as well.
            */
            TextField(
              decoration: InputDecoration(
                labelText: 'Additional Description (optional)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              maxLines: 2, // Allow for multiple lines of text
              controller: descriptionController,
            ),

            const SizedBox(height: 16.0), // Add spacing

            // Submit button
            GestureDetector(
              onTap: _submitReport,
              child: Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue,
                ),
                child: Center(
                  child: _isSubmitting
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          "Submit Report",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitReport() async {
    setState(() {
      _isSubmitting = true;
    });

    String description = descriptionController.text;
    // ignore: avoid_print
    print("Submitting report... $smellType, $severity, $description");

    setState(() {
      _isSubmitting = false;
    });
  }
}
