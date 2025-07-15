import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt'),
  ];

  /// No description provided for @login_page.
  ///
  /// In en, this message translates to:
  /// **'Login Page'**
  String get login_page;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @empty.
  ///
  /// In en, this message translates to:
  /// **'Empty'**
  String get empty;

  /// No description provided for @wrong_username.
  ///
  /// In en, this message translates to:
  /// **'Wrong user name'**
  String get wrong_username;

  /// No description provided for @wrong_password.
  ///
  /// In en, this message translates to:
  /// **'Wrong password'**
  String get wrong_password;

  /// No description provided for @main_page.
  ///
  /// In en, this message translates to:
  /// **'Main Page'**
  String get main_page;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @some_text_here.
  ///
  /// In en, this message translates to:
  /// **'Some text here!'**
  String get some_text_here;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @view_log_of_login_tries.
  ///
  /// In en, this message translates to:
  /// **'View the log of login tries'**
  String get view_log_of_login_tries;

  /// No description provided for @login_tries_page.
  ///
  /// In en, this message translates to:
  /// **'Login Tries Page'**
  String get login_tries_page;

  /// No description provided for @login_tries_so_far.
  ///
  /// In en, this message translates to:
  /// **'Login tries so far:'**
  String get login_tries_so_far;

  /// No description provided for @navBarHome.
  ///
  /// In en, this message translates to:
  /// **'Exchanges'**
  String get navBarHome;

  /// No description provided for @navBarMyExchanges.
  ///
  /// In en, this message translates to:
  /// **'My Exchanges'**
  String get navBarMyExchanges;

  /// No description provided for @navBarNewExchange.
  ///
  /// In en, this message translates to:
  /// **'New Exchange'**
  String get navBarNewExchange;

  /// No description provided for @mainPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Exchanges'**
  String get mainPageTitle;

  /// No description provided for @myExchangesPageTitle.
  ///
  /// In en, this message translates to:
  /// **'My Exchanges'**
  String get myExchangesPageTitle;

  /// No description provided for @mainPageWelcomeMessage.
  ///
  /// In en, this message translates to:
  /// **'Welcome to the Main Page!'**
  String get mainPageWelcomeMessage;

  /// No description provided for @noExchangesAvailable.
  ///
  /// In en, this message translates to:
  /// **'No exchanges available.'**
  String get noExchangesAvailable;

  /// No description provided for @errorLoadingExchanges.
  ///
  /// In en, this message translates to:
  /// **'Error loading exchanges: {errorMessage}'**
  String errorLoadingExchanges(Object errorMessage);

  /// No description provided for @exchangeState.
  ///
  /// In en, this message translates to:
  /// **'State'**
  String get exchangeState;

  /// No description provided for @exchangeSearchingFor.
  ///
  /// In en, this message translates to:
  /// **'Searching for'**
  String get exchangeSearchingFor;

  /// No description provided for @exchangeSuggestions.
  ///
  /// In en, this message translates to:
  /// **'Suggestions'**
  String get exchangeSuggestions;

  /// No description provided for @exchangeOffers.
  ///
  /// In en, this message translates to:
  /// **'Offers'**
  String get exchangeOffers;

  /// No description provided for @exchangeOfferItem.
  ///
  /// In en, this message translates to:
  /// **'- {bookName} ({bookState})'**
  String exchangeOfferItem(Object bookName, Object bookState);

  /// No description provided for @searchBarHint.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get searchBarHint;

  /// No description provided for @noExchangesFoundForQuery.
  ///
  /// In en, this message translates to:
  /// **'No exchanges found for \"{query}\".'**
  String noExchangesFoundForQuery(Object query);

  /// No description provided for @newExchangePageTitle.
  ///
  /// In en, this message translates to:
  /// **'Register Exchange'**
  String get newExchangePageTitle;

  /// No description provided for @bookNameHint.
  ///
  /// In en, this message translates to:
  /// **'Book Name (required)'**
  String get bookNameHint;

  /// No description provided for @bookStateTitle.
  ///
  /// In en, this message translates to:
  /// **'Book State (required)'**
  String get bookStateTitle;

  /// No description provided for @stateNew.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get stateNew;

  /// No description provided for @stateSemiNew.
  ///
  /// In en, this message translates to:
  /// **'Semi-new'**
  String get stateSemiNew;

  /// No description provided for @statePreserved.
  ///
  /// In en, this message translates to:
  /// **'Preserved'**
  String get statePreserved;

  /// No description provided for @stateDamaged.
  ///
  /// In en, this message translates to:
  /// **'Damaged'**
  String get stateDamaged;

  /// No description provided for @genresTitle.
  ///
  /// In en, this message translates to:
  /// **'Desired Genres'**
  String get genresTitle;

  /// No description provided for @onlySuggestions.
  ///
  /// In en, this message translates to:
  /// **'Only exchange suggestions'**
  String get onlySuggestions;

  /// No description provided for @genreFantasy.
  ///
  /// In en, this message translates to:
  /// **'Fantasy'**
  String get genreFantasy;

  /// No description provided for @genreSciFi.
  ///
  /// In en, this message translates to:
  /// **'Science Fiction'**
  String get genreSciFi;

  /// No description provided for @genreMystery.
  ///
  /// In en, this message translates to:
  /// **'Mystery'**
  String get genreMystery;

  /// No description provided for @genreRomance.
  ///
  /// In en, this message translates to:
  /// **'Romance'**
  String get genreRomance;

  /// No description provided for @genreHorror.
  ///
  /// In en, this message translates to:
  /// **'Horror'**
  String get genreHorror;

  /// No description provided for @genreNonFiction.
  ///
  /// In en, this message translates to:
  /// **'Non-fiction'**
  String get genreNonFiction;

  /// No description provided for @suggestionsHint.
  ///
  /// In en, this message translates to:
  /// **'Exchange Suggestions'**
  String get suggestionsHint;

  /// No description provided for @registerButton.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get registerButton;

  /// No description provided for @exchangeRegisteredSuccess.
  ///
  /// In en, this message translates to:
  /// **'Exchange registered successfully!'**
  String get exchangeRegisteredSuccess;

  /// No description provided for @validationRequiredField.
  ///
  /// In en, this message translates to:
  /// **'This field is required.'**
  String get validationRequiredField;

  /// No description provided for @validationSelectState.
  ///
  /// In en, this message translates to:
  /// **'Please select a book state.'**
  String get validationSelectState;

  /// No description provided for @genresOrSuggestionsRequired.
  ///
  /// In en, this message translates to:
  /// **'Please select at least one genre or fill in the suggestions.'**
  String get genresOrSuggestionsRequired;

  /// No description provided for @exchangeRegisteredError.
  ///
  /// In en, this message translates to:
  /// **'Error registering the exchange'**
  String get exchangeRegisteredError;

  /// No description provided for @unknownError.
  ///
  /// In en, this message translates to:
  /// **'Unknown error'**
  String get unknownError;

  /// No description provided for @exchangeDetailsTitle.
  ///
  /// In en, this message translates to:
  /// **'Exchange Details'**
  String get exchangeDetailsTitle;

  /// No description provided for @makeOfferTitle.
  ///
  /// In en, this message translates to:
  /// **'Make an Offer'**
  String get makeOfferTitle;

  /// No description provided for @offeringBookNameHint.
  ///
  /// In en, this message translates to:
  /// **'Book you are offering'**
  String get offeringBookNameHint;

  /// No description provided for @offeringBookStateTitle.
  ///
  /// In en, this message translates to:
  /// **'State of your book'**
  String get offeringBookStateTitle;

  /// No description provided for @makeOfferButton.
  ///
  /// In en, this message translates to:
  /// **'Make Offer'**
  String get makeOfferButton;

  /// No description provided for @offerMadeSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Offer made successfully!'**
  String get offerMadeSuccessfully;

  /// No description provided for @failedToMakeOffer.
  ///
  /// In en, this message translates to:
  /// **'Failed to make offer.'**
  String get failedToMakeOffer;

  /// No description provided for @userNotLoggedInError.
  ///
  /// In en, this message translates to:
  /// **'You must be logged in to make an offer.'**
  String get userNotLoggedInError;

  /// No description provided for @currentOffersTitle.
  ///
  /// In en, this message translates to:
  /// **'Current Offers for this Exchange'**
  String get currentOffersTitle;

  /// No description provided for @offeredBook.
  ///
  /// In en, this message translates to:
  /// **'Offered Book'**
  String get offeredBook;

  /// No description provided for @offeredBookState.
  ///
  /// In en, this message translates to:
  /// **'State'**
  String get offeredBookState;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
