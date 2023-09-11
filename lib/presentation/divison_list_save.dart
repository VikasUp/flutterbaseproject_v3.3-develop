import 'package:flutter/material.dart';
import 'package:base_project/data/models/division_response.dart';
import 'package:base_project/data/models/teams_response.dart';

class DivisionListScreen extends StatefulWidget {
  const DivisionListScreen({Key? key}) : super(key: key);

  @override
  _DivisionListScreenState createState() => _DivisionListScreenState();
}

class _DivisionListScreenState extends State<DivisionListScreen> {
  List<DivisionResponse>? divisionList = [];
  List<TeamResponse>? teamsList = [];

  @override
  void initState() {
    super.initState();
    divisionList = [
      DivisionResponse(
        id: 1,
        name: 'Division 1',
        teams: [
          TeamResponse(name: 'Team 1', imageUrl: ''),
          TeamResponse(name: 'Team 2', imageUrl: ''),
        ],
      ),
      DivisionResponse(
        id: 2,
        name: 'Division 2',
        teams: [
          TeamResponse(name: 'Team 3', imageUrl: ''),
          TeamResponse(name: 'Team 4', imageUrl: ''),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Division List'),
      ),
      body: ListView.builder(
        itemCount: divisionList!.length,
        itemBuilder: (context, index) {
          final division = divisionList![index];
          return _buildReorderableListItem(index, division, division.teams);
        },
      ),
    );
  }

  Widget _buildReorderableListItem(
    int index,
    DivisionResponse division,
    List<TeamResponse>? teams,
  ) {
    bool isExpanded = false;

    return ReorderableDelayedDragStartListener(
      index: index,
      key: Key('$index-${division.id}'),
      child: DragTarget<TeamResponse>(
        onAccept: (team) {
          setState(() {
            divisionList = List.from(divisionList!);
            divisionList![index] = DivisionResponse(
              id: division.id,
              name: division.name,
              teams: [...division.teams ?? [], team],
            );
            teamsList!.remove(team);
          });
        },
        builder: (BuildContext context, List<TeamResponse?> candidateData,
            List<dynamic> rejectedData) {
          return ExpansionTile(
            leading: const Icon(Icons.drag_indicator_rounded),
            title: Text(
              division.name ?? '',
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            onExpansionChanged: (expanded) {
              setState(() {
                isExpanded = expanded;
              });
            },
            initiallyExpanded: isExpanded,
            children: [
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (final team in teams ?? [])
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            teamsList!.add(team);
                            divisionList = List.from(divisionList!);
                            divisionList![index] = DivisionResponse(
                              id: division.id,
                              name: division.name,
                              teams: division.teams
                                  ?.where((t) => t != team)
                                  .toList(),
                            );
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Card(
                            margin: const EdgeInsets.all(5.0),
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.network(
                                        team.imageUrl ?? '',
                                        width: 60,
                                        height: 60,
                                        fit: BoxFit.cover,
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.close),
                                  color: Colors.red,
                                  onPressed: () {
                                    setState(() {
                                      teamsList!.add(team);
                                      divisionList = List.from(divisionList!);
                                      divisionList![index] = DivisionResponse(
                                        id: division.id,
                                        name: division.name,
                                        teams: division.teams
                                            ?.where((t) => t != team)
                                            .toList(),
                                      );
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
