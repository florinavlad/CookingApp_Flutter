import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/body.dart';
import '../size_config.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: CustomAppBar(),
      body: Body(),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: SvgPicture.asset(
          "icons/menu.svg",
          height: SizeConfig.defaultSize * 1.3,
        ),
        onPressed: () {},
      ),
      title: Center(
        child: Image.asset(
          "images/whiteLogo.png",
          height: SizeConfig.defaultSize * 5,
        ),
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset(
            "icons/user.svg",
            height: SizeConfig.defaultSize * 2.3,
          ),
          onPressed: () {},
        ),
        SizedBox(
          width: SizeConfig.defaultSize * 0.5,
        )
      ],
    );
  }
}
