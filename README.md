# GraduationLion

졸업사자는 한동대학교 학생들이 복잡한 졸업 요건을 더 쉽게 확인하고, 지금까지 수강한 과목을 기준으로 다음 학기 수업을 추천받을 수 있도록 만든 Flutter 앱입니다.

## 핵심 기능

- 수강 과목 기반 졸업 요건 충족 현황 확인
- 전공, 교양, BSM, 실무 영어 등 졸업 요건별 인정 과목 탐색
- 현재 학기와 이수 현황을 고려한 다음 학기 수업 추천
- Google 로그인과 Firebase Firestore 기반 사용자별 수강 과목 관리

## 대상 사용자

- 졸업 요건을 처음 확인하는 한동대학교 신입생 및 편입생
- 전공별 졸업 요건과 추천 수강 흐름을 빠르게 파악하고 싶은 재학생
- 수강한 과목이 어떤 졸업 요건에 반영되는지 확인하고 싶은 학생

## 기술 스택

- Flutter
- Dart
- GetX
- Firebase Authentication
- Cloud Firestore
- Freezed / json_serializable

## 프로젝트 구조

```text
lib/
├── binding/       # GetX 의존성 주입
├── controller/    # 인증, 수강 과목, 졸업 요건, 추천 로직
├── model/         # Firestore 데이터 모델 및 Freezed generated 파일
├── route/         # GetX 라우트 정의
├── screen/        # 화면 UI
├── firebase_options.dart
└── main.dart
```

자세한 구조와 데이터 흐름은 [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md)를 참고하세요.

## 실행 방법

Flutter SDK가 설치된 환경에서 다음 명령어를 실행합니다.

```bash
flutter pub get
flutter run
```

Firebase 설정 파일이 포함된 프로젝트이므로 Android, iOS, macOS 타깃에서 기존 Firebase 프로젝트와 연결됩니다.

## 개발 메모

이 저장소는 기존에 구현된 기능을 유지하면서 포트폴리오용으로 문서와 프로젝트 구성을 정리한 버전입니다. 기능 동작 방식은 유지하고, 프로젝트의 의도와 구조를 읽기 쉽게 드러내는 데 초점을 두었습니다.
