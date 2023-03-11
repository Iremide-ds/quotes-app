import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:quotes_app/util/global_variables.util.dart';
import 'package:quotes_app/widget/quote_view.widget.dart';
import 'package:quotes_app/provider/quotes.provider.dart';
import 'package:quotes_app/screen/all_quotes.screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> with GlobalVariables {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quotes HQ',
          style: getTextStyle(styleType: TextStyleType.header),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Provider.of<QuotesProvider>(context).hasQuotes
              ? Column(
                  children: [
                    QuoteView(
                      width: size.width * 0.7,
                      textStyle: getTextStyle(styleType: TextStyleType.quote),
                      quote: Provider.of<QuotesProvider>(context, listen: true)
                          .fetchQuote,
                      textStyleAuthor:
                          getTextStyle(styleType: TextStyleType.quoteAuthor),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Provider.of<QuotesProvider>(context, listen: false)
                              .fetchNewQuote();
                        },
                        child: Text(
                          'Refresh quote',
                          style: getTextStyle(styleType: TextStyleType.button),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(AllQuotes.routeName);
                        },
                        child: Text('View all quotes',
                            style:
                                getTextStyle(styleType: TextStyleType.button))),
                  ],
                )
              : Center(
                  child: Text(
                    'No quotes available!',
                    style: getTextStyle(styleType: TextStyleType.error),
                  ),
                ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    ///set context in mixin
    ctx = context;
  }
}
