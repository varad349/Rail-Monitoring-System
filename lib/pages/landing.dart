// import 'package:flutter/material.dart';
// import 'widgets/custom_drawer.dart';  

// class MonitoringStationsPage extends StatefulWidget {
//   @override
//   _MonitoringStationsPageState createState() => _MonitoringStationsPageState();
// }

// class _MonitoringStationsPageState extends State<MonitoringStationsPage> {
//   List<String> stations = ["Station A", "Station B", "Station C", "Station D", "Station E", "Station F", "Station G", "Station H"];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Rail Monitoring Station"),
//       ),
//       drawer: CustomDrawer(),  // Use the custom drawer here
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Search Station',
//                   border: OutlineInputBorder(),
//                   prefixIcon: Icon(Icons.search),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.7,
//               child: ListView.builder(
//                 itemCount: stations.length,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                     child: Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                       elevation: 5,
//                       child: ListTile(
//                         contentPadding: EdgeInsets.all(16.0),
//                         leading: CircleAvatar(
//                           radius: 25,
//                           backgroundColor: Colors.blueAccent,
//                           child: Icon(
//                             Icons.train,
//                             color: Colors.white,
//                             size: 30,
//                           ),
//                         ),
//                         title: Text(
//                           stations[index],
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         subtitle: Text(
//                           'Tap to view details',
//                           style: TextStyle(color: Colors.grey[600]),
//                         ),
//                         trailing: Icon(
//                           Icons.arrow_forward_ios,
//                           color: Colors.blueAccent,
//                         ),
//                         onTap: () {
//                           Navigator.pushNamed(
//                             context,
//                             '/station-details',
//                             arguments: stations[index],
//                           );
//                         },
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'widgets/custom_drawer.dart'; 
// import 'widgets/custom_search_bar.dart'; 

// class MonitoringStationsPage extends StatefulWidget {
//   @override
//   _MonitoringStationsPageState createState() => _MonitoringStationsPageState();
// }

// class _MonitoringStationsPageState extends State<MonitoringStationsPage> {
//   List<String> stations = ["Station A", "Station B", "Station C", "Station D", "Station E", "Station F", "Station G", "Station H"];
//   TextEditingController searchController = TextEditingController();
  
//   List<String> filteredStations = [];

//   @override
//   void initState() {
//     super.initState();
//     filteredStations = stations; 
//   }

//   void filterSearch(String query) {
//     if (query.isNotEmpty) {
//       setState(() {
//         filteredStations = stations
//             .where((station) => station.toLowerCase().contains(query.toLowerCase()))
//             .toList();
//       });
//     } else {
//       setState(() {
//         filteredStations = stations;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Rail Monitoring Station"),
//       ),
//       drawer: CustomDrawer(),  
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             CustomSearchBar(
//               controller: searchController, 
//               onSearch: filterSearch,        
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.7,
//               child: ListView.builder(
//                 itemCount: filteredStations.length,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                     child: Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                       elevation: 5,
//                       child: ListTile(
//                         contentPadding: EdgeInsets.all(16.0),
//                         leading: CircleAvatar(
//                           radius: 25,
//                           backgroundColor: Colors.blueAccent,
//                           child: Icon(
//                             Icons.train,
//                             color: Colors.white,
//                             size: 30,
//                           ),
//                         ),
//                         title: Text(
//                           filteredStations[index],
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         subtitle: Text(
//                           'Tap to view details',
//                           style: TextStyle(color: Colors.grey[600]),
//                         ),
//                         trailing: Icon(
//                           Icons.arrow_forward_ios,
//                           color: Colors.blueAccent,
//                         ),
//                         onTap: () {
//                           Navigator.pushNamed(
//                             context,
//                             '/station-details',
//                             arguments: filteredStations[index],
//                           );
//                         },
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'widgets/custom_drawer.dart'; 
import 'widgets/custom_search_bar.dart'; 

class MonitoringStationsPage extends StatefulWidget {
  @override
  _MonitoringStationsPageState createState() => _MonitoringStationsPageState();
}

class _MonitoringStationsPageState extends State<MonitoringStationsPage> {
  List<String> stations = [
    "Station A", "Station B", "Station C", "Station D", 
    "Station E", "Station F", "Station G", "Station H"
  ];
  TextEditingController searchController = TextEditingController();

  List<String> filteredStations = [];
  bool filterOn = false;  
  String selectedFilter = "All"; 
  int notificationCount = 3;  // Example notification count

  @override
  void initState() {
    super.initState();
    filteredStations = stations; 
  }

  void filterSearch(String query) {
    if (query.isNotEmpty) {
      setState(() {
        filteredStations = stations
            .where((station) => station.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    } else {
      setState(() {
        filteredStations = stations;
      });
    }
  }

  void applyFilter(String filter) {
    setState(() {
      selectedFilter = filter;
      if (filter == "All") {
        filteredStations = stations;
      } else {
        filteredStations = stations.where((station) => station.startsWith(filter)).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rail Monitoring Station"),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(
                  Icons.notifications,
                  size: 40.0,
                  ),
                onPressed: () {
                  // Handle notification icon press here
                  Navigator.pushNamed(context, '/notifications'); // Navigate to notifications page
                },
              ),
              if (notificationCount > 0)  // Show badge if notifications exist
                Positioned(
                  right: 11,
                  top: 11,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      '$notificationCount',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CustomSearchBar(
              controller: searchController,
              onSearch: filterSearch,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${filteredStations.length} Results'),
                  Row(
                    children: [
                      PopupMenuButton<String>(
                        onSelected: (value) => applyFilter(value),
                        itemBuilder: (BuildContext context) {
                          return <PopupMenuEntry<String>>[
                            PopupMenuItem<String>(
                              value: "All",
                              child: Text("All"),
                            ),
                            PopupMenuItem<String>(
                              value: "A",
                              child: Text("Starts with A"),
                            ),
                            PopupMenuItem<String>(
                              value: "B",
                              child: Text("Starts with B"),
                            ),
                            PopupMenuItem<String>(
                              value: "C",
                              child: Text("Starts with C"),
                            ),
                          ];
                        },
                        child: Row(
                          children: [
                            Text('Filter: $selectedFilter'),
                            Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      Text('Test'),
                      Switch(
                        value: filterOn,
                        onChanged: (value) {
                          setState(() {
                            filterOn = value;
                            // Implement logic based on toggle switch if needed
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: ListView.builder(
                itemCount: filteredStations.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(16.0),
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.blueAccent,
                          child: Icon(
                            Icons.train,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        title: Text(
                          filteredStations[index],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          'Tap to view details',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.blueAccent,
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/station-details',
                            arguments: filteredStations[index],
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
