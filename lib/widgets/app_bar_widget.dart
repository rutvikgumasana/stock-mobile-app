import 'package:flutter/material.dart';

PreferredSize appBar() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(130), // Set this height
    child: Container(
      // color: Colors.orange,
      decoration: const BoxDecoration(
          color: Color(0XFF000025),
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Hello, Smith!✌',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              ),
              SizedBox(
                height: 06,
              ),
              Text(
                'Good morning,',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ],
          ),
          const Spacer(),
          //profile picture
          Container(
            height: 45,
            width: 45,
            // margin: EdgeInsets.only(top: 10),
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(
                      "assets/profile.png",
                    ),
                    fit: BoxFit.cover)),
          )
        ],
      ),
    ),
  );
}
