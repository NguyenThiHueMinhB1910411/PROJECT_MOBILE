import 'package:order_app/screens/Screens.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';
  const UserProductsScreen({super.key});

  Future<void> _refreshProducts(BuildContext context) async {
    await context.read<ProductsManager>().fetchProducts(true);
  }

  @override
  Widget build(BuildContext context) {
    // final productsManager = ProductsManager();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('All product'),
        actions: <Widget>[
          buildAddButton(context),
        ],
      ),
      //

      // drawer: const AppDrawer(),
      // appBar: detailsAppBar(context),

      body: FutureBuilder(
        future: _refreshProducts(context),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return RefreshIndicator(
            onRefresh: () => _refreshProducts(context),
            child: buildUserProductListView(),
          );
        },
      ),
    );
  }

  Widget buildUserProductListView() {
    return Consumer<ProductsManager>(builder: (ctx, product, child) {
      return ListView.builder(
        itemCount: product.itemCount,
        itemBuilder: (ctx, i) => Column(
          children: [
            UserProductListTile(
              product.items[i],
            ),
          ],
        ),
      );
    });
  }
  // Widget buildUserProductListView(ProductsManager productsManager) {
  //   return ListView.builder(
  //     itemCount: productsManager.itemCount,
  //     itemBuilder: (ctx, i) => Column(
  //       children: [
  //         UserProductListTile(
  //           productsManager.items[i],
  //         ),
  //         const Divider(),
  //       ],
  //     ),
  //   );
  // }

  Widget buildAddButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add),
      color: Colors.white,
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => EditProductScreen(null))));
      },
    );
  }
}
