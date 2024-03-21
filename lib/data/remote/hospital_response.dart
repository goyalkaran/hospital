// To parse this JSON data, do
//
//     final hospitalResponse = hospitalResponseFromJson(jsonString);

import 'dart:convert';

List<HospitalResponse> hospitalResponseFromJson(String str) => List<HospitalResponse>.from(json.decode(str).map((x) => HospitalResponse.fromJson(x)));

String hospitalResponseToJson(List<HospitalResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HospitalResponse {
  String? hospitalId;
  String? hospitalOrgId;
  String? ein;
  String? name;
  String? nameCr;
  String? streetAddress;
  String? city;
  String? state;
  String? zipCode;
  String? fipsStateAndCountyCode;
  String? hospitalBedCount;
  String? chrchAfflF;
  String? urbanLocationF;
  String? childrenHospitalF;
  String? membCouncTeachHospsF;
  String? medicareProviderNumber;
  String? county;
  String? hospitalBedSize;
  String? updatedDt;

  HospitalResponse({
    this.hospitalId,
    this.hospitalOrgId,
    this.ein,
    this.name,
    this.nameCr,
    this.streetAddress,
    this.city,
    this.state,
    this.zipCode,
    this.fipsStateAndCountyCode,
    this.hospitalBedCount,
    this.chrchAfflF,
    this.urbanLocationF,
    this.childrenHospitalF,
    this.membCouncTeachHospsF,
    this.medicareProviderNumber,
    this.county,
    this.hospitalBedSize,
    this.updatedDt,
  });

  factory HospitalResponse.fromJson(Map<String, dynamic> json) => HospitalResponse(
    hospitalId: json["hospital_id"],
    hospitalOrgId: json["hospital_org_id"],
    ein: json["ein"],
    name: json["name"],
    nameCr: json["name_cr"],
    streetAddress: json["street_address"],
    city: json["city"],
    state: json["state"],
    zipCode: json["zip_code"],
    fipsStateAndCountyCode: json["fips_state_and_county_code"],
    hospitalBedCount: json["hospital_bed_count"],
    chrchAfflF: json["chrch_affl_f"],
    urbanLocationF: json["urban_location_f"],
    childrenHospitalF: json["children_hospital_f"],
    membCouncTeachHospsF: json["memb_counc_teach_hosps_f"],
    medicareProviderNumber: json["medicare_provider_number"],
    county: json["county"],
    hospitalBedSize: json["hospital_bed_size"],
    updatedDt: json["updated_dt"],
  );

  Map<String, dynamic> toJson() => {
    "hospital_id": hospitalId,
    "hospital_org_id": hospitalOrgId,
    "ein": ein,
    "name": name,
    "name_cr": nameCr,
    "street_address": streetAddress,
    "city": city,
    "state": state,
    "zip_code": zipCode,
    "fips_state_and_county_code": fipsStateAndCountyCode,
    "hospital_bed_count": hospitalBedCount,
    "chrch_affl_f": chrchAfflF,
    "urban_location_f": urbanLocationF,
    "children_hospital_f": childrenHospitalF,
    "memb_counc_teach_hosps_f": membCouncTeachHospsF,
    "medicare_provider_number": medicareProviderNumber,
    "county": county,
    "hospital_bed_size": hospitalBedSize,
    "updated_dt": updatedDt,
  };
}
