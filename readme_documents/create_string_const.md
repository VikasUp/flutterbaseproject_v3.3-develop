## How to create and  use string constants

- Add string constant in relevant file or Create new class in new file for declaring string constant.

  class AppFont {  
  final String helveticaNeueRegular = 'HelveticaNeue';  
  final String helveticaNeueLight = 'HelveticaLightNeue';  
  }
- If new class is created then create static object of that class in string.dart file's SFLStrings class.

  class SFLStrings {  
  static AppFont appFont = AppFont();
  }

-  Access string constant using this static object only.

   SFLStrings.appFont.helveticaNeueRegular