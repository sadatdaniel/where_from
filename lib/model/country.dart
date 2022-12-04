class Country {
  int id;
  String name;
  String iso3;
  String iso2;
  String phoneCode;
  String capital;
  String currency;
  String currencyName;
  String currencySymbol;
  String tld;
  String region;
  String subRegion;
  late List states;

  Country(
      {required this.id,
      required this.name,
      required this.iso3,
      required this.iso2,
      required this.phoneCode,
      required this.capital,
      required this.currency,
      required this.currencyName,
      required this.currencySymbol,
      required this.region,
      required this.subRegion,
      required this.tld});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
        id: json['id'],
        name: json['name'],
        iso3: json['iso3'],
        iso2: json['iso2'],
        phoneCode: json['phone_code'],
        capital: json["capital"],
        currency: json["currency"],
        currencyName: json["currency_name"],
        currencySymbol: json["currency_symbol"],
        region: json['region'],
        subRegion: json['subregion'],
        tld: json['tld']);
  }
}

class CountryList {
  final List<Country> countries;

  CountryList({
    required this.countries,
  });
  factory CountryList.fromJson(List<dynamic> parsedJson) {
    List<Country> countries = <Country>[];
    countries = parsedJson.map((i) => Country.fromJson(i)).toList();
    return CountryList(
      countries: countries,
    );
  }
}
