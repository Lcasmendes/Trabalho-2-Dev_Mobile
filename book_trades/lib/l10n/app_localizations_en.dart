// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get login_page => 'Book Trade';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get login => 'Login';

  @override
  String get create_account_label => 'Create Account';

  @override
  String get empty => 'Empty';

  @override
  String get wrong_email_or_pass => 'Wrong email or password';

  @override
  String get error => 'Error';

  @override
  String get main_page => 'Main Page';

  @override
  String get logout => 'Logout';

  @override
  String get some_text_here => 'Some text here!';

  @override
  String get loading => 'Loading...';

  @override
  String get view_log_of_login_tries => 'View the log of login tries';

  @override
  String get login_tries_page => 'Login Tries Page';

  @override
  String get login_tries_so_far => 'Login tries so far:';

  @override
  String get navBarHome => 'Exchanges';

  @override
  String get navBarMyExchanges => 'My Exchanges';

  @override
  String get navBarNewExchange => 'New Exchange';

  @override
  String get mainPageTitle => 'Exchanges';

  @override
  String get myExchangesPageTitle => 'My Exchanges';

  @override
  String get mainPageWelcomeMessage => 'Welcome to the Main Page!';

  @override
  String get noExchangesAvailable => 'No exchanges available.';

  @override
  String errorLoadingExchanges(Object errorMessage) {
    return 'Error loading exchanges: $errorMessage';
  }

  @override
  String get exchangeState => 'State';

  @override
  String get exchangeSearchingFor => 'Searching for';

  @override
  String get exchangeSuggestions => 'Suggestions';

  @override
  String get exchangeOffers => 'Offers';

  @override
  String exchangeOfferItem(Object bookName, Object bookState) {
    return '- $bookName ($bookState)';
  }

  @override
  String get searchBarHint => 'Search';

  @override
  String noExchangesFoundForQuery(Object query) {
    return 'No exchanges found for \"$query\".';
  }

  @override
  String get newExchangePageTitle => 'Register Exchange';

  @override
  String get bookNameHint => 'Book Name (required)';

  @override
  String get bookStateTitle => 'Book State (required)';

  @override
  String get stateNew => 'New';

  @override
  String get stateSemiNew => 'Semi-new';

  @override
  String get statePreserved => 'Preserved';

  @override
  String get stateDamaged => 'Damaged';

  @override
  String get genresTitle => 'Desired Genres';

  @override
  String get onlySuggestions => 'Only exchange suggestions';

  @override
  String get genreFantasy => 'Fantasy';

  @override
  String get genreSciFi => 'Science Fiction';

  @override
  String get genreMystery => 'Mystery';

  @override
  String get genreRomance => 'Romance';

  @override
  String get genreHorror => 'Horror';

  @override
  String get genreNonFiction => 'Non-fiction';

  @override
  String get suggestionsHint => 'Exchange Suggestions';

  @override
  String get registerButton => 'Register';

  @override
  String get exchangeRegisteredSuccess => 'Exchange registered successfully!';

  @override
  String get validationRequiredField => 'This field is required.';

  @override
  String get validationSelectState => 'Please select a book state.';

  @override
  String get genresOrSuggestionsRequired =>
      'Please select at least one genre or fill in the suggestions.';

  @override
  String get exchangeRegisteredError => 'Error registering the exchange';

  @override
  String get unknownError => 'Unknown error';

  @override
  String get exchangeDetailsTitle => 'Exchange Details';

  @override
  String get makeOfferTitle => 'Make an Offer';

  @override
  String get offeringBookNameHint => 'Book you are offering';

  @override
  String get offeringBookStateTitle => 'State of your book';

  @override
  String get makeOfferButton => 'Make Offer';

  @override
  String get offerMadeSuccessfully => 'Offer made successfully!';

  @override
  String get failedToMakeOffer => 'Failed to make offer.';

  @override
  String get userNotLoggedInError => 'You must be logged in to make an offer.';

  @override
  String get currentOffersTitle => 'Current Offers for this Exchange';

  @override
  String get offeredBook => 'Offered Book';

  @override
  String get offeredBookState => 'State';

  @override
  String get offersTitle => 'Offers';
}
