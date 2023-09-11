import 'package:base_project/presentation/divison_list_save.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:base_project/presentation/breakers_paradise/bloc/breakers_bloc.dart';
import 'package:base_project/presentation/breakers_paradise/bloc/breakers_event.dart';
import 'package:base_project/presentation/breakers_paradise/bloc/breakers_state.dart';
import 'package:base_project/data/models/division_response.dart';
import 'package:base_project/data/models/teams_response.dart';

class BreakersScreen extends StatefulWidget {
  const BreakersScreen({Key? key}) : super(key: key);

  @override
  _BreakersScreenState createState() => _BreakersScreenState();
}

class _BreakersScreenState extends State<BreakersScreen> {
  late BreakersBloc _breakersBloc;
  List<TeamResponse>? teamsList = [];
  List<DivisionResponse>? divisionList = [];
  List<bool> isListExpanded = [];
  int total = 0;

  @override
  void initState() {
    super.initState();
    _breakersBloc = BlocProvider.of<BreakersBloc>(context);
    _breakersBloc.add(BreakersTeamListEvent());
    _breakersBloc.add(BreakersDivisionListEvent());
    divisionList?.forEach((division) {
      isListExpanded.add(false);
    });
  }

  @override
  void dispose() {
    _breakersBloc.close();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Randomly Assigned'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        backgroundColor: Colors.redAccent[400]!,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.redAccent[400]!,
                const Color.fromARGB(255, 255, 56, 53)!
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.redAccent[400]!, Colors.red[400]!],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: const [
                      Text(
                        'Divisional',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Break",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Text(
                        "Total Amount :",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "\$ $total",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 140,
            child: BlocListener<BreakersBloc, BreakersState>(
              listener: (context, state) {
                if (state is BreakersTeamListSuccess) {
                  setState(() {
                    teamsList = state.teamslistContent;
                  });
                }
                if (state is BreakersDivisionListSuccess) {
                  setState(() {
                    divisionList = state.divisionList;
                  });
                }
              },
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: teamsList!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 1.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  final team = teamsList![index];
                  return Draggable<TeamResponse>(
                    data: team,
                    child: Card(
                      margin: const EdgeInsets.all(2.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                team.imageUrl ?? '',
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                              Container(
                                child: ListTile(
                                  title: Text(
                                    team.name ?? '',
                                    style: const TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.center,
                                  ),
                                  onTap: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    feedback: Material(
                      elevation: 4.0,
                      child: Card(
                        margin: const EdgeInsets.all(5.0),
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.transparent,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(team.imageUrl ?? ''),
                                ),
                                const SizedBox(height: 10.0),
                                Container(
                                  child: ListTile(
                                    title: Text(
                                      team.name ?? '',
                                      style: const TextStyle(fontSize: 16.0),
                                      textAlign: TextAlign.center,
                                    ),
                                    onTap: () {},
                                  ),
                                ),
                                Icon(Icons.more_horiz),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
              child: Card(
            elevation: 3,
            child: divisionList != null && divisionList!.length > 0
                ? ReorderableListView(
                    scrollDirection: Axis.vertical,
                    onReorder: (oldIndex, newIndex) {
                      setState(() {
                        if (newIndex > oldIndex) {
                          newIndex -= 1;
                        }
                        final item = divisionList!.removeAt(oldIndex);
                        divisionList!.insert(newIndex, item);
                      });
                    },
                    children: divisionList!
                        .asMap()
                        .entries
                        .map(
                          (entry) => _buildReorderableListItem(
                            entry.key,
                            entry.value,
                            entry.value.teams ?? [],
                          ),
                        )
                        .toList(),
                  )
                : Container(),
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DivisionListScreen()),
          );
        },
        backgroundColor: Color.fromARGB(255, 255, 56, 53),
        child: const Icon(Icons.arrow_forward),
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

  int _totalAmount(int totalItems) {
    return totalItems * 5;
  }
}
