import '../tools/Result.dart';

Result countFunds(int numbreOfKilometres) {

    // Définir les tranches et les taux de remboursement
    List<int> tranches = [0, 25, 45, 65, 85, 105, 125, 150]; // Tranches en kilomètres
    List<double> rateRefund = [0.0, 0.25, 0.30, 0.30, 0.35, 0.35, 0.40, 0.40]; // Taux en euros par kilomètre

    // Initialiser les frais à rembourser
    double result = 0.0;

    // la composition
    String resultComposition = "";

    // Calculer les frais à rembourser en fonction des tranches
    for (int i = 0; i < tranches.length - 1; i++) {
      int distanceInTranche = 0;

        // Calculer la distance dans la tranche actuelle
        if(numbreOfKilometres == 0){
          result = 0;
          resultComposition = '(${tranches[i]} * ${rateRefund[i]})';
        }
        else if (numbreOfKilometres > tranches[i] && numbreOfKilometres >= tranches[i+1]){

            distanceInTranche = tranches[i+1]-tranches[i] ;

        }else if(numbreOfKilometres > tranches[i] && numbreOfKilometres < tranches[i+1]){
          distanceInTranche =  numbreOfKilometres - tranches[i];
        }
        if(distanceInTranche == 0 ){
          break;
        }
        // Ajouter les frais pour la tranche actuelle
        if (i >= 0 && i < tranches.length) {
          resultComposition += "${i == 0 ? "" : " + "}($distanceInTranche * ${rateRefund[i]})";
        }

        result += distanceInTranche * rateRefund[i];
    }
    Result myResult = Result(result, resultComposition);

    return myResult;

  }


