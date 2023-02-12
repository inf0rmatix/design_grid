/// The default implementation according to the Material Design Layout.
/// If you want to change any values, create a class that extends this one and override the functions you want to change.
class MaterialDesignGridBreakpoints {
  const MaterialDesignGridBreakpoints();

  /*
    Screen size   Margin	  Body      Layout columns
    Extra-small (phone)	 	 	 
    0-599dp	      16dp	    Scaling	  4

    Small (tablet)	 	 	 
    600-904	      32dp	    Scaling	  8
    905-1239	    Scaling	  840dp	    12

    Medium (laptop)	 	 	 
    1240-1439	    200dp	    Scaling	  12

    Large (desktop)	 	 	 
    1440+	        Scaling	  1040	    12

    At extra small breakpoints, margins have a baseline value of 16dp. 
    The body remains responsive to increases in size. 
    Upon reaching the next larger breakpoint, small at 600dp wide), the margin increases to 32dp.
    When the width of the body reaches 840dp, the margins become flexible and increase up to a maximum margin width of 200dp.
    After the maximum width is reached, the body region once again becomes responsive, continuing to scale horizontally. 
    At large breakpoints, the body region can maintain a maximum width while margins again scale horizontally.
  */

  int getColumns(double width) {
    if (width < 600) {
      return 4;
    } else if (width < 905) {
      return 8;
    } else if (width < 1240) {
      return 12;
    } else if (width < 1440) {
      return 12;
    } else {
      return 12;
    }
  }

  double? getMargin(double width) {
    if (width < 600) {
      return 16;
    } else if (width < 905) {
      return 32;
    } else if (width < 1240) {
      // fixed body width of 840dp
      return null;
    } else if (width < 1440) {
      return 200;
    } else {
      // fixed body width of 1040dp
      return null;
    }
  }

  double? getBodyWidth(double width) {
    if (width < 600) {
      return null;
    } else if (width < 905) {
      return null;
    } else if (width < 1240) {
      return 840;
    } else if (width < 1440) {
      return null;
    } else {
      return 1040;
    }
  }
}
