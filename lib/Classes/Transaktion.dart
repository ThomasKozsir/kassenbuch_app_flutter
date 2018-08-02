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
      this.plus);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Transaktion &&
              runtimeType == other.runtimeType &&
              datum == other.datum &&
              belegnummer == other.belegnummer &&
              saldoAenderung == other.saldoAenderung &&
              konto == other.konto &&
              ust == other.ust &&
              kostenstelle == other.kostenstelle &&
              kostentraeger == other.kostentraeger &&
              buchungstext == other.buchungstext &&
              hochgeladen == other.hochgeladen &&
              plus == other.plus;

  @override
  int get hashCode =>
      datum.hashCode ^
      belegnummer.hashCode ^
      saldoAenderung.hashCode ^
      konto.hashCode ^
      ust.hashCode ^
      kostenstelle.hashCode ^
      kostentraeger.hashCode ^
      buchungstext.hashCode ^
      hochgeladen.hashCode ^
      plus.hashCode;



}
