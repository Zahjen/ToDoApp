class Utils {

  static String getDate(date) {
    int day = date.day;
    int month = date.month;
    int year = date.year;
    late String letter;

    switch (month) {
      case 1 :
        letter = 'janvier';
        break;
      case 2 :
        letter = 'février';
        break;
      case 3 :
        letter = 'mars';
        break;
      case 4 :
        letter = 'avril';
        break;
      case 5 :
        letter = 'mai';
        break;
      case 6 :
        letter = 'juin';
        break;
      case 7 :
        letter = 'juillet';
        break;
      case 8 :
        letter = 'août';
        break;
      case 9 :
        letter = 'septembre';
        break;
      case 10 :
        letter = 'octobre';
        break;
      case 11 :
        letter = 'novembre';
        break;
      case 12 :
        letter = 'décembre';
        break;
    }
    
    return "$day $letter $year";
  }


}