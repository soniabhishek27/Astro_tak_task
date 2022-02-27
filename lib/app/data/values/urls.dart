class URLs {
  URLs._privateConstructor();

  //Config APIs
  static const appConfig = "api/config";

  //User APIs
  static askQuestion(String category) {
    return "question/category/$category";
  }

  static const relativesUrl = '/relative/all';

  static deleteProfile({String? id}) {
    return 'relative/delete/$id';
  }

  static const allRelative = '/relative';
}
