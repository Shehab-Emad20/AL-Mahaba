import 'package:flutter/material.dart';
import 'package:almahaba/Submit%20a%20quote/widgets/custom_body_submit_quote.dart';

class SubmitQuoteView extends StatelessWidget {
  const SubmitQuoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomBodySubmitQuote(),
      ),
    );
  }
}
