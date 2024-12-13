import 'package:flutter/material.dart';
import 'package:almahaba/utils/responsive_helper.dart';

class FileUploadField extends StatelessWidget {
  const FileUploadField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ResponsiveHelper.getPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8.0),
          Container(
            width: ResponsiveHelper.getWidth(context),
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveHelper.isMobilePhone(context) ? 8.0 : 12.0,
              vertical: ResponsiveHelper.isMobilePhone(context) ? 6.0 : 8.0,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'No file chosen',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: ResponsiveHelper.getFontSize(context),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    print("Choose Files button clicked");
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: ResponsiveHelper.isMobilePhone(context) ? 8.0 : 12.0,
                      vertical: ResponsiveHelper.isMobilePhone(context) ? 4.0 : 6.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  child: Text(
                    'Choose Files',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: ResponsiveHelper.getFontSize(context),
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
