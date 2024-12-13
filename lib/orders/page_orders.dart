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
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate responsive dimensions
        double minHeight = 360;
        double maxHeight = constraints.maxHeight * 0.8;
        double containerHeight = minHeight > maxHeight ? minHeight : maxHeight;
        
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(constraints.maxWidth * 0.04),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Car Type
                Text(
                  'مطلوب سيارة ${'غير محدد'}',
                  style: TextStyle(
                    fontSize: constraints.maxWidth > 600 ? 18 : 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                
                // Trip Type
                Text(
                  'نوع الرحلة: ${'غير محدد'}',
                  style: TextStyle(
                    fontSize: constraints.maxWidth > 600 ? 16 : 14,
                    color: Colors.grey[700],
                  ),
                ),
                const Divider(thickness: 1, height: 24),

                // From Location
                Text(
                  'من: ${'غير محدد'} (${'غير محدد'})',
                  style: TextStyle(
                    fontSize: constraints.maxWidth > 600 ? 14 : 12,
                  ),
                ),
                const SizedBox(height: 8),
                
                // To Location
                Text(
                  'إلى: ${'غير محدد'} (${'غير محدد'})',
                  style: TextStyle(
                    fontSize: constraints.maxWidth > 600 ? 14 : 12,
                  ),
                ),
                const Divider(thickness: 1, height: 24),

                // Date and Time Information
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(Icons.calendar_today, color: Colors.grey),
                    const SizedBox(width: 8),
                    Text(
                      'غير محدد',
                      style: TextStyle(
                        fontSize: constraints.maxWidth > 600 ? 14 : 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(Icons.access_time, color: Colors.grey),
                    const SizedBox(width: 8),
                    Text(
                      'غير محدد',
                      style: TextStyle(
                        fontSize: constraints.maxWidth > 600 ? 14 : 12,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                
                // Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => deleteOrder(context),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.red,
                          side: const BorderSide(color: Colors.red),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: Text(
                          'مسح',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: constraints.maxWidth > 600 ? 14 : 12,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => navigateToRepliesPage(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: Text(
                          '(0)ردود',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: constraints.maxWidth > 600 ? 14 : 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
