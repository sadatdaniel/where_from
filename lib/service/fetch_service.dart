import 'dart:convert';

import 'package:every_where/model/country.dart';
// import 'package:every_where/model/state.dart';
import 'package:flutter/services.dart';

import '../model/country_state.dart';

class FetchService {
  Future _loadCountries() async {
    // working
    var data = await rootBundle.loadString('lib/assets/countries.json');
    return data;
  }

  Future _loadStates() async {
    // working
    var data = await rootBundle.loadString('lib/assets/states.json');
    return data;
  }

  Future _loadCountryStates() async {
    // working
    var data = await rootBundle.loadString('lib/assets/countries+states.json');
    return data;
  }

  // Future getStates() async {
  //   // working
  //   String jsonStates = await _loadStates();
  //   final jsonResponse = json.decode(jsonStates);
  //   StateList stateList = StateList.fromJson(jsonResponse);
  //   return stateList;
  // }

  Future getCountries() async {
    // working
    String jsonCountries = await _loadCountries();
    final jsonResponse = json.decode(jsonCountries);
    CountryList countryList = CountryList.fromJson(jsonResponse);
    return countryList;
  }

  Future getCountryStates() async {
    String jsonCountries = await _loadCountryStates();
    final jsonResponse = json.decode(jsonCountries);
    CountryStateList countryList = CountryStateList.fromJson(jsonResponse);
    return countryList;
  }

  // Future getStatesOfCountry() async {
  //   String jsonPosts = await _load();
  //   final jsonResponse = json.decode(jsonPosts);
  //   PostList postList = PostList.fromJson(jsonResponse);
  //   // print("photos " + photosList.photos[0].title);
  //   return postList;
  // }

  // Future getStatesOfCountry(int countryId) async {
  //   String jsonPosts = await _load();
  //   final jsonResponse = json.decode(jsonPosts);
  //   PostList postList = PostList.fromJson(jsonResponse);
  //   // print("photos " + photosList.photos[0].title);
  //   return postList;
  // }

  // Future getCountryOfState(int stateId) async {
  //   String jsonPosts = await _load();
  //   final jsonResponse = json.decode(jsonPosts);
  //   PostList postList = PostList.fromJson(jsonResponse);
  //   // print("photos " + photosList.photos[0].title);
  //   return postList;
  // }
}
