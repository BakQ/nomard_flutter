import 'package:flutter/material.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  static const List<int> timeOptions = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50];

  int selectedTime = 25;
  int roundCnt = 0;
  int goalCnt = 0;

  int totalSeconds = 1500;
  bool isRunning = false;
  bool breakCheak = false;
  late Timer timer;

  void onTick(Timer timer) {
    setState(() {
      totalSeconds = totalSeconds - 1;
      if (totalSeconds > 0) {
      } else {
        if (breakCheak) {
          // 휴식시간인지 아닌지 체크
          totalSeconds = selectedTime; // test용
          //totalSeconds = selectedTime * 60;
        } else {
          roundCnt++;
          if (roundCnt == 4) {
            // 다채우면 골추가
            goalCnt++;
            roundCnt = 0;
          }
          totalSeconds = 2;
        }

        breakCheak = !breakCheak;

        //isRunning = false;
      }
    });
  }

  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
  }

  void toggleTimer() {
    if (isRunning) {
      timer.cancel();
      isRunning = false;
    } else {
      onStartPressed();
      isRunning = true;
    }
    setState(() {});
  }

  String formatTime(int seconds) {
    //var duration = Duration(seconds: seconds);
    //var time = duration.toString().split('.').first.substring(2);

    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void onTimeSelected(int time) {
    setState(() {
      selectedTime = time;

      totalSeconds = selectedTime * 60;
      //totalSeconds = 5;
    });
  }

  void timeStop() {
    setState(() {
      roundCnt = 0;
      goalCnt = 0;
      totalSeconds = selectedTime * 60;
    });
  }

  /// 선택된 항목을 중앙으로 스크롤
  void _scrollToCenter(int time) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) {
        return; // ScrollController가 연결되지 않은 경우 예외 방지
      }

      // 선택된 항목의 인덱스
      final index = timeOptions.indexOf(time);

      // 각 항목의 너비 + 간격 (Wrap.spacing)
      const double itemWidth = 100.0; // 항목의 예상 너비
      const double spacing = 30.0; // Wrap.spacing

      // 선택된 항목의 시작 위치 계산
      final selectedItemPosition = index * (itemWidth + spacing);

      // 스크롤뷰의 크기 (화면 너비)
      final screenWidth = MediaQuery.of(context).size.width;

      // 선택된 항목의 중심 위치로 이동
      final offset = selectedItemPosition - (screenWidth / 2) + (itemWidth / 2);

      // 스크롤 애니메이션 실행
      _scrollController.animateTo(
        offset,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _scrollController.dispose(); // ScrollController 해제
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Flexible(
              //헤더
              flex: 1,
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 30.0),
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'POMOTIMER',
                      style: TextStyle(
                        color: Theme.of(context).cardColor,
                        letterSpacing: 2,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              //시간
              flex: 3,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  formatTime(totalSeconds),
                  style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 95,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Center(
                child: ShaderMask(
                  shaderCallback: (bounds) {
                    return LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.black.withOpacity(1), // 왼쪽 불투명
                        Colors.black.withOpacity(0.0), // 중앙 투명
                        Colors.black.withOpacity(0.0), // 중앙 투명
                        Colors.black.withOpacity(1), //쪽 투명
                      ],
                      stops: const [
                        0.0,
                        0.4,
                        0.8,
                        1
                      ], //어디부터 시작할지 정하는거 colors 만큼 설정해주면됨
                    ).createShader(bounds);
                  },
                  blendMode: BlendMode.dstOut,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 180,
                      ),
                      child: Wrap(
                        spacing: 30.0,
                        alignment: WrapAlignment.center,
                        children: timeOptions.map(
                          (time) {
                            return ChoiceChip(
                              label: Text('$time'),
                              selected: selectedTime == time,
                              onSelected: (bool selected) {
                                // 실행중에 시간변경 x
                                if (!isRunning && selected) {
                                  onTimeSelected(time);
                                }
                                _scrollToCenter(time);
                              },
                              showCheckmark: false,
                              labelStyle: TextStyle(
                                fontSize: 30,
                                color: selectedTime == time
                                    ? Theme.of(context).scaffoldBackgroundColor
                                    : Theme.of(context).cardColor,
                              ),
                              selectedColor: Theme.of(context).cardColor,
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              shape: ContinuousRectangleBorder(
                                side: const BorderSide(
                                  width: 4.0,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              //버튼
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                child: isRunning
                    ? IconButton(
                        iconSize: 98,
                        color: Theme.of(context).cardColor,
                        onPressed: toggleTimer,
                        icon: const Icon(Icons.pause_circle_outline),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            iconSize: 98,
                            color: Theme.of(context).cardColor,
                            onPressed: toggleTimer,
                            icon: const Icon(Icons.play_circle_outline),
                          ),
                          if (totalSeconds != selectedTime * 60)
                            IconButton(
                              iconSize: 98,
                              color: Theme.of(context).cardColor,
                              onPressed: timeStop,
                              icon: const Icon(Icons.stop_circle_outlined),
                            ),
                        ],
                      ),
              ),
            ),
            Flexible(
              //라운드 골
              flex: 2,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$roundCnt/4',
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context)
                                    .cardColor
                                    .withOpacity(0.5),
                              ),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Text(
                              'ROUND',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(context).cardColor),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 90,
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$goalCnt/12',
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context)
                                    .cardColor
                                    .withOpacity(0.5),
                              ),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Text(
                              'GOAL',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(context).cardColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
