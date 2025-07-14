import 'offering_data.dart';

class Exchange {
  final int exchangeId;
  final int solicitorId;
  final String bookName;
  final String bookState;
  final String searchingFor;
  final String sugested;
  final String? id;
  final List<Offering> offerings;

  Exchange({
    required this.exchangeId,
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
      exchangeId: json['exchange_id'],
      solicitorId: json['solicitor_id'],
      bookName: json['book_name'],
      bookState: json['book_state'],
      searchingFor: json['searching_for'],
      sugested: json['sugested'],
      id: json['id'],
      offerings: offeringsList,
    );
  }

  Map<String, dynamic> toJson() => {
    'exchange_id': exchangeId,
    'solicitor_id': solicitorId,
    'book_name': bookName,
    'book_state': bookState,
    'searching_for': searchingFor,
    'sugested': sugested,
    'id': id,
    'offerings': offerings.map((o) => o.toJson()).toList(),
  };
}
