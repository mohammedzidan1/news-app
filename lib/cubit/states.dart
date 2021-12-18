abstract class NewsAppStates{}
class InitialState extends NewsAppStates{}
class  ChangeBottomNavigatorItemState extends NewsAppStates{}
class NewGetBusinessLoadingState extends NewsAppStates{}
class  NewGetBusinessSucssesState extends NewsAppStates{}
class  NewGetBusinessErrorState extends NewsAppStates{
  final String error;

  NewGetBusinessErrorState(this.error);

}
class NewGetSportsLoadingState extends NewsAppStates{}
class  NewGetSportsSucssesState extends NewsAppStates{}
class  NewGetSportsErrorState extends NewsAppStates{
  final String error;

  NewGetSportsErrorState(this.error);

}
class NewGetScienceLoadingState extends NewsAppStates{}
class  NewGetScienceSucssesState extends NewsAppStates{}
class  NewGetScienceErrorState extends NewsAppStates{
  final String error;

  NewGetScienceErrorState(this.error);

}
class ChangeModeState extends NewsAppStates{}
class NewGetSearchLoadingState extends NewsAppStates{}
class  NewGetSearchSucssesState extends NewsAppStates{}
class  NewGetSearchErrorState extends NewsAppStates{
  final String error;

  NewGetSearchErrorState(this.error);

}