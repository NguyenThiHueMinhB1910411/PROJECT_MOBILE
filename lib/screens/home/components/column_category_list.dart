import 'package:order_app/screens/Screens.dart';

class AllProductInListItemColumn extends StatefulWidget {
  const AllProductInListItemColumn({super.key});

  @override
  State<AllProductInListItemColumn> createState() =>
      _AllProductInListItemColumnState();
}

class _AllProductInListItemColumnState
    extends State<AllProductInListItemColumn> {
  @override
  Widget build(BuildContext context) {
    var products = context.read<ProductsManager>().items;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(
            products.length,
            (index) => Padding(
              padding: const EdgeInsets.only(left: 20),
              child: GestureDetector(
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                        ),
                        child: Image.asset(products[index].image),
                        //height: 132,
                        height: 180,
                      ),
                      const SizedBox(height: 40),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              products[index].title,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            products[index].price.toString(),
                            style: Theme.of(context).textTheme.subtitle2,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // image: productsManager.,
              // title: products[index].title,
              // price: products[index].price,
              // press: () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) {
              //         return DetailsScreen(products[index]);
              //         // return DetailsScreen();
              //       },
              //     ),
              //   );
              // },
            ),
          )

          // [
          //   Text(
          //     "Trà sữa",
          //     style: TextStyle(
          //         color: Colors.black, fontWeight: FontWeight.w200, fontSize: 50),
          //   ),

          // ],
          ),
    );
  }
}
