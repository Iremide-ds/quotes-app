import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:quotes_app/provider/quotes.provider.dart';
import 'package:quotes_app/util/global_variables.util.dart';
import 'package:quotes_app/widget/quote_view.widget.dart';
import 'package:quotes_app/model/quote.model.dart';

class AllQuotes extends StatefulWidget {
  static const String routeName = '/all_quotes';

  const AllQuotes({Key? key}) : super(key: key);

  @override
  State<AllQuotes> createState() => _AllQuotesState();
}

class _AllQuotesState extends State<AllQuotes> with GlobalVariables {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Quotes',
          style: getTextStyle(styleType: TextStyleType.header),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Consumer<QuotesProvider>(
            builder: (ctx, provider, child) {
              final List<Quote> allQuotes = provider.getAllQuotes;

              return allQuotes.isEmpty
                  ? Center(
                      child: Text(
                        'No quotes available!',
                        style: getTextStyle(styleType: TextStyleType.error),
                      ),
                    )
                  : ListView.builder(
                      itemBuilder: (ctx, index) {
                        return QuoteView(
                          width: size.width * 0.7,
                          textStyle:
                              getTextStyle(styleType: TextStyleType.quote),
                          quote: allQuotes[index],
                          textStyleAuthor: getTextStyle(
                              styleType: TextStyleType.quoteAuthor),
                        );
                      },
                      itemCount: allQuotes.length,
                    );
            },
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
