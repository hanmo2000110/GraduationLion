import 'package:get/get.dart';

class InitPageController extends GetxController{
  RxInt index = 0.obs;
  RxInt department = 0.obs;

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
}