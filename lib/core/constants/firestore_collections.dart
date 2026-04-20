class FirestoreCollections {
  const FirestoreCollections._();

  static const users = 'Users';
  static const courses = 'Courses';
  static const generalCourses = 'GCourses';
  static const bsm = 'BSM';
  static const specialGeneralCourses = 'SGCourses';

  // Existing Firestore collection name. Keep the typo for data compatibility.
  static const recommendations = 'Recommned';
}

class FirestorePaths {
  const FirestorePaths._();

  static String userCourse(String email, String courseId) {
    return '/${FirestoreCollections.users}/$email/'
        '${FirestoreCollections.courses}/$courseId';
  }
}
