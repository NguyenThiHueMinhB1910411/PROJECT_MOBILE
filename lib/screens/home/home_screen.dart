import 'package:order_app/models/Product.dart';
import 'package:order_app/screens/Screens.dart';

class HomeScreen extends StatefulWidget {
  //
  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<void> _fetchProducts;

  @override
  void initState() {
    super.initState();
    _fetchProducts = context.read<ProductsManager>().fetchProducts(false);
  }

  @override
  Widget build(BuildContext context) {
    const outlineInputBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide.none,
    );

    return FutureBuilder(
        future: _fetchProducts,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return RefreshIndicator(
            onRefresh: () => _fetchProducts,
            child: Scaffold(
              appBar: homeAppBar(context),
              resizeToAvoidBottomInset: false,
              body: SingleChildScrollView(
                  child: Padding(
                padding: EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 20, bottom: 20),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Form(
                                child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: "Search item...",
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: outlineInputBorder,
                                  focusedBorder: outlineInputBorder,
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Icon(Icons.search),
                                  ),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 12),
                                    child: SizedBox(
                                      height: 48,
                                      width: 48,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                        ),
                                        child: Icon(
                                          Icons.filter_alt,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )),
                            )),
                          ),

                          // ////////////
                          Banner(),
                          /////////
                          const Categories(),
                          const SizedBox(
                            height: 10,
                          ),
                          TraSua(),
                          const SizedBox(
                            height: 10,
                          ),
                          Tra(),
                          const SizedBox(
                            height: 10,
                          ),
                          DaXay(),
                          const SizedBox(
                            height: 10,
                          ),
                          Latte(),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
              bottomNavigationBar: BottomNavBar(),
            ),
          );
        });
  }

  Container Banner() {
    return Container(
      child: Container(
          // padding: EdgeInsets.only(bottom: 20),
          margin: EdgeInsets.only(bottom: 30),
          //width: 700,
          //height: 300,
          child: Image.asset("assets/images/banner_milk_tea_1.jpg")),
    );
  }
}

class TraSua extends StatelessWidget {
  const TraSua({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var products = context.read<ProductsManager>().items;

    return Column(
      children: [
        SectionTitle(
          title: "Trà sữa",
          pressSeeAll: () {},
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
                products.length,
                (index) => Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: ProductCard(products[index]
                          // press: () {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) {
                          //         return DetailsScreen(show_product[index]);
                          //         // return DetailsScreen();
                          //       },
                          //     ),
                          //   );
                          // },
                          ),
                    )),
          ),
        )
      ],
    );
  }
}

class Tra extends StatelessWidget {
  const Tra({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var products = context.read<ProductsManager>().items;

    return Column(
      children: [
        SectionTitle(
          title: "Trà",
          pressSeeAll: () {},
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
                products.length,
                (index) => Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: ProductCard(products[index]
                          // image: show_product[index].image,
                          // title: show_product[index].title,
                          // price: show_product[index].price,
                          // press: () {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) {
                          //         //return HomeScreen();
                          //         return DetailsScreen(show_product[index]);
                          //       },
                          //     ),
                          //   );
                          // },
                          ),
                    )),
          ),
        )
      ],
    );
  }
}

class DaXay extends StatelessWidget {
  const DaXay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var products = context.read<ProductsManager>().items;

    return Column(
      children: [
        SectionTitle(
          title: "Đá xay",
          pressSeeAll: () {},
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
                products.length,
                (index) => Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: ProductCard(products[index]
                          // press: () {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) {
                          //         return DetailsScreen(show_product[index]);
                          //         // return DetailsScreen();
                          //       },
                          //     ),
                          //   );
                          // },
                          ),
                    )),
          ),
        )
      ],
    );
  }
}

// class DaXay extends StatelessWidget {
//   const DaXay({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SectionTitle(
//           title: "Đá xay",
//           pressSeeAll: () {},
//         ),
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: List.generate(
//                 show_product.length,
//                 (index) => Padding(
//                       padding: const EdgeInsets.only(left: 20),
//                       child: ProductCard(show_product[index]
//                           // image: show_product[index].image,
//                           // title: show_product[index].title,
//                           // price: show_product[index].price,
//                           // press: () {
//                           //   Navigator.push(
//                           //     context,
//                           //     MaterialPageRoute(
//                           //       builder: (context) {
//                           //         return DetailsScreen(show_product[index]);
//                           //         // return DetailsScreen();
//                           //       },
//                           //     ),
//                           //   );
//                           // },
//                           ),
//                     )),
//           ),
//         )
//       ],
//     );
//   }
// }

class Latte extends StatelessWidget {
  const Latte({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var products = context.read<ProductsManager>().items;

    return Column(
      children: [
        SectionTitle(
          title: "Latte",
          pressSeeAll: () {},
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
                products.length,
                (index) => Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: ProductCard(products[index]
                          // press: () {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) {
                          //         return DetailsScreen(show_product[index]);
                          //         // return DetailsScreen();
                          //       },
                          //     ),
                          //   );
                          // },
                          ),
                    )),
          ),
        )
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard(this.product, {super.key});

  // final String image, title;

  // final double price;
  // final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              //return HomeScreen();
              return DetailsScreen(product);
            },
          ),
        );
      },
      child: Container(
        width: 154,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                //color: bgColor,
                borderRadius: const BorderRadius.all(Radius.circular(50)),
              ),
              child: Image.asset(product.image),
              //height: 132,
              height: 180,
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                Expanded(
                  child: Text(
                    product.title,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  product.price.toString(),
                  style: Theme.of(context).textTheme.subtitle2,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    required this.pressSeeAll,
  }) : super(key: key);

  final String title;
  final VoidCallback pressSeeAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                )),
        TextButton(
          // onPressed: pressSeeAll,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ShowCategoryList();
                },
              ),
            );
          },
          child: Text(
            "See All",
            style: TextStyle(color: Colors.black54),
          ),
        )
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.image,
    required this.title,
    //required this.bgColor,
    required this.press,
    required String type,
  }) : super(key: key);

  final String image, title;
  //final Color bgColor;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: press,
        style: OutlinedButton.styleFrom(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
          child: Column(
            children: [
              Image.asset(
                image,
                width: 50,
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ));
  }
}

const outlineInputBorder = const OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(10)),
  borderSide: BorderSide.none,
);
