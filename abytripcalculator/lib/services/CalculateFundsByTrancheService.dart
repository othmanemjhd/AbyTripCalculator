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
  TrancheKilometrique tranche8 = TrancheKilometrique(150, 9223372036854775807, 0.40);

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
    String trancheMap = tranche.finTranche.toString();
    double currentResult = (distanceInTranche*tranche.fraisRemboursement);
    if(tranche.debutTranche == 150) {
      trancheMap = ">";
    }
    map.add(({"Tranche": "${tranche.debutTranche} - $trancheMap",
              'Frais': tranche.fraisRemboursement.toStringAsFixed(2),
               'Result': '${currentResult.toStringAsFixed(2)} €'}));
    if(numbreOfKilometres<tranche.finTranche){
      break;
    }
  }

  //Last item with the final result
   map.add(({"Tranche": "", 'Frais': '', 'Result': '$result €'}));
   Result funds = Result(result, resultDecomposition) ;

  return funds;
}
   String formatDouble(double value) {
     String stringValue = value.toString();

     // Check if there is a decimal point
     if (stringValue.contains('.')) {
       // Remove trailing zeros and the decimal point if there are no digits after it
       stringValue = stringValue.replaceAll(RegExp(r"([.]*0)(?!.*\d)"), "");
     }

     return stringValue;
   }
List<Map<String,dynamic>> generateResultMap(){

  return map;
}
}