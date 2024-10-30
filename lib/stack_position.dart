<<<<<<< HEAD

=======
import 'package:flutter/material.dart';

class StackPosition extends StatelessWidget {
  const StackPosition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              height: 200,
              child: Stack(
                children: [
                  Positioned(
                    child: Image(
                      image: AssetImage("asset/arle.png"),
                    ),
                    width: MediaQuery.of(context).size.width * 35 / 100,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        children: [Text("Rarw"), Icon(Icons.woman_2)],
                      )),
                ],
              ),
              // child: Column(
              //   children: [
              //     Image(
              //       image: AssetImage("asset/Arle.png"),
              //       width: MediaQuery.of(context).size.width * 35 / 100,
              //     ),
              //     Container(
              //         width: MediaQuery.of(context).size.width,
              //         padding: EdgeInsets.only(left: 10, right: 10),
              //         child: Row(
              //           children: [Text("Bojo Ku"), Icon(Icons.woman_2)],
              //         )),
              //   ],
              // ),
            )
          ],
        ),
      ),
    );
  }
}
>>>>>>> 3671095ae2e623fce880bc216ad5d76e72f694bf
