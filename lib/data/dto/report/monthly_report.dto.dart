import 'report_body.dto.dart';

class MonthlyReport {
  MonthlyReport({
    this.m1 = const [],
    this.m2 = const [],
    this.m3 = const [],
    this.m4 = const [],
    this.m5 = const [],
    this.m6 = const [],
    this.m7 = const [],
    this.m8 = const [],
    this.m9 = const [],
    this.m10 = const [],
    this.m11 = const [],
    this.m12 = const [],
    this.m13 = const [],
    this.m14 = const [],
    this.m15 = const [],
    this.m16 = const [],
    this.m17 = const [],
    this.m18 = const [],
    this.m19 = const [],
    this.m20 = const [],
    this.m21 = const [],
    this.m22 = const [],
    this.m23 = const [],
    this.m24 = const [],
    this.m25 = const [],
    this.m26 = const [],
    this.m27 = const [],
    this.m28 = const [],
    this.m29 = const [],
    this.m30 = const [],
  });

  MonthlyReport.fromJson(dynamic json) {
    if (json['01'] != null) {
      m1 = [];
      json['01'].forEach((v) {
        m1.add(ReportBodyDto.fromJson(v));
      });
    }
    if (json['02'] != null) {
      m2 = [];
      json['02'].forEach((v) {
        m2.add(ReportBodyDto.fromJson(v));
      });
    }
    if (json['03'] != null) {
      m3 = [];
      json['03'].forEach((v) {
        m3.add(ReportBodyDto.fromJson(v));
      });
    }
    if (json['04'] != null) {
      m4 = [];
      json['04'].forEach((v) {
        m4.add(ReportBodyDto.fromJson(v));
      });
    }
    if (json['05'] != null) {
      m5 = [];
      json['05'].forEach((v) {
        m5.add(ReportBodyDto.fromJson(v));
      });
    }
    if (json['06'] != null) {
      m6 = [];
      json['06'].forEach((v) {
        m6.add(ReportBodyDto.fromJson(v));
      });
    }
    if (json['07'] != null) {
      m7 = [];
      json['07'].forEach((v) {
        m7.add(ReportBodyDto.fromJson(v));
      });
    }
    if (json['08'] != null) {
      m8 = [];
      json['08'].forEach((v) {
        m8.add(ReportBodyDto.fromJson(v));
      });
    }
    if (json['09'] != null) {
      m9 = [];
      json['09'].forEach((v) {
        m9.add(ReportBodyDto.fromJson(v));
      });
    }
    if (json['10'] != null) {
      m10 = [];
      json['10'].forEach((v) {
        m10.add(ReportBodyDto.fromJson(v));
      });
    }
    if (json['11'] != null) {
      m11 = [];
      json['11'].forEach((v) {
        m11.add(ReportBodyDto.fromJson(v));
      });
    }
    if (json['12'] != null) {
      m12 = [];
      json['12'].forEach((v) {
        m12.add(ReportBodyDto.fromJson(v));
      });
    }
    if (json['13'] != null) {
      m13 = [];
      json['13'].forEach((v) {
        m13.add(ReportBodyDto.fromJson(v));
      });
    }
    if (json['14'] != null) {
      m14 = [];
      json['14'].forEach((v) {
        m14.add(ReportBodyDto.fromJson(v));
      });
    }
    if (json['15'] != null) {
      m15 = [];
      json['15'].forEach((v) {
        m15.add(ReportBodyDto.fromJson(v));
      });
    }
    if (json['16'] != null) {
      m16 = [];
      json['16'].forEach((v) {
        m16.add(ReportBodyDto.fromJson(v));
      });
    }
    if (json['17'] != null) {
      m17 = [];
      json['17'].forEach((v) {
        m17.add(ReportBodyDto.fromJson(v));
      });
    }
    if (json['18'] != null) {
      m18 = [];
      json['18'].forEach((v) {
        m18.add(ReportBodyDto.fromJson(v));
      });
    }
    if (json['19'] != null) {
      m19 = [];
      json['19'].forEach((v) {
        m19.add(ReportBodyDto.fromJson(v));
      });
    }
    if (json['20'] != null) {
      m20 = [];
      json['20'].forEach((v) {
        m20.add(ReportBodyDto.fromJson(v));
      });
    }
    if (json['21'] != null) {
      m21 = [];
      json['21'].forEach((v) {
        m21.add(ReportBodyDto.fromJson(v));
      });
    }
    if (json['22'] != null) {
      m22 = [];
      json['22'].forEach((v) {
        m22.add(ReportBodyDto.fromJson(v));
      });
    }
    if (json['23'] != null) {
      m23 = [];
      json['23'].forEach((v) {
        m23.add(ReportBodyDto.fromJson(v));
      });
    }
    if (json['24'] != null) {
      m24 = [];
      json['24'].forEach((v) {
        m24.add(ReportBodyDto.fromJson(v));
      });
    }
    if (json['25'] != null) {
      m25 = [];
      json['25'].forEach((v) {
        m25.add(ReportBodyDto.fromJson(v));
      });
    }
    if (json['26'] != null) {
      m26 = [];
      json['26'].forEach((v) {
        m26.add(ReportBodyDto.fromJson(v));
      });
    }
    if (json['27'] != null) {
      m27 = [];
      json['27'].forEach((v) {
        m27.add(ReportBodyDto.fromJson(v));
      });
    }
    if (json['28'] != null) {
      m28 = [];
      json['28'].forEach((v) {
        m28.add(ReportBodyDto.fromJson(v));
      });
    }
    if (json['29'] != null) {
      m29 = [];
      json['29'].forEach((v) {
        m29.add(ReportBodyDto.fromJson(v));
      });
    }
    if (json['30'] != null) {
      m30 = [];
      json['30'].forEach((v) {
        m30.add(ReportBodyDto.fromJson(v));
      });
    }
  }

  late final List<ReportBodyDto> m1;
  late final List<ReportBodyDto> m2;
  late final List<ReportBodyDto> m3;
  late final List<ReportBodyDto> m4;
  late final List<ReportBodyDto> m5;
  late final List<ReportBodyDto> m6;
  late final List<ReportBodyDto> m7;
  late final List<ReportBodyDto> m8;
  late final List<ReportBodyDto> m9;
  late final List<ReportBodyDto> m10;
  late final List<ReportBodyDto> m11;
  late final List<ReportBodyDto> m12;
  late final List<ReportBodyDto> m13;
  late final List<ReportBodyDto> m14;
  late final List<ReportBodyDto> m15;
  late final List<ReportBodyDto> m16;
  late final List<ReportBodyDto> m17;
  late final List<ReportBodyDto> m18;
  late final List<ReportBodyDto> m19;
  late final List<ReportBodyDto> m20;
  late final List<ReportBodyDto> m21;
  late final List<ReportBodyDto> m22;
  late final List<ReportBodyDto> m23;
  late final List<ReportBodyDto> m24;
  late final List<ReportBodyDto> m25;
  late final List<ReportBodyDto> m26;
  late final List<ReportBodyDto> m27;
  late final List<ReportBodyDto> m28;
  late final List<ReportBodyDto> m29;
  late final List<ReportBodyDto> m30;
}
