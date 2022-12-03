import 'package:every_where/model/state.dart' as k;
import 'package:every_where/service/fetch_service.dart';
import 'package:flutter/material.dart';

import 'model/country.dart';

class FullPage extends StatefulWidget {
  const FullPage({super.key, required this.title});

  final String title;

  @override
  State<FullPage> createState() => _FullPageState();
}

class _FullPageState extends State<FullPage> {
  FetchService fetchService = FetchService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: fetchService.make(),
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
                    // title: Text(countryList.countries[index].name),
                    title: Text(countryList.countries[index].name),
                    onTap: () {
                      // print(countryList.countries[index].states.toString());
                      for (k.State element
                          in countryList.countries[index].states) {
                        print(element.name);
                      }
                    },
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
