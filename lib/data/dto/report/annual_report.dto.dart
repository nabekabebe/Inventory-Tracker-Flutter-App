import 'report_body.dto.dart';

class AnnualReport {
  AnnualReport({
    this.jan = const [],
    this.feb = const [],
    this.mar = const [],
    this.apr = const [],
    this.may = const [],
    this.jun = const [],
    this.jul = const [],
    this.aug = const [],
    this.sep = const [],
    this.oct = const [],
    this.nov = const [],
    this.dec = const [],
  });

  AnnualReport.fromJson(dynamic json) {
    if (json['Jan'] != null) {
      jan = [];
      json['Jan'].forEach((v) {
        jan.add(ReportBodyDto.fromJson(v));
      });
    }
    if (json['Feb'] != null) {
      feb = [];
      json['Feb'].forEach((v) {
        feb.add(ReportBodyDto.fromJson(v));
      });
    }
    if (json['Mar'] != null) {
      mar = [];
      json['Mar'].forEach((v) {
        mar.add(ReportBodyDto.fromJson(v));
      });
    }
    if (json['Apr'] != null) {
      apr = [];
      json['Apr'].forEach((v) {
        apr.add(ReportBodyDto.fromJson(v));
      });
    }
    if (json['May'] != null) {
      may = [];
      json['May'].forEach((v) {
        may.add(ReportBodyDto.fromJson(v));
      });
    }
    if (json['Jun'] != null) {
      jun = [];
      json['Jun'].forEach((v) {
        jun.add(ReportBodyDto.fromJson(v));
      });
    }
    if (json['Jul'] != null) {
      jul = [];
      json['Jul'].forEach((v) {
        jul.add(ReportBodyDto.fromJson(v));
      });
    }
    if (json['Aug'] != null) {
      aug = [];
      json['Aug'].forEach((v) {
        aug.add(ReportBodyDto.fromJson(v));
      });
    }
    if (json['Sep'] != null) {
      sep = [];
      json['Sep'].forEach((v) {
        sep.add(ReportBodyDto.fromJson(v));
      });
    }
    if (json['Oct'] != null) {
      oct = [];
      json['Oct'].forEach((v) {
        oct.add(ReportBodyDto.fromJson(v));
      });
    }
    if (json['Nov'] != null) {
      nov = [];
      json['Nov'].forEach((v) {
        nov.add(ReportBodyDto.fromJson(v));
      });
    }
    if (json['Dec'] != null) {
      dec = [];
      json['Dec'].forEach((v) {
        dec.add(ReportBodyDto.fromJson(v));
      });
    }
  }

  late final List<ReportBodyDto> jan;
  late final List<ReportBodyDto> feb;
  late final List<ReportBodyDto> mar;
  late final List<ReportBodyDto> apr;
  late final List<ReportBodyDto> may;
  late final List<ReportBodyDto> jun;
  late final List<ReportBodyDto> jul;
  late final List<ReportBodyDto> aug;
  late final List<ReportBodyDto> sep;
  late final List<ReportBodyDto> oct;
  late final List<ReportBodyDto> nov;
  late final List<ReportBodyDto> dec;
}
