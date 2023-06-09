import 'dart:convert';

import 'package:http/http.dart ' as http;
import 'package:job_seeker/model/city_list_model.dart';
import 'package:job_seeker/model/district_list_model.dart';
import 'package:job_seeker/model/job_list_model.dart';
import 'package:job_seeker/model/state_list_model.dart';

class ApiRepository {
  static String api_jobList = 'http://sjf.proximys.in/api/jobs/search-basic/';
  Future<JobsListModel> getDeveloperList() async {
    final request = http.MultipartRequest('POST', Uri.parse(api_jobList));
    var response = await request.send();
    return JobsListModel.fromJson(
        jsonDecode(await response.stream.bytesToString()));
  }

  Future<StatesListModel?> getStateList() async {
    final request = http.MultipartRequest(
        'GET', Uri.parse('http://sjf.proximys.in/api/states/list'));
    final response = await request.send();
    return StatesListModel.fromJson(
        jsonDecode(await response.stream.bytesToString()));
  }

  Future<DistrictListModel> getDistrictList({required int stateId}) async {
    final request = http.MultipartRequest(
        'GET',
        Uri.parse(
            'http://sjf.proximys.in/api/districts/list-by-states/?states=$stateId'));
    final response = await request.send();
    return DistrictListModel.fromJson(
        jsonDecode(await response.stream.bytesToString()));
  }

  Future<CityListModel> getCityList({required int districtId}) async {
    final request = http.MultipartRequest(
        'GET',
        Uri.parse(
            'http://sjf.proximys.in/api/cities/list?district=$districtId/'));
    final response = await request.send();
    return CityListModel.fromJson(
        jsonDecode(await response.stream.bytesToString()));
  }
}
