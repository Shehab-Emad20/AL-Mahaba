import 'package:flutter/material.dart';

class OrderActions extends StatelessWidget {
  final double maxWidth;
  final VoidCallback onDelete;
  final VoidCallback onViewReplies;
  final int repliesCount;

  const OrderActions({
    super.key,
    required this.maxWidth,
    required this.onDelete,
    required this.onViewReplies,
    this.repliesCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    final buttonTextStyle = TextStyle(
      color: Colors.white,
      fontSize: maxWidth > 600 ? 14 : 12,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: onDelete,
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.red,
              side: const BorderSide(color: Colors.red),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            child: Text('مسح', style: buttonTextStyle),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ElevatedButton(
            onPressed: onViewReplies,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            child: Text(
              '($repliesCount)ردود',
              style: buttonTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
