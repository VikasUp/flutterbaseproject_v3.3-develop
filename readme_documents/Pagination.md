
## How to add pagination
  
 - Open bloc file and add currentPage and hasMaxReached variables.
```  
int _currentPage = 0;
bool hasMaxReached = false;
```
 - Create new event as shown below
 
```  
class HomeGetUserPaginatedEvent extends HomeEvent {
    final bool isLoadMore;
    const HomeGetUserPaginatedEvent({required this.isLoadMore});

    @override
    String toString() => 'getting paginated user list';
}
```

 - Create new state as shown below
 ```
 class HomeGetUserListSuccess extends HomeState {
    final List<User> userList;
    final int currentPage;
    
    const HomeGetUserListSuccess({required this.userList});
    const HomeGetUserListSuccess({required this.userList,  required  this.currentPage});

    @override
    List<Object> get props => [userList];
    List<Object> get props => [userList,  currentPage];

    @override
    String toString() => 'Home User list';
}
```

 - In the screen class add below code in initState() method.
 ```
 _fetchedUserList(isLoadMore:  false);
 ```

 - Add below code in mapEventToState method of bloc class.
```
if (event is HomeGetUserPaginatedEvent) {  
  if (!event.isLoadMore) {  
      _currentPage = 0;  
      hasMaxReached = false;  
  }  
  if (!hasMaxReached) {  
    try {  
      if (_currentPage == 0 && !event.isLoadMore) {  
          yield HomeStateLoading();  
      }  
      Response<UserResponse> response = await ApiClient.userListService.fetchUserListing(  
          _currentPage,  
          SFLStrings.customKeys.genericPageSize,  
      );  
  
     if (response.isSuccessful) {  
        if (!event.isLoadMore) {  
          userList.clear();  
        }  
        userList.addAll(response.body?.content ?? []);  
        hasMaxReached = response.body?.last ?? true;  
        if(!hasMaxReached){  
          _currentPage += 1;  
        }  
        yield HomeStateInitial();  
  
        yield HomeGetUserListSuccess(  
            userList: userList, currentPage: _currentPage);  
        }  
    } on UnauthorisedException catch (unauthorisedException) {  
        FirebaseCrashlytics.instance.log("${unauthorisedException.message}");  
        authenticationBloc.add(LoggedOut());  
    } on ServerException catch (serverException) {  
        yield HomeGetUserListFail(error: serverException.message!);  
    } catch (error) {  
        yield HomeGetUserListFail(error: error.toString());  
        yield HomeStateInitial();  
    }  
  }  
}
```

 - Add below code in screen class.
 ```
 Widget buildList(BuildContext context) =>
    BlocListener<HomeBloc, HomeState>(listener: (context, state) {
    if (state is HomeGetUserListFail) {
        showToast(state.error);
    }

    if (state is HomeGetUserListSuccess) {
        setState(() {
            userList = state.userList;
        });
    }
    return CustomListView(
        onRefresh: _onRefresh,
        onScroll: () => _fetchedUserList(isLoadMore: true),
        itemBuilder: (context, index) {
            User user = userList[index];
            return _buildUserCard(user);
        },
        hasMaxReached: homeBloc.hasMaxReached,
        itemCount: userList.length);
    }));
    Future<void> _onRefresh() async {
    _fetchedUserList(isLoadMore: false);
 }

    void _fetchedUserList({bool isLoadMore = false}) {
        homeBloc.add(HomeGetUserPaginatedEvent(isLoadMore: isLoadMore));
    }
```
