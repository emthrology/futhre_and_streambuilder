import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: 16.0,
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: getNum(),
          // snapshot 이 watch 되고 있어서 그때 마다 re-render (setState 같은)된다
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              //데이터 있을때 위젯 랜더링
            }
            if(snapshot.hasError) {
              //에러 발생시 위젯 랜더링
            }

            //로딩중일때 위젯 랜더링

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'FutureBuilder',
                  style:textStyle.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0,
                  )
                ),
                Text(
                  'ConnState: ${snapshot.connectionState}',
                  style: textStyle,
                ),
                Text(
                  'Data: ${snapshot.data}',
                  style: textStyle,
                ),
                Text(
                  'Error: ${snapshot.error}',
                  style: textStyle,
                ), 
                ElevatedButton(onPressed: (){
                  //futureBuilder 를 인위적으로 작동시키기: state 를 빈상태로 불러도 futureBuilder는 기존 데이터값을 기억(캐싱)
                  //한편 에러는 캐싱되자않아?
                  setState(() {});
                }, child: Text('setState'))
              ],
            );
          },
        ),
      )
    );
  }

  Future<int> getNum() async {
    await Future.delayed(Duration(seconds: 3));

    final rd = Random();

    // throw Exception('error occurred');

    return rd.nextInt(100);
  }
}
