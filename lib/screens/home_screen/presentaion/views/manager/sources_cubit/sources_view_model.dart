import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/api_service.dart';
import 'package:news_app/screens/home_screen/presentaion/views/manager/sources_cubit/sources_states.dart';

class SourcesViewModel extends Cubit<SourcesStates>{
  SourcesViewModel():super(SourcesLoadingState());

  void getSources(String categoryId,String country)async{
    emit(SourcesLoadingState());
    try{
     var respone= await ApiService.getSources(categoryId,country);
     if(respone.status=='error'){
       emit(SourcesFailureState(errorMessage: respone.message!));
       print('error');
       return;
     }if(respone.status=='ok'){
       emit(SourcesSuccessState(sources: respone.sources!));
       return;
     }

    } catch (e){
      emit(SourcesFailureState(errorMessage: 'error while fetching sources'));
    }
  }

}