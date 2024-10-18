class ShareInfo {
  String infoId;
  int infoLevel;
  String infoTitle;
  String infoSubtitle;
  bool copyActive;
  String dateAdded;
  String? dateModified;

  ShareInfo({
    required this.infoId,
    required this.infoLevel,
    required this.infoTitle,
    required this.infoSubtitle,
    required this.copyActive,
    required this.dateAdded,
    this.dateModified,
  });

  // Factory method to create a ShareInfo object from a map (JSON)
  factory ShareInfo.fromJson(Map<String, dynamic> json) {
    return ShareInfo(
      infoId: json['info_id'],
      infoLevel: int.parse(json['info_level']),
      infoTitle: json['info_title'],
      infoSubtitle: json['info_subtitle'],
      copyActive: json['copy_active'],
      dateAdded: json['date_added'],
      dateModified: json['date_modified'],
    );
  }

  // Method to convert a ShareInfo object into a map (for serialization)
  Map<String, dynamic> toJson() {
    return {
      'info_id': infoId,
      'info_level': infoLevel,
      'info_title': infoTitle,
      'info_subtitle': infoSubtitle,
      'copy_active': copyActive,
      'date_added': dateAdded,
      'date_modified': dateModified,
    };
  }
}
