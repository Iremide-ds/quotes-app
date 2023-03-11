import 'package:flutter/material.dart';

import 'package:quotes_app/model/quote.model.dart';

class QuotesProvider with ChangeNotifier {
  int _currentIndex = 0;
  final List<Quote> _allQuotes = [
    Quote('A bird might fly but it can not hover over the ocean of the west',
        'Iremide'),
    Quote(
        "I'm sick of following my dreams, man. I'm just going to ask where they're going and hook up with ’em later.",
        'Mitch Hedberg'),
    Quote(
        "My mother always used to say: The older you get, the better you get, unless you’re a banana.",
        'Rose (Betty White), The Golden Girls'),
  ];

  bool get hasQuotes {
    return _allQuotes.isNotEmpty;
  }

  List<Quote> get getAllQuotes {
    return List.from(_allQuotes);
  }

  Quote get fetchQuote {
    if (_currentIndex >= _allQuotes.length) {
      _currentIndex = 0;
    }
    return _allQuotes[_currentIndex];
  }

  void fetchNewQuote() {
    _currentIndex = _currentIndex + 1;
    notifyListeners();
  }
}
