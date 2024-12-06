import 'package:flutter/material.dart';

class FileUploadField extends StatelessWidget {
  const FileUploadField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.all(8.0), // لتوحيد الهوامش مع CustomDriverTextField
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8.0),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 10.0, vertical: 8.0), // لتوحيد الحجم مع حقل النص
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'No file chosen',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize:
                        14.0, // نفس الحجم المستخدم في CustomDriverTextField
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // هنا يمكن إضافة الكود لفتح نافذة لاختيار الملف
                    print("Choose Files button clicked");
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  child: const Text(
                    'Choose Files',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize:
                          14.0, // نفس الحجم المستخدم في CustomDriverTextField
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
