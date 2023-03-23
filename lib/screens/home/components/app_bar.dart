import 'package:order_app/screens/Screens.dart';

AppBar homeAppBar(BuildContext context) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.green,
    //backgroundColor: Color.fromARGB(255, 70, 187, 136),
    elevation: 0,
    leading: IconButton(
      icon: const Icon(Icons.menu),

      // icon: SvgPicture.asset("assets/icons/menu.svg"),
      onPressed: () {
      },
    ),
    title: RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: Theme.of(context)
            .textTheme
            .headline6
            ?.copyWith(fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: "HM",
            style: TextStyle(color: Colors.white),
          ),
          TextSpan(
            text: "Drink",
            style: TextStyle(color: kPrimaryColor),
          ),
        ],
      ),
    ),
    actions: <Widget>[
      IconButton(
        icon: const Icon(Icons.doorbell_rounded),
        onPressed: () {},
      ),
    ],
  );
}
