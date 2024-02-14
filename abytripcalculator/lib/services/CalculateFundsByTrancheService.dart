import '../tools/TrancheKilometrique.dart';
 class CalculateFund{
   late List<TrancheKilometrique> tranchesKilometriques;
   late List<Map<String,dynamic>> map ;
   double fixeTarif = 4 ;

   static List<TrancheKilometrique> init(){
     // entre 0-41 => 4 € , pas de calcul
  //TrancheKilometrique tranche1 = TrancheKilometrique(0, 41, 4);
  //on repart de 0
  TrancheKilometrique tranche2 = TrancheKilometrique(41, 45, 0.25);
  TrancheKilometrique tranche3 = TrancheKilometrique(45, 65, 0.30);
  TrancheKilometrique tranche4 = TrancheKilometrique(65, 85, 0.30);
  TrancheKilometrique tranche5 = TrancheKilometrique(85, 105, 0.35);
  TrancheKilometrique tranche6 = TrancheKilometrique(105, 125, 0.35);
  TrancheKilometrique tranche7 = TrancheKilometrique(125, 150, 0.40);
  TrancheKilometrique tranche8 = TrancheKilometrique(150, 9223372036854, 0.40);

  // on stocke  ces objets TrancheKilometrique dans une liste  .
  List<TrancheKilometrique> tranchesKilometriques = [ tranche2, tranche3,tranche4,tranche5,tranche6,tranche7,tranche8];
  return  tranchesKilometriques;
}
double calculate(double numbreOfKilometres){
     tranchesKilometriques = init();
     map = [];
     double result = 0;
     double distanceInTranche = 0;
  // add the tranche if the number of km <41km
  if(numbreOfKilometres > 0 && numbreOfKilometres <= 41){
    map.add(({"Tranche": "0 - 41 km", 'Frais': '-', 'Result': '4 €'}));
    return fixeTarif;
  }
  // The treatment if the nb km < 41
  else{
    map.add(({"Tranche": "0 - 41 km", 'Frais': '-', 'Result': '4 €'}));
  for (TrancheKilometrique tranche in tranchesKilometriques) {
      if (numbreOfKilometres >= tranche.debutTranche) {
        if (numbreOfKilometres >= tranche.finTranche) {
          distanceInTranche = (tranche.finTranche - tranche.debutTranche);
        } else {
          distanceInTranche = numbreOfKilometres - tranche.debutTranche;
        }
        result += distanceInTranche * tranche.fraisRemboursement;
      }

    // get the data
    String trancheMap = tranche.finTranche.toInt().toString();
    double currentResult = (distanceInTranche * tranche.fraisRemboursement);

    //The last part of the tranche
    tranche.debutTranche == 150 ? trancheMap = ">" : trancheMap += " Km";

    map.add(
        ({"Tranche": "${tranche.debutTranche.toInt().toString()} - $trancheMap",
          'Frais': '${ formatDouble(tranche.fraisRemboursement)} €',
          'Result': ' ${formatDouble(currentResult)} €'}));
    if (numbreOfKilometres < tranche.finTranche) {
      break;
    }
  }
  }
  //Add the fixed tariff of the first tranche
  result+=fixeTarif;
  //Last item with the final result
   map.add(({"Tranche": "", 'Frais': '', 'Result': '${formatDouble(result)} €'}));

  return result;
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