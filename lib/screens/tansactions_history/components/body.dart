import 'package:flutter/material.dart';
import 'package:flutter_test_task/const/constants.dart';
import 'package:flutter_test_task/const/size_config.dart';
import 'package:flutter_test_task/screens/tansactions_history/components/select_form.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenHeight(10),
          ),
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.05,
              ),
              CircleAvatar(
                child: Image.asset(
                  "assets/images/us_flag.png",
                  fit: BoxFit.fill,
                ),
                backgroundColor: Colors.transparent,
                radius: SizeConfig.screenWidth / 10,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'USD Account',
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(20),
                          color: kTextColor),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          side: BorderSide(color: kTextColor)),
                      onPressed: () {},
                      child: Text(
                        'Hide',
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(15),
                            color: kSecondaryTextColor),
                      ),
                    ),
                  )
                ],
              ),
              Text(
                "${r"$"} 180,970.83",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(30),
                    color: kSecondaryTextColor),
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.15,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Transactions History",
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(20),
                      color: kTextColor),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(25),
              ),
              SelectForm(),
            ],
          ),
        ),
      ),
    );
  }
}
