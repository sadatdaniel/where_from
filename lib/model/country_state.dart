// import 'state.dart';

class CountryState {
  // int id;
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
  List<State> states;

  CountryState(
      {
      // required this.id,
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
      required this.tld,
      required this.states});

  factory CountryState.fromJson(Map<String, dynamic> json) {
    StateList stateList = StateList.fromJson(json['states']);

    return CountryState(
      // id: json['id'],
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
      tld: json['tld'],
      states: stateList.states,
    );
  }
}

class CountryStateList {
  final List<CountryState> countries;

  CountryStateList({
    required this.countries,
  });
  factory CountryStateList.fromJson(List<dynamic> parsedJson) {
    List<CountryState> countries = <CountryState>[];
    countries = parsedJson.map((i) => CountryState.fromJson(i)).toList();
    return CountryStateList(
      countries: countries,
    );
  }
}

class State {
  int id;
  String name;
  String stateCode;
  String stateLatitude;
  String stateLongitude;
  String stateType;

  State({
    required this.id,
    required this.name,
    required this.stateCode,
    required this.stateLatitude,
    required this.stateLongitude,
    required this.stateType,
  });

  factory State.fromJson(Map<String, dynamic> json) {
    return State(
      id: json['id'],
      name: json['name'],
      stateCode: json["state_code"],
      stateLatitude: json["latitude"].toString(),
      stateLongitude: json['longitude'].toString(),
      stateType: json["type"].toString(),
    );
  }
}

class StateList {
  final List<State> states;

  StateList({
    required this.states,
  });
  factory StateList.fromJson(List<dynamic> parsedJson) {
    List<State> states = <State>[];
    states = parsedJson.map((i) => State.fromJson(i)).toList();
    return StateList(
      states: states,
    );
  }
}
