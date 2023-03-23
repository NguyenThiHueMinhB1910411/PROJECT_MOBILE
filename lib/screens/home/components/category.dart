import 'package:order_app/models/Category.dart';
import 'package:order_app/screens/Screens.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List.generate(
        show_categories.length,
        (index) => Padding(
          padding: const EdgeInsets.only(right: 20),
          child: CategoryCard(
            image: show_categories[index].image,
            title: show_categories[index].title,
            type: show_categories[index].type,

            //press: () {},
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ShowCategoryList();
                  },
                ),
              );
            },
          ),
        ),
      )),
    );
  }
}
