# Architecture

GraduationLion은 Flutter UI, GetX 상태 관리, Firebase 인증/Firestore 데이터 저장소로 구성된 모바일 앱입니다. 기존 기능 구현을 유지하면서 각 계층의 책임을 아래처럼 정리합니다.

## Runtime Flow

```text
main.dart
  └─ Firebase.initializeApp
  └─ GetMaterialApp
      ├─ InitBinding
      ├─ AppPages
      └─ SplashScreen
```

앱 시작 시 Firebase를 초기화하고, GetX 라우팅과 의존성 주입을 등록합니다. 화면 이동은 `lib/route/pages.dart`와 `lib/route/routes.dart`에서 관리합니다.

## Layers

### Screens

`lib/screen/`은 사용자에게 보이는 화면을 담당합니다.

- `login.dart`: Google 로그인 진입점
- `InitPage/`: 학과, 학기, 영어 성적 등 초기 사용자 정보 입력
- `home.dart`: 졸업 요건 진행 상황
- `addCourse.dart`: 수강 과목 검색 및 추가
- `recommend.dart`: 추천 과목 확인
- `mypage.dart`: 사용자 정보 및 수강 과목 관리

### Controllers

`lib/controller/`는 UI에서 사용하는 앱 상태와 Firestore 입출력을 담당합니다.

- `UserController`: 로그인, 사용자 데이터, 수강 과목 추가/삭제
- `CourseController`: 전공/교양/BSM/실무 영어 과목 로딩 및 카테고리 필터링
- `RequirementController`: 졸업 요건 충족 현황 계산
- `RecommendController`: 사용자 정보 기반 추천 과목 로딩
- `InitPageController`: 초기 정보 입력 화면 상태 관리
- `NavigationController`: 하단 내비게이션 상태 관리

### Models

`lib/model/`은 Firestore 문서를 Dart 객체로 변환하는 Freezed 모델을 담고 있습니다.

- `CourseModel`: 전공 과목
- `GCourseModel`: 교양/BSM/실무 영어 과목
- `UserCourseModel`: 사용자별 수강 과목
- `UserModel`: 사용자 기본 정보

`lib/model/freezedModel/` 하위 파일은 code generation 결과물입니다.

## Firestore Collections

코드에서 참조하는 주요 컬렉션은 다음과 같습니다.

```text
Courses
GCourses
BSM
SGCourses
Recommned/{major}/Courses
Users/{email}
Users/{email}/Courses
```

`Recommned`는 기존 Firestore 컬렉션 이름을 그대로 사용합니다. 코드 레벨에서는 오타를 보완하되, 실제 데이터베이스 컬렉션명은 기능 호환성을 위해 유지합니다.

## Development Notes

- 상태 관리는 GetX 컨트롤러 중심으로 구성되어 있습니다.
- Firebase 설정 파일은 기존 프로젝트 연결을 위해 유지합니다.
- Freezed 모델 변경 시 `build_runner`로 generated 파일을 갱신해야 합니다.
- 포트폴리오 정리에서는 기능 로직을 바꾸지 않고 문서, 설정, 네이밍, import 정리에 초점을 둡니다.
