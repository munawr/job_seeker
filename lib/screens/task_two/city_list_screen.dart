import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_seeker/model/district_list_model.dart';
import 'package:job_seeker/repository/api_repository.dart';

class CityListScreen extends StatefulWidget {
  final Details dist;
  const CityListScreen({super.key, required this.dist});

  @override
  State<CityListScreen> createState() => _CityListScreenState();
}

class _CityListScreenState extends State<CityListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: 65,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Color(0xff5653C2)),
            onPressed: () {
              Navigator.pop(context,widget.dist.name);
            },
            child: Text('Apply Filter')),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black87),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          widget.dist.name.toString(),
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: FutureBuilder(
        future: ApiRepository().getCityList(districtId: widget.dist.id!),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return SingleChildScrollView(
              child: Column(
                children: List.generate(
                    snapshot.data?.response?.details?.length ?? 0, (index) {
                  ValueNotifier<bool> check = ValueNotifier(false);

                  return ValueListenableBuilder(
                      valueListenable: check,
                      builder: (_, val, __) {
                        return GestureDetector(
                          onTap: () async {
                            check.value = !(check.value);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(
                                top: 10, left: 20, right: 20),
                            color: const Color(0xffF5F5F5),
                            child: Row(
                              children: [
                                Checkbox(
                                  value: val,
                                  onChanged: (value) {
                                    check.value = value ?? false;
                                  },
                                ),
                                Text(
                                  snapshot.data!.response!.details![index].name
                                      .toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        );
                      });
                }),
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
