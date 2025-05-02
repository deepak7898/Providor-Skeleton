// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../app/view/isbn_scan/isbn_model/isbn_details_model.dart';
// import '../../core/config/api_config.dart';
// import '../../services/api/api_service.dart';
//
//
//
// // Events
// abstract class ISBNDetailsByScanEvent {}
//
// class FetchISBNDetailsByScanEvent extends ISBNDetailsByScanEvent {
//   String isbnCode;
//
//   FetchISBNDetailsByScanEvent({required this.isbnCode});
// }
//
//
// // States
// abstract class ISBNDetailsByScanState {}
//
// class ISBNDetailsByScanInitial extends ISBNDetailsByScanState {}
//
// class ISBNDetailsByScanLoadingState extends ISBNDetailsByScanState {}
//
// class ISBNDetailsByScanSuccessState extends ISBNDetailsByScanState {
//   BookVerification data;
//   ISBNDetailsByScanSuccessState({required this.data});
// }
//
// class ISBNDetailsByScanErrorState extends ISBNDetailsByScanState {
//   final String errorMessage;
//
//   ISBNDetailsByScanErrorState(this.errorMessage);
// }
//
// class ISBNDetailsByScanBloc extends Bloc<ISBNDetailsByScanEvent, ISBNDetailsByScanState> {
//   final ApiService _apiService = ApiService();
//   ISBNDetailsByScanBloc() : super(ISBNDetailsByScanInitial()) {
//     on<FetchISBNDetailsByScanEvent>(ClassListApi);
//   }
//
//   Future<void> ClassListApi(FetchISBNDetailsByScanEvent event, Emitter<ISBNDetailsByScanState> emit) async {
//     emit(ISBNDetailsByScanLoadingState());
//     var response;
//     try {
//
//       response = await _apiService.get( endPoint:ApiConfig.scanISBNGetDetails+event.isbnCode);
//       print('check responce ${response.statusCode}');
//
//       if (response.statusCode == 200) {
//         emit(ISBNDetailsByScanSuccessState(data: BookVerification.fromJson(response.data)));
//       } else {
//         emit(ISBNDetailsByScanErrorState(response.data['error']));
//       }
//     } catch (e,a) {
//       print('cehck $e ${response.statusCode}');
//       print('cehck $a');
//       emit(ISBNDetailsByScanErrorState('Internal Server Error'));
//     }
//   }
// }
//
//
