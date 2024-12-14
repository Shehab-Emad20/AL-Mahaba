import 'package:almahaba/tripsummary/orders_model.dart';
import 'package:flutter/material.dart';
import 'package:almahaba/tripsummary/widgets/custom_button_drive.dart';

class ResponsiveOrdersList extends StatelessWidget {
  final List<MyOrderModel> orderData;

  const ResponsiveOrdersList({super.key, required this.orderData});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount = _getCrossAxisCount(constraints.maxWidth);
          double itemWidth =
              _getItemWidth(constraints.maxWidth, crossAxisCount);

          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: itemWidth / 420,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: orderData.length,
            itemBuilder: (context, index) {
              return ResponsiveOrderWidget(orderData: orderData[index]);
            },
          );
        },
      ),
    );
  }

  int _getCrossAxisCount(double width) {
    if (width > 1200) {
      return 3;
    } else if (width > 800) {
      return 2;
    } else {
      return 1;
    }
  }

  double _getItemWidth(double width, int crossAxisCount) {
    double padding = 32.0;
    return (width - (padding * (crossAxisCount + 1))) / crossAxisCount;
  }
}

class ResponsiveOrderWidget extends StatelessWidget {
  final MyOrderModel orderData;

  const ResponsiveOrderWidget({super.key, required this.orderData});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double fontSize = _getResponsiveFontSize(constraints.maxWidth);

        return Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // نوع السيارة
                Text(
                  'مطلوب سيارة ${orderData.car ?? 'غير محدد'}',
                  style: TextStyle(
                    fontSize: fontSize + 4,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),

                // نوع الرحلة
                Text(
                  'نوع الرحلة: ${orderData.type ?? 'غير محدد'}',
                  style: TextStyle(
                    fontSize: fontSize,
                    color: Colors.grey[700],
                  ),
                ),
                const Divider(thickness: 1, height: 24),

                // معلومات المكان
                _buildLocationInfo(
                  'من',
                  orderData.from?.governorate,
                  orderData.from?.region,
                  fontSize,
                ),
                const SizedBox(height: 8),
                _buildLocationInfo(
                  'إلى',
                  orderData.to?.governorate,
                  orderData.to?.region,
                  fontSize,
                ),
                const Divider(thickness: 1, height: 24),

                // معلومات الوقت والتاريخ
                _buildInfoRow(
                  Icons.calendar_today,
                  orderData.date ?? 'غير محدد',
                  fontSize,
                ),
                const SizedBox(height: 8),
                _buildInfoRow(
                  Icons.access_time,
                  orderData.time ?? 'غير محدد',
                  fontSize,
                ),

                const SizedBox(height: 16), // مسافة قبل الزر
                const Align(
                  alignment: Alignment.centerLeft, // محاذاة الزر لليسار
                  child: CustomButtonAddDrive(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLocationInfo(
    String label,
    String? governorate,
    String? region,
    double fontSize,
  ) {
    return Text(
      '$label: ${governorate ?? 'غير محدد'} (${region ?? 'غير محدد'})',
      style: TextStyle(fontSize: fontSize),
    );
  }

  Widget _buildInfoRow(IconData icon, String text, double fontSize) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey, size: fontSize + 4),
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(fontSize: fontSize),
        ),
      ],
    );
  }

  double _getResponsiveFontSize(double width) {
    if (width > 600) {
      return 16.0;
    } else {
      return 14.0;
    }
  }
}
