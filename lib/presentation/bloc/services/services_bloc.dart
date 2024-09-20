import 'package:bloc/bloc.dart';
import 'package:mlm_mobile_app/domain/usecases/getServices.dart';
import 'package:mlm_mobile_app/domain/usecases/searchServices.dart';
import 'package:mlm_mobile_app/presentation/bloc/services/services_state.dart';

import 'services_event.dart';

class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {
  final GetServicesUseCase getServicesUseCase;
  final SearchServicesUseCase searchServicesUseCase;

  ServicesBloc(this.getServicesUseCase, this.searchServicesUseCase) : super(ServicesInitial()) {
    on<LoadServicesEvent>((event, emit) async {
      emit(ServicesLoading());
      try {
        final services = await getServicesUseCase.execute();
        emit(ServicesLoaded(services));
      } catch (_) {
        emit(ServicesError("Failed to load services"));
      }
    });

    on<SearchServicesEvent>((event, emit) async {
      final query = event.query;
      final services = await searchServicesUseCase.execute(query);
      emit(ServicesLoaded(services));
    });
  }
}
