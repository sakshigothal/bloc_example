import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../Login/API repository/login_repository.dart';
import '../Model/covid_petient_listing_model.dart';
part 'covid_event.dart';
part 'covid_state.dart';

class CovidBloc extends Bloc<CovidEvent, CovidState> {
  CovidBloc() : super(CovidInitial()) {
    final ApiRepository apiRepository = ApiRepository();



    on<GetCovidList>((event, emit) async {
      try {
        emit(CovidLoading());
        final mList = await apiRepository.fetchCovidList();
        emit(CovidLoaded(mList));
        if (mList.error != null) {
          emit(CovidError(mList.error));
        }
      } on NetworkError {
        emit(const CovidError("Failed to fetch data. is your device online?"));
      }
    });
  }
}
