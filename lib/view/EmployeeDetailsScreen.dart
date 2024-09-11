import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model_view/Employee_model.dart'; 

class EmployeeDetailsScreen extends StatelessWidget {
  final EmployeeModel employee;
  const EmployeeDetailsScreen({
    super.key,
    required this.employee,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Details'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(employee.avatar, scale: 5),
                onBackgroundImageError: (exception, stackTrace) =>
                    const Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.teal),
              title: Text(employee.name,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('Name'),
            ),
            ListTile(
              leading: const Icon(Icons.email, color: Colors.teal),
              title: Text(employee.email ?? 'No Email',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('Email'),
            ),
            ListTile(
              leading: const Icon(Icons.phone, color: Colors.teal),
              title: Text(employee.mobile,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('Mobile'),
            ),
            ListTile(
              leading: const Icon(Icons.location_on, color: Colors.teal),
              title: Text(
                  '${employee.country}, ${employee.state}, ${employee.district}',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('Location'),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                ),
                onPressed: () {
                  Get.back();
                },
                child: const Text(
                  'Back to List',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
