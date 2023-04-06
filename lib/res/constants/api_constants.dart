class ApiConstants {
  ApiConstants._();
  static const String baseUrlPQMS = "https://doctopad-a2d-dev.el.r.appspot.com/";
 // static const String baseUrlPWER = "http://doctopad-a2d-dev.el.r.appspot.com/";
  static const String clientID = "Client123Cgg";
  static const String endPoint_MobileLogin = "mobileLogin";
  static const String endPoint_ImportList = "getIROList";
  static const String endPoint_ExportList = "getPSCAppDetails";
  static const String endPoint_ImportApplicationDetails =
      "saveExportPermitAction";
  static const String endPoint_ExportApplicationDetails = "getPSCAppDetails";
  static const String endPoint_DutyOfficersList = "getEmployeeListByRole";
  static const String endPoint_AppTransactionDetails = "gettransactionsByAppId";
  static const String endPoint_IroTransaction = "saveIpIroInspectorAction";
  static const String endPoint_ExportTransaction = "saveExportPermitAction";
  static const String endPoint_VersionCheck = "getCurrentAppVersion";
  static const String endPoint_AgencyList = "agenciesList";
  static const String endPoint_IroTreatmentReport = "saveIpIroInspectorAction";
  static const String endPoint_PscTreatmentReport = "saveExportPermitAction";
}
