import 'package:almahaba/RepliesPage/view.dart';
import 'package:flutter/material.dart';

class PageOrders extends StatelessWidget {
  const PageOrders({super.key}); // Constructor

  // Function to simulate navigating to a replies page (you can replace this with your actual page)
  void navigateToRepliesPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RepliesPage()),
    );
  }

  // Function for the delete action (you can replace this with actual delete logic)
  void deleteOrder(BuildContext context) {
    // Your delete logic here (e.g., call a delete API or show a confirmation dialog)
    print("Order deleted");
    // Optionally, you can show a confirmation or snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("تم مسح الطلب")),
    );
  }

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

            // Row with "ردود" (Replies) and "مسح" (Delete) buttons
            const SizedBox(height: 16), // Add space between content and buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // "مسح" Button (Delete action) placed first
                OutlinedButton(
                  onPressed: () {
                    deleteOrder(context); // Delete the order
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.red, // Button color
                    side:
                        const BorderSide(color: Colors.red), // Red border color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                    ),
                  ),
                  child: const Text(
                    'مسح',
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                // "ردود" Button (Navigate to replies page) placed second
                ElevatedButton(
                  onPressed: () {
                    navigateToRepliesPage(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                    ),
                  ),
                  child: const Text(
                    '(0)ردود',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
