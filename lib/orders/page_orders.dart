import 'package:flutter/material.dart';

class PageOrders extends StatelessWidget {
  const PageOrders({super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Container(
        width: 350,
        height: 360,
        decoration: BoxDecoration(
          color: Colors.white, // Set background color to white
          borderRadius:
              BorderRadius.circular(12), // Optional: add rounded corners
        ),
        padding: const EdgeInsets.all(16), // Add padding inside the container
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.end, // Align all content to the right
          children: [
            // Car Type
            const Text(
              'مطلوب سيارة ${'غير محدد'}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // Trip Type
            Text(
              'نوع الرحلة: ${'غير محدد'}',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            const Divider(thickness: 1, height: 24), // Separator

            // From Location
            const Text(
              'من: ${'غير محدد'} (${'غير محدد'})',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            // To Location
            const Text(
              'إلى: ${'غير محدد'} (${'غير محدد'})',
              style: TextStyle(fontSize: 14),
            ),
            const Divider(thickness: 1, height: 24), // Separator

            // Date Information
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.calendar_today, color: Colors.grey),
                SizedBox(width: 8),
                Text(
                  'غير محدد',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Time Information
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.access_time, color: Colors.grey),
                SizedBox(width: 8),
                Text(
                  'غير محدد',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
