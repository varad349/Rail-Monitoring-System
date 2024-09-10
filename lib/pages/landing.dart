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
  int notificationCount = 3; // Example notification count

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
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Rail Monitoring Station", style: TextStyle(color: Colors.cyanAccent)),
        backgroundColor: Colors.grey[850],
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white, // Set the color of the drawer icon to white
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Open the drawer
              },
            );
          },
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(
                  Icons.notifications,
                  size: 40.0,
                  color: Colors.yellowAccent,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/notifications'); // Navigate to notifications page
                },
              ),
              if (notificationCount > 0) // Show badge if notifications exist
                Positioned(
                  right: 11,
                  top: 11,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
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
      drawer: CustomDrawer(), // Custom drawer widget
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CustomSearchBar(
              controller: searchController,
              onSearch: filterSearch,
              // hintTextColor: Colors.white, // Hint text color changed to white
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${filteredStations.length} Results', style: TextStyle(color: Colors.purpleAccent)),
                  Row(
                    children: [
                      PopupMenuButton<String>(
                        onSelected: (value) => applyFilter(value),
                        itemBuilder: (BuildContext context) {
                          return <PopupMenuEntry<String>>[
                            PopupMenuItem<String>(
                              value: "All",
                              child: Text("All", style: TextStyle(color: Colors.black)),
                            ),
                            PopupMenuItem<String>(
                              value: "A",
                              child: Text("Starts with A", style: TextStyle(color: Colors.black)),
                            ),
                            PopupMenuItem<String>(
                              value: "B",
                              child: Text("Starts with B", style: TextStyle(color: Colors.black)),
                            ),
                            PopupMenuItem<String>(
                              value: "C",
                              child: Text("Starts with C", style: TextStyle(color: Colors.black)),
                            ),
                          ];
                        },
                        child: Row(
                          children: [
                            Text('Filter: $selectedFilter', style: TextStyle(color: Colors.lightGreenAccent)),
                            Icon(Icons.arrow_drop_down, color: Colors.lightGreenAccent),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      Text('Test', style: TextStyle(color: Colors.lightBlueAccent)),
                      Switch(
                        value: filterOn,
                        onChanged: (value) {
                          setState(() {
                            filterOn = value;
                            // Implement logic based on toggle switch if needed
                          });
                        },
                        activeColor: Colors.tealAccent,
                        inactiveThumbColor: Colors.grey[600],
                        inactiveTrackColor: Colors.grey[800],
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
                      color: Colors.grey[800],
                      elevation: 5,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(16.0),
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.orangeAccent,
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
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                        subtitle: Text(
                          'Tap to view details',
                          style: TextStyle(color: Colors.grey[400]),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.orangeAccent,
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
