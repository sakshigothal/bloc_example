import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import '../../CovidPetient/Model/covid_petient_listing_model.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String listingApi = 'https://api.covid19api.com/summary';


  Future<dynamic> loginUser() async {
    try {
      print('loginUser');
      // var url = Uri.parse('https://9953-2405-201-202c-5007-29b7-4054-5921-9828.in.ngrok.io/api/api-login');
      var url = Uri.parse('https://bf68-2405-201-202c-5802-91c-5b83-7ec-a302.in.ngrok.io/api/api-login');
      var response = await http.post(url,
          body: {
            'email': 'manager@gmail.com',
            'password': '123456',
          });
      print('response is -->${response.body.toString()}');
      return response;
    } catch (e) {
      print('=======This is exception=========');
      print(e);
      return ' ';
    }
  }

  Future<CovidPetientListModel> getListingResponse() async {
    try {
      print('listing response');
      Response response = await _dio.get(listingApi);
      print('response is -->${response.data}');
      return CovidPetientListModel.fromJson(response.data);
    } catch (e) {
      print('=======This is exception=========');
      print(e);
      return CovidPetientListModel.withError("Data not found / Connection issue");
    }
  }

}