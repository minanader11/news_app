import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/api_service.dart';
import 'package:news_app/screens/home_screen/presentaion/views/manager/news_cubit/news_states.dart';

class NewsViewModel extends Cubit<NewsStates>{
  NewsViewModel():super(NewsLoadingState());
  void getNews(String sourceId,String categoryId,String language)async{
    emit(NewsLoadingState());
    try{
    var response = await ApiService.getNews(sourceId, categoryId,language);
    if(response.status=='error'){
      emit(NewsFailureState(errorMessage: response.message!));
      print('error1');
    } if (response.status =='ok'){
    emit(NewsSuccessState(news: response.articles!));
    }
  }catch(e){
      emit(NewsFailureState(errorMessage: 'error while loading news'));
    }
  }
}