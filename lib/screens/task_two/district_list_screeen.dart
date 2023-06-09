import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_seeker/repository/api_repository.dart';

import '../../model/state_list_model.dart';
import 'city_list_screen.dart';
class DistrictListScreen extends StatefulWidget {
  final Details stateData;
  const DistrictListScreen({super.key, required this.stateData});

  @override
  State<DistrictListScreen> createState() => _DistrictListScreenState();
}

class _DistrictListScreenState extends State<DistrictListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black87),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          widget.stateData.name ?? '',
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: FutureBuilder(
        future: ApiRepository().getDistrictList(stateId: widget.stateData.id!),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return SingleChildScrollView(
              
              child: Column(
                children: List.generate(
                    snapshot.data?.response?.details?.length ?? 0,
                    (index) => GestureDetector(
                          onTap: () async {
                            final String? retn = await Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return CityListScreen(
                                  dist:
                                      snapshot.data!.response!.details![index],
                                );
                              },
                            ));
                            if (retn!=null) {
                              Navigator.pop(context,retn);
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
                                  snapshot.data!.response!.details![index].name
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
      ),
    );
  }
}
