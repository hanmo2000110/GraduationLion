import 'package:get/get.dart';
import 'package:graduationlion/controller/userController.dart';

class InitPageController extends GetxController{
  RxInt index = 0.obs;
  RxInt department = 0.obs;
  RxInt semester = 1.obs;
  RxInt englishSubmit = 0.obs;
  RxInt englishGrade = 0.obs;


  void decreaseIndex(){
    if(index.value>0) index.value--;
  }

  void increaseIndex(){
    if(index.value<3) index.value++;
  }

  void setDepartment(int idx){
    department.value = idx;
    update();
  }

  void setSemester(int idx){
    semester.value = idx;
  }

  void setEnglishSubmit(int idx){
    englishSubmit.value = idx;
  }

  void setEnglishGrade(int idx){
    englishGrade.value = idx;
  }

  void submit(){
    final UserController userController = Get.find<UserController>();
    userController.addInitData(department.value, semester.value, englishSubmit.value, englishGrade.value);
  }
}