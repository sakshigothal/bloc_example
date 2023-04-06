import '../../CovidPetient/Model/covid_petient_listing_model.dart';
import '../API provider/login_provider.dart';

class ApiRepository {
  final provider = ApiProvider();


  Future<dynamic> getListingAPIResponse(){
    return provider.getListingResponse();
  }

  Future<CovidPetientListModel> fetchCovidList() {
    return provider.getListingResponse();
  }
}

class NetworkError extends Error {}