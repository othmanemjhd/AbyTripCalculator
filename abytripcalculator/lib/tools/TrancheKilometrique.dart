class TrancheKilometrique {
  int debutTranche;
  int finTranche;
  double fraisRemboursement;

  TrancheKilometrique(this.debutTranche, this.finTranche, this.fraisRemboursement);


}

/*void main() {
  // Exemple d'utilisation de la classe TrancheKilometrique
  TrancheKilometrique tranche1 = TrancheKilometrique(0, 100, 0.5);
  TrancheKilometrique tranche2 = TrancheKilometrique(101, 200, 0.4);
  TrancheKilometrique tranche3 = TrancheKilometrique(201, 300, 0.3);

  // Vous pouvez maintenant stocker ces objets TrancheKilometrique dans une liste ou une autre structure selon vos besoins.
  List<TrancheKilometrique> TrancheKilometriques = [tranche1, tranche2, tranche3];

  // Exemple : Afficher les tranches et les frais de remboursement
  for (TrancheKilometrique tranche in TrancheKilometriques) {
    print('De ${tranche.debutTranche} à ${tranche.finTranche} km : ${tranche.fraisRemboursement} EUR/km');
  }
}*/
