import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_seeker/repository/api_repository.dart';

import '../../model/job_list_model.dart' as T;

class TaskOne extends StatefulWidget {
  const TaskOne({super.key});

  @override
  State<TaskOne> createState() => _TaskOneState();
}

class _TaskOneState extends State<TaskOne> {
  late T.JobsListModel? futureJob;

  final listTitle = ['Location', 'Job Type', 'Category'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 40,
        actionsIconTheme: IconThemeData(),
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: 0,
          title: Text('Senior .net Developer',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17)),
          subtitle: Text('Trivandrum'),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: Colors.black45)),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('assets/filterIcon.svg'),
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Row(
                  children: List.generate(
                      listTitle.length,
                      (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Chip(label: Text(listTitle[index])),
                          )),
                ),
              ))
            ],
          ),
          Expanded(
            child: FutureBuilder(
                future: ApiRepository().getDeveloperList(),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    return SingleChildScrollView(
                      child: Column(
                        children: List.generate(
                            snapshot.data!.response!.details!.content!.length,
                            (index) => Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(0, 2),
                                            color: Color(0xffF1EDFE),
                                            blurRadius: 14)
                                      ]),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            snapshot.data!.response!.details!
                                                .content![index].title!
                                                .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16),
                                          ),
                                          Spacer(),
                                          Icon(Icons.star_border_rounded)
                                        ],
                                      ),
                                      Text(snapshot.data!.response!.details!
                                          .content![index].employer!.company
                                          .toString()),
                                      Text(snapshot.data!.response!.details!
                                          .content![index].description
                                          .toString()),
                                      Wrap(
                                          spacing: 12,
                                          children: List.generate(
                                              snapshot
                                                      .data
                                                      ?.response
                                                      ?.details
                                                      ?.content?[index]
                                                      .jobTypes
                                                      ?.length ??
                                                  0,
                                              (i) => Chip(
                                                  label: Text(snapshot
                                                          .data
                                                          ?.response
                                                          ?.details
                                                          ?.content?[index]
                                                          .jobTypes?[i] ??
                                                      ''))))
                                    ],
                                  ),
                                )),
                      ),
                    );
                  } else {
                    return Center(
                      child: CupertinoActivityIndicator(),
                    );
                  }
                }),
          )
        ],
      ),
    );
  }
}
