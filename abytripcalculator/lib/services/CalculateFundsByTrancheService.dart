import '../tools/Result.dart';
import '../tools/TrancheKilometrique.dart';
 class CalculateFund{
   late List<TrancheKilometrique> tranchesKilometriques;
   late List<Map<String,dynamic>> map ;
   static List<TrancheKilometrique> init(){
  TrancheKilometrique tranche1 = TrancheKilometrique(0, 25, 0);
  TrancheKilometrique tranche2 = TrancheKilometrique(25, 45, 0.25);
  TrancheKilometrique tranche3 = TrancheKilometrique(45, 65, 0.30);
  TrancheKilometrique tranche4 = TrancheKilometrique(65, 85, 0.30);
  TrancheKilometrique tranche5 = TrancheKilometrique(85, 105, 0.35);
  TrancheKilometrique tranche6 = TrancheKilometrique(105, 125, 0.35);
  TrancheKilometrique tranche7 = TrancheKilometrique(125, 150, 0.40);
  TrancheKilometrique tranche8 = TrancheKilometrique(150, 9223372036854, 0.40);

  // on stocke  ces objets TrancheKilometrique dans une liste  .
  List<TrancheKilometrique> tranchesKilometriques = [tranche1, tranche2, tranche3,tranche4,tranche5,tranche6,tranche7,tranche8];
  return  tranchesKilometriques;
}
Result calculate(int numbreOfKilometres){
     tranchesKilometriques = init();
     map = [];
     double result = 0;
  String resultDecomposition = "";
  int distanceInTranche = 0;
  for (TrancheKilometrique tranche in tranchesKilometriques) {
    if (numbreOfKilometres >= tranche.debutTranche  ) {
      if(numbreOfKilometres >= tranche.finTranche ){
        distanceInTranche = tranche.finTranche - tranche.debutTranche ;
      }else{
        distanceInTranche = numbreOfKilometres - tranche.debutTranche ;
      }
        result += distanceInTranche*tranche.fraisRemboursement;
      if (tranche.debutTranche != 0) {
        resultDecomposition += " + ";
      }
      resultDecomposition += "($distanceInTranche * ${tranche.fraisRemboursement})";
    }
    // get the data
    String trancheMap = tranche.finTranche.toString();
    double currentResult = (distanceInTranche*tranche.fraisRemboursement);

    //init the
    tranche.debutTranche == 150?trancheMap = ">":trancheMap += " Km";

    map.add(({"Tranche": "${tranche.debutTranche} - $trancheMap",
              'Frais': '${ formatDouble(tranche.fraisRemboursement)} €',
              'Result': ' ${formatDouble(currentResult)} €'}));
    if(numbreOfKilometres<tranche.finTranche){
      break;
    }
  }

  //Last item with the final result
   map.add(({"Tranche": "", 'Frais': '', 'Result': '${formatDouble(result)} €'}));
   Result funds = Result(result, resultDecomposition) ;

  return funds;
}


List<Map<String,dynamic>> generateResultMap(){
  return map;
}

String formatDouble(double fraisDouble){
  if (fraisDouble % 1 == 0) {
    // It's an integer, don't add decimal places
    return fraisDouble.toInt().toString();
  } else {
    // It's a double, format with two decimal places
    return fraisDouble.toStringAsFixed(2);
  }
}
}