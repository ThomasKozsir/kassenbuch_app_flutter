class Transaktion {
  String datum,
      belegnummer,
      saldoAenderung,
      konto,
      ust,
      kostenstelle,
      kostentraeger,
      buchungstext;
  bool hochgeladen, plus;

  Transaktion(
      this.datum,
      this.belegnummer,
      this.saldoAenderung,
      this.konto,
      this.ust,
      this.kostenstelle,
      this.kostentraeger,
      this.buchungstext,
      this.hochgeladen,
      {this.plus});
}
