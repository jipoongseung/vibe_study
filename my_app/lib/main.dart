// Flutter의 기본 UI 컴포넌트들을 사용하기 위한 패키지 import
import 'package:flutter/material.dart';

/// 앱의 시작점 (Entry Point)
/// Flutter 앱이 실행될 때 가장 먼저 호출되는 함수
void main() {
  // runApp: Flutter 앱을 실행하는 함수
  // MyApp 위젯을 화면의 최상위 위젯으로 설정
  runApp(const MyApp());
}

/// 1단계: 앱의 최상위 위젯 (Root Widget)
/// StatelessWidget: 상태가 변하지 않는 위젯 (정적 위젯)
class MyApp extends StatelessWidget {
  // const 생성자: 컴파일 타임에 생성되어 성능 최적화
  const MyApp({super.key});

  /// build 메서드: 위젯이 화면에 어떻게 그려질지 정의
  /// Flutter는 build 메서드를 호출해서 UI를 생성함
  @override
  Widget build(BuildContext context) {
    // MaterialApp: Material Design 스타일의 앱을 만드는 최상위 위젯
    // 앱의 전역 설정(테마, 라우팅 등)을 담당
    return MaterialApp(
      title: 'Flutter Demo', // 앱의 제목 (작업 관리자에서 보임)
      
      // theme: 앱 전체의 색상, 폰트, 스타일 등을 정의
      theme: ThemeData(
        // colorScheme: 앱의 색상 팔레트 설정
        // deepPurple을 기본 색으로 하여 조화로운 색상들을 자동 생성
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      
      // home: 앱이 시작될 때 보여줄 첫 화면
      home: const MyHomePage(title: '나의 첫 플러터앱 '),
    );
  }
}

/// 2단계: 홈 화면 위젯
/// StatefulWidget: 상태가 변할 수 있는 위젯 (동적 위젯)
/// 사용자 상호작용이나 데이터 변경에 따라 UI가 변경될 수 있음
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // final: 한 번 설정되면 변경할 수 없는 변수
  // 부모로부터 전달받은 제목을 저장
  final String title;

  /// createState: 이 위젯의 상태를 관리할 State 객체 생성
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

/// 3단계: 홈 화면의 상태 관리 클래스
/// State 클래스는 위젯의 데이터와 로직을 담당
/// 언더스코어(_)로 시작: Dart에서 private을 의미 (이 파일 내에서만 사용)
class _MyHomePageState extends State<MyHomePage> {
  /// 환영 다이얼로그(팝업창)를 보여주는 함수
  void _showWelcomeDialog() {
    // showDialog: 화면 위에 팝업 창을 띄우는 Flutter 함수
    showDialog(
      context: context, // 현재 화면의 정보를 담고 있는 context
      
      // builder: 다이얼로그의 내용을 구성하는 함수
      builder: (BuildContext context) {
        // AlertDialog: Material Design 스타일의 경고/알림 대화상자
        return AlertDialog(
          title: const Text('환영합니다'), // 다이얼로그 제목
          content: const Text('플러터 세계에 오신 것을 환영합니다!'), // 내용
          
          // actions: 다이얼로그 하단의 버튼들
          actions: [
            TextButton(
              // onPressed: 버튼을 눌렀을 때 실행할 함수
              // Navigator.pop: 현재 다이얼로그를 닫음
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('확인'),
            ),
          ],
        );
      },
    );
  }

  /// build 메서드: 화면에 보여줄 UI 구조를 정의
  /// Flutter는 위젯 트리(나무 구조)로 UI를 표현함
  @override
  Widget build(BuildContext context) {
    // 🏗️ UI 위젯 계층 구조 시작
    
    // Scaffold: 기본적인 화면 레이아웃 구조를 제공하는 위젯
    // (앱바, 본문, 하단바 등을 배치할 수 있는 뼈대)
    return Scaffold(
      // ┌─────────────────────────────────┐
      // │ AppBar: 화면 상단의 타이틀바    │
      // └─────────────────────────────────┘
      appBar: AppBar(
        // 테마의 inversePrimary 색상을 배경색으로 사용
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // widget.title: StatefulWidget의 속성에 접근
        title: Text(widget.title),
      ),
      
      // ┌─────────────────────────────────┐
      // │ body: 화면의 본문 영역          │
      // │ (가장 중요한 내용이 들어가는 곳)│
      // └─────────────────────────────────┘
      body: Center( // Center: 자식 위젯을 화면 중앙에 배치
        child: Padding( // Padding: 자식 위젯 주변에 여백 추가
          padding: const EdgeInsets.all(16), // 상하좌우 16픽셀 여백
          
          // ElevatedButton: 입체감 있는 버튼 위젯
          child: ElevatedButton(
            // 버튼을 눌렀을 때 _showWelcomeDialog 함수 실행
            onPressed: _showWelcomeDialog,
            child: const Text('환영 메시지 보기'), // 버튼에 표시될 텍스트
          ),
        ),
      ),
    );
  }
}
