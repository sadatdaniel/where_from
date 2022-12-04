// import 'package:every_where/model/state.dart' as state_list;
// import 'package:every_where/service/fetch_service.dart';
// import 'package:flutter/material.dart';
//
// class StateListPage extends StatefulWidget {
//   const StateListPage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<StateListPage> createState() => _StateListPageState();
// }
//
// class _StateListPageState extends State<StateListPage> {
//   FetchService fetchService = FetchService();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: FutureBuilder(
//         future: fetchService.getStates(),
//         builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (snapshot.data != null) // check for null
//           {
//             state_list.StateList stateList =
//                 snapshot.data as state_list.StateList;
//             return ListView.separated(
//                 itemBuilder: (context, index) {
//                   // return DemoItem(position);
//                   return ListTile(
//                     leading: CircleAvatar(
//                       backgroundColor: Colors.teal,
//                       child: Text(
//                         (index + 1).toString(),
//                       ),
//                     ),
//                     title: Text(stateList.states[index].name),
//                   );
//                 },
//                 separatorBuilder: (context, index) => const SizedBox(
//                       height: 10,
//                     ),
//                 itemCount: stateList.states.length);
//           }
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         },
//       ),
//     );
//   }
// }
