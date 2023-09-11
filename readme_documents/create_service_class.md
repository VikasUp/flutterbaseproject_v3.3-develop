## How to create and use service class

- Create service class and define API methods.
```
part 'user_list_service.chopper.dart';  
  
@ChopperApi(baseUrl: "")  
abstract class UserListService extends ChopperService {  
  
	 static UserListService create([ChopperClient? client]) =>  
	     _$UserListService(client);  
  
	 @Get(path: SFLAPIs.userListing)  
	 Future<Response<BuiltList<User>>> fetchUserListing();  
}
```

- Add UserListService class to ApiClient.

```
part 'api_client.chopper.dart';  

@ChopperApi(baseUrl: "")  
abstract class ApiClient extends ChopperService {   
static late final userListService;

	 static ApiClient create() {  
	  // TODO: implement create  
	  final client = ChopperClient(  
      baseUrl: AppConfig.getInstance().apiBaseUrl,  
	  services: [UserListService.create()],  
	  converter: BuiltValueConverter(),  
	  errorConverter: BuiltValueConverter(errorType: ResponseFailure),  
	  interceptors: [HttpLoggingInterceptor(), NetworkInterceptor(), ExceptionInterceptor(), 	HeaderInterceptor()],  
	  );  
	  authenticateService = client.getService<AuthenticateService>();  
	  userListService = client.getService<UserListService>();
	  return _$ApiClient(client);  
}  
}
 ```
 
- How to access methods of UserListService methods.

```
ApiClient.userListService.fetchUserListing();
```