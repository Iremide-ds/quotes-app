import 'package:flutter/material.dart';

import 'package:quotes_app/model/quote.model.dart';

class QuoteView extends StatelessWidget {
  final double width;
  final TextStyle textStyle;
  final TextStyle textStyleAuthor;
  final Quote quote;

  const QuoteView(
      {Key? key,
      required this.width,
      required this.textStyle,
      required this.quote,
      required this.textStyleAuthor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: width * 0.09),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(quote.quote, style: textStyle),
          Text(quote.author, style: textStyleAuthor)
        ],
      ),
    );
  }
}
