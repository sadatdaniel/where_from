class State {
  int stateId;
  int countryId;
  String name;
  String countryCode;
  String countryName;
  String stateCode;
  String stateType;
  String stateLatitude;
  String stateLongitude;

  State({
    required this.stateId,
    required this.countryId,
    required this.name,
    required this.countryCode,
    required this.countryName,
    required this.stateCode,
    required this.stateType,
    required this.stateLatitude,
    required this.stateLongitude,
    // required currencySymbol,
  });

  factory State.fromJson(Map<String, dynamic> json) {
    return State(
      stateId: json['id'],
      countryId: json['country_id'],
      name: json['name'],
      countryCode: json['country_code'],
      countryName: json['country_name'],
      stateCode: json["state_code"],
      stateType: json["state_type"].toString(),
      stateLatitude: json["latitude"].toString(),
      stateLongitude: json['longitude'].toString(),
      // currencySymbol: json["currency_symbol"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = stateId;
    data['country_id'] = countryId;
    data['name'] = name;
    data['country_code'] = countryCode;
    data['country_name'] = countryName;
    data['state_code'] = stateCode;
    data['state_type'] = stateType;
    data['latitude'] = stateLatitude;
    data['longitude'] = stateLongitude;
    return data;
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
