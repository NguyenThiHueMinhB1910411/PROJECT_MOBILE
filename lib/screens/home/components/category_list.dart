import 'package:order_app/screens/Screens.dart';

class ShowCategoryList extends StatefulWidget {
  @override
  State<ShowCategoryList> createState() => _ShowCategoryListState();
}

class _ShowCategoryListState extends State<ShowCategoryList> {
  late Future<void> _fetchProducts;

  @override
  void initState() {
    super.initState();
    _fetchProducts = context.read<ProductsManager>().fetchProducts(false);
  }

  @override
  Widget build(BuildContext context) {
    const outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide.none,
    );

    return Scaffold(
      appBar: detailsAppBar(context),
      resizeToAvoidBottomInset: false,
      body: FutureBuilder(
          future: _fetchProducts,
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return RefreshIndicator(
              onRefresh: () => _fetchProducts,
              child: const SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: AllProductInListItemColumn(),
                ),
              ),
            );
          }),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Container Banner() {
    return Container(
      child: Container(
          padding: EdgeInsets.only(bottom: 20),
          margin: EdgeInsets.only(bottom: 30),
          width: 700,
          height: 200,
          child: Image.asset("assets/images/milk_tea_canva.png")),
    );
  }
}
