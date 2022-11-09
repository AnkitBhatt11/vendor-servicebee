// import 'package:flutter/material.dart';
// import 'package:google_places_flutter/google_places_flutter.dart';
// import 'package:google_places_flutter/model/prediction.dart';
//
//
// class SearchPage extends StatefulWidget {
//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }
//
// class _SearchPageState extends State<SearchPage> {
//   TextEditingController searchController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade50,
//       body: Container(
//         color: Colors.white,
//         padding: const EdgeInsets.only(bottom: 12),
//         child: SafeArea(
//           child: Row(
//             children: [
//               IconButton(
//                   onPressed: Navigation.instance.goBack,
//                   icon: Icon(Icons.close,color: Constants.primaryColor,)
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.only(right: 16),
//                   child: GooglePlaceAutoCompleteTextField(
//                       textEditingController: searchController,
//                       googleAPIKey: Constants.googleApiKey,
//                       inputDecoration: InputDecoration(
//                         filled: true,
//                         fillColor: Colors.grey.shade100,
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(4),
//                           borderSide: BorderSide(color: Colors.grey.shade200)
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(4),
//                             borderSide: BorderSide(color: Colors.grey.shade200)
//                         ),
//                         contentPadding: const EdgeInsets.only(left: 16,right: 16),
//                         hintText: "Search Location",
//                       ),
//                       countries: const ["in"],
//                       isLatLngRequired:true,
//                       getPlaceDetailWithLatLng: (Prediction prediction) async{
//                         final result = await Navigation.instance.navigate("/locationSelect",args: LatLng(double.parse(prediction.lat ?? "0"), double.parse(prediction.lng ?? "0")));
//                         Navigator.pop(context,result);
//                       },
//                       itmClick: (Prediction prediction) {
//                         FocusManager.instance.primaryFocus?.unfocus();
//                       }
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }