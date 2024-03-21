import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health/core/base_view_model.dart';
import 'package:health/data/remote/hospital_response.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardViewModel extends BaseViewModel {
  int _tabIndex = 0;

  int get tabIndex => _tabIndex;

  DashboardViewModel();

  Future<void> selectedTab(int index) async {
    _tabIndex = index;

    notifyListeners();
  }

  List<HospitalResponse> _hospitals = [];

  List<HospitalResponse> get hospitals => _hospitals;

  Future<void> getAddressList() async {
    try {
      var dio = Dio();
      var response = await dio.get(
        'https://www.communitybenefitinsight.org/api/get_hospitals.php?state=NC',
      );

      if (response.statusCode == 200) {
        print(json.encode(response.data));
        _hospitals = hospitalResponseFromJson(response.data);
        print(_hospitals);
      } else {
        print(response.statusMessage);
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }


  String getAddressFromHospitalData(HospitalResponse hospitalData) {
    String streetAddress = hospitalData.streetAddress ?? " ";
    String city = hospitalData.city ?? " ";
    String state = hospitalData.state ?? " ";
    String zipCode = hospitalData.zipCode ?? " ";
    String address =
        "$streetAddress, $city, $state $zipCode".replaceAll(' ,', "");
    return address;
  }
}

final dashboardViewModelProvider =
    ChangeNotifierProvider((ref) => DashboardViewModel());
