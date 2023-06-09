import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_seeker/repository/api_repository.dart';

import 'district_list_screeen.dart';

class TaskTwo extends StatefulWidget {
  const TaskTwo({super.key});

  @override
  State<TaskTwo> createState() => _TaskTwoState();
}

class _TaskTwoState extends State<TaskTwo> {
  List<String> dists = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              color: Colors.black54,
            ),
          )
        ],
      ),
      body: DefaultTabController(
                length: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TabBar(
                        indicatorColor: Color(0xff5653C2),
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.label,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.black26,
                        tabs: [
                          Tab(
                            text: 'Location',
                          ),
                          Tab(
                            text: 'Job Type',
                          ),
                          Tab(
                            text: 'Job Category',
                          ),
                        ]),
                    if (dists.length != 0)
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Selected states'),
                            SizedBox(
                              height: 15,
                            ),
                            Wrap(
                              runSpacing: 2,
                              spacing: 5,
                              children: List.generate(dists.length,
                                  (index) => Chip(label: Text(dists[index]))),
                            )
                          ],
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: 'Search State',
                            contentPadding: const EdgeInsets.all(15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            prefixIcon: const Icon(Icons.location_on_outlined)),
                      ),
                    ),
                    FutureBuilder(
                      future: ApiRepository().getStateList(),
                      builder: (context, snapshot) {
                        if (snapshot.data != null) {
                          return SingleChildScrollView(
                            child: Column(
                              children: List.generate(
                                  snapshot.data?.response?.details?.length ?? 0,
                                  (index) => GestureDetector(
                                        onTap: () async {
                                          final String? retn =
                                              await Navigator.push(context,
                                                  MaterialPageRoute(
                                            builder: (context) {
                                              return DistrictListScreen(
                                                stateData: snapshot.data!
                                                    .response!.details![index],
                                              );
                                            },
                                          ));
                                          if (retn != null) {
                                            List<String> temp = [];
                                            temp = dists;
                                            temp.add(retn);
                                            dists = temp;
                                            setState(() {
                                              
                                            });
                                          }
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          margin: const EdgeInsets.only(
                                              top: 10, left: 20, right: 20),
                                          color: const Color(0xffF5F5F5),
                                          child: Row(
                                            children: [
                                              Text(
                                                snapshot.data!.response!
                                                    .details![index].name
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 13),
                                              ),
                                              const Spacer(),
                                              const Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                color: Colors.black26,
                                                size: 16,
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                            ),
                          );
                        } else {
                          return const Center(
                            child: CupertinoActivityIndicator(
                              animating: true,
                            ),
                          );
                        }
                      },
                    )
                  ],
                ))
         
    );
  }
}
