import 'offering_data.dart';

class Exchange {
  final int? exchangeId;
  final int solicitorId;
  final String bookName;
  final String bookState;
  final String? searchingFor;
  final String sugested;
  final String? id;

  final List<Offering> offerings;

  Exchange({
    this.exchangeId,
    required this.solicitorId,
    required this.bookName,
    required this.bookState,
    required this.searchingFor,
    required this.sugested,
    this.id,
    required this.offerings,
  });

  factory Exchange.fromJson(Map<String, dynamic> json) {
    var offeringsFromJson = json['offerings'] as List<dynamic>? ?? [];
    List<Offering> offeringsList =
    offeringsFromJson.map((e) => Offering.fromJson(e)).toList();

    return Exchange(
      exchangeId: json['exchange_id'] as int?,
      solicitorId: json['solicitor_id'] as int,
      bookName: json['book_name'] as String,
      bookState: json['book_state'] as String,
      searchingFor: json['searching_for'] as String,
      sugested: json['sugested'] as String,
      id: json['id'] as String?,
      offerings: offeringsList,
    );
  }
  int get creatorUserId => solicitorId;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      if (exchangeId != null) 'exchange_id': exchangeId,
      'solicitor_id': solicitorId,
      'book_name': bookName,
      'book_state': bookState,
      'searching_for': searchingFor,
      'sugested': sugested,
      'offerings': offerings.map((o) => o.toJson()).toList(),
    };
    if (id != null) {
      data['id'] = id;
    }
    return data;
  }
}