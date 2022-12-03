import 'dart:convert';
import 'dart:io';

import 'package:every_where/model/country.dart';
import 'package:every_where/model/state.dart';
import 'package:flutter/services.dart';
import 'package:localstorage/localstorage.dart';
import 'package:path_provider/path_provider.dart';

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

  Future getStates() async {
    // working
    String jsonStates = await _loadStates();
    final jsonResponse = json.decode(jsonStates);
    StateList stateList = StateList.fromJson(jsonResponse);
    return stateList;
  }

  Future getCountries() async {
    // working
    String jsonCountries = await _loadCountries();
    final jsonResponse = json.decode(jsonCountries);
    CountryList countryList = CountryList.fromJson(jsonResponse);
    return countryList;
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/countries+states.json');
  }

  Future make() async {
    String jsonCountries = await _loadCountries();
    final jsonResponse1 = json.decode(jsonCountries);
    CountryList countryList = CountryList.fromJson(jsonResponse1);

    String jsonStates = await _loadStates();
    final jsonResponse2 = json.decode(jsonStates);
    StateList stateList = StateList.fromJson(jsonResponse2);

    for (int index = 0; index < countryList.countries.length; index++) {
      List stateLi = [];

      for (int yndex = 0; yndex < stateList.states.length; yndex++) {
        if (countryList.countries[index].name ==
            stateList.states[yndex].countryName) {
          stateLi.add(stateList.states[yndex]);
        }
        countryList.countries[index].states = stateLi;
      }
    }
    //
    // final File file =
    //     File('lib/assets/countries+states.json'); //load the json file
    // String contents = await file.readAsString();

    // File file = File(
    //     "C:\Users\sadat\Documents\Flutter Projects\every_where\lib\assets\countries+states.json");
    //
    //
    //
    //

    List uhun = countryList.countries //convert list data  to json
        .map(
      (country) {
        print("adding country");
        print(country);
        return country.toJson();
      },
    ).toList();
    //
    // file.writeAsStringSync(json.encode(uhun));

    final LocalStorage storage = LocalStorage('countries+states.json');
    storage.setItem("countries", uhun);
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
