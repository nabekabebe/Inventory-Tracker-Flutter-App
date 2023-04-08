import 'report_body.dto.dart';

class WeeklyReport {
  WeeklyReport({
    this.mon = const [],
    this.tue = const [],
    this.wed = const [],
    this.thu = const [],
    this.fri = const [],
    this.sat = const [],
    this.sun = const [],
  });

  WeeklyReport.fromJson(dynamic json) {
    if (json['Jan'] != null) {
      mon = [];
      json['Jan'].forEach((v) {
        mon.add(ReportBodyDto.fromJson(v));
      });
    }
    if (json['Feb'] != null) {
      tue = [];
      json['Feb'].forEach((v) {
        tue.add(ReportBodyDto.fromJson(v));
      });
    }
    if (json['Mar'] != null) {
      wed = [];
      json['Mar'].forEach((v) {
        wed.add(ReportBodyDto.fromJson(v));
      });
    }
    if (json['Apr'] != null) {
      thu = [];
      json['Apr'].forEach((v) {
        thu.add(ReportBodyDto.fromJson(v));
      });
    }
    if (json['May'] != null) {
      fri = [];
      json['May'].forEach((v) {
        fri.add(ReportBodyDto.fromJson(v));
      });
    }
    if (json['Jun'] != null) {
      sat = [];
      json['Jun'].forEach((v) {
        sat.add(ReportBodyDto.fromJson(v));
      });
    }
    if (json['Jul'] != null) {
      sun = [];
      json['Jul'].forEach((v) {
        sun.add(ReportBodyDto.fromJson(v));
      });
    }
  }

  late final List<ReportBodyDto> mon;
  late final List<ReportBodyDto> tue;
  late final List<ReportBodyDto> wed;
  late final List<ReportBodyDto> thu;
  late final List<ReportBodyDto> fri;
  late final List<ReportBodyDto> sat;
  late final List<ReportBodyDto> sun;
}
