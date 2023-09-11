## How to add base urls for different profiles

- Open Profiles.dart file and add for example all urls related to develop profile to _DevelopProfiles class and so on.
```  
class Profiles {
	static _DevelopProfiles developProfiles = _DevelopProfiles();  
	static _StageProfiles stageProfiles = _StageProfiles();  
	static _ProductionProfiles productionProfiles = _ProductionProfiles();  
}  
  
class _DevelopProfiles {  
	// TODO: URL Setup  
	/// Replace the value of [dev] with the `develop` URL of your project.  
	final String dev = "http://dev.baseprojectjava.thesunflowerlab.com:9014/api";  
}  
  
class _StageProfiles {  
	// TODO: URL Setup  
	/// Replace the value of [stage] with the `develop` URL of your project.  
	final String stage = "http://stage.baseprojectjava.thesunflowerlab.com/api";  
}  
  
class _ProductionProfiles {  
	// TODO: URL Setup  
	/// Replace the value of [prod] with the `develop` URL of your project.  
	final String prod = "http://prod.baseprojectjava.thesunflowerlab.com/api";  
}
```
- How to access develop profile's url

```  
Profiles.developProfiles.dev;
```