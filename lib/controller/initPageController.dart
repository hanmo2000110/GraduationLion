import 'package:get/get.dart';

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
    print(semester.value);
    update();
  }

  void setEnglishSubmit(int idx){
    englishSubmit.value = idx;
    update();
  }

  void setEnglishGrade(int idx){
    englishGrade.value = idx;
    update();
  }
}