import 'package:every_where/service/fetch_service.dart';
import 'package:flutter/material.dart';

import 'model/country.dart';

class CountryListPage extends StatefulWidget {
  const CountryListPage({super.key, required this.title});

  final String title;

  @override
  State<CountryListPage> createState() => _CountryListPageState();
}

class _CountryListPageState extends State<CountryListPage> {
  FetchService fetchService = FetchService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: fetchService.getCountries(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.data != null) // check for null
          {
            CountryList countryList = snapshot.data as CountryList;
            return ListView.separated(
                itemBuilder: (context, index) {
                  // return DemoItem(position);
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.teal,
                      child: Text(
                        (index + 1).toString(),
                      ),
                    ),
                    title: Text(countryList.countries[index].name),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                itemCount: countryList.countries.length);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
