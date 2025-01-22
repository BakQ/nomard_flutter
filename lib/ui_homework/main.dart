import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    clipBehavior: Clip.hardEdge,
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      fixedSize: const Size(60, 60),
                    ),
                    onPressed: () {},
                    child: Transform.scale(
                      scale: 4,
                      child: Image.asset(
                        "imgs/haku.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.add_rounded,
                    color: Colors.white,
                    opticalSize: 50,
                    size: 40,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'MONDAY 16',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  'TODAY',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(width: 10), // 간격
                // 핑크색 점
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.pink,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 5), // 간격
                // 숫자들
                Expanded(
                  // Row의 자식이 가로로 확장될 수 있도록 설정
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal, // 수평 스크롤 활성화
                    child: Row(
                      children: [
                        for (int i = 17; i <= 31; i++) // 반복문으로 숫자 생성
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              '$i',
                              style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xfffef754),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        '11',
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const Text(
                                        '30',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const SizedBox(height: 5), // 구분선 간격
                                      Container(
                                        width: 1,
                                        height: 30,
                                        color: Colors.black, // 세로 구분선
                                      ),
                                      const SizedBox(height: 5),
                                      const Text(
                                        '12',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const Text(
                                        '20',
                                        style: TextStyle(
                                          fontSize: 15,
                                          height: 0.88,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      top: 30,
                                      left: 15,
                                      bottom: 30,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      //mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'DESIGN',
                                          style: TextStyle(
                                            fontSize: 70,
                                            fontWeight: FontWeight.w500,
                                            height: 0.88,
                                          ),
                                        ),
                                        Text(
                                          'MEETING',
                                          style: TextStyle(
                                            fontSize: 70,
                                            fontWeight: FontWeight.w500,
                                            height: 0.88,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    width: 35,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 17,
                                    ),
                                    child: Text(
                                      'ALEX',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black.withOpacity(0.4),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 17,
                                    ),
                                    child: Text(
                                      'HELENA',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black.withOpacity(0.4),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 17,
                                    ),
                                    child: Text(
                                      'NANA',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black.withOpacity(0.4),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xff9c6bce),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        '12',
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const Text(
                                        '35',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const SizedBox(height: 5), // 구분선 간격
                                      Container(
                                        width: 1,
                                        height: 30,
                                        color: Colors.black, // 세로 구분선
                                      ),
                                      const SizedBox(height: 5),
                                      const Text(
                                        '14',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const Text(
                                        '10',
                                        style: TextStyle(
                                          fontSize: 15,
                                          height: 0.88,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      top: 30,
                                      left: 15,
                                      bottom: 30,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      //mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'DAILY',
                                          style: TextStyle(
                                            fontSize: 70,
                                            fontWeight: FontWeight.w500,
                                            height: 0.88,
                                          ),
                                        ),
                                        Text(
                                          'PROJECT',
                                          style: TextStyle(
                                            fontSize: 70,
                                            fontWeight: FontWeight.w500,
                                            height: 0.88,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    width: 35,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 17,
                                    ),
                                    child: Text(
                                      'ME',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black.withOpacity(1),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 17,
                                    ),
                                    child: Text(
                                      'RICHARD',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black.withOpacity(0.4),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 17,
                                    ),
                                    child: Text(
                                      'CIRY',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black.withOpacity(0.4),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 17,
                                    ),
                                    child: Text(
                                      '+4',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black.withOpacity(0.4),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xffbcee4b),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        '15',
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const Text(
                                        '00',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const SizedBox(height: 5), // 구분선 간격
                                      Container(
                                        width: 1,
                                        height: 30,
                                        color: Colors.black, // 세로 구분선
                                      ),
                                      const SizedBox(height: 5),
                                      const Text(
                                        '16',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const Text(
                                        '30',
                                        style: TextStyle(
                                          fontSize: 15,
                                          height: 0.88,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      top: 30,
                                      left: 15,
                                      bottom: 30,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      //mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'WEEKLY',
                                          style: TextStyle(
                                            fontSize: 70,
                                            fontWeight: FontWeight.w500,
                                            height: 0.88,
                                          ),
                                        ),
                                        Text(
                                          'PLANNING',
                                          style: TextStyle(
                                            fontSize: 65,
                                            fontWeight: FontWeight.w500,
                                            height: 0.88,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    width: 35,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 17,
                                    ),
                                    child: Text(
                                      'DEN',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black.withOpacity(0.4),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 17,
                                    ),
                                    child: Text(
                                      'NANA',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black.withOpacity(0.4),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 17,
                                    ),
                                    child: Text(
                                      'MARK',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black.withOpacity(0.4),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
