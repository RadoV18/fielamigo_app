import 'dart:convert';

import 'package:fielamigo_app/bloc/bio_features_cubit/bio_features_cubit.dart';

import '../models/bio_dto.dart';
import 'package:http/http.dart' as http;

import 'api.dart';

class BioProvider {
  final String _url = "${Api.url}/caregiver";
  static Future<FeatureDto> getBioFeatures() async {
    FeatureDto featureDto = FeatureDto();
    // final response = await http.get('${Api.url}/bio');
    return featureDto;
  }
}

//TODO: RADO - make backend request
