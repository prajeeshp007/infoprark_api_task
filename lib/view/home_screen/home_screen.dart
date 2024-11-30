import 'package:flutter/material.dart';
import 'package:infoprark_api_task/controller/add_to_cart_Screen_controller.dart';
import 'package:infoprark_api_task/controller/homeScreen_controller.dart';
import 'package:infoprark_api_task/view/add_to_cart_screen/add_to_cart_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? dropvalue;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<HomescreenController>().getCategories();
        context.read<HomescreenController>().getAllProducts(context);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'All Products',
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
      ),
      body: Consumer<HomescreenController>(
        builder: (context, provobj, child) {
          if (provobj.isloading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provobj.allproducts == null ||
              provobj.allproducts!.categories!.isEmpty) {
            return const Center(
              child: Text(
                'No products available!',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }

          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  // DropdownButton(
                  //   /// evda drop down value empty hanalll all enn ullath aaadhym kanikmm
                  //   value: dropvalue ?? 'ALL',
                  //   items: List.generate(
                  //     /// lengt kodukan ulla code
                  //     /// evda toset.tolist vilikan ulla karanm duplicates value ellam ozhivakum
                  //     provobj.categorieslist.toSet().toList().length,
                  //     (index) => DropdownMenuItem(
                  //         value: provobj.categorieslist[index],
                  //         child: Text(
                  //             provobj.categorieslist[index].toUpperCase())),
                  //   ),
                  //   onChanged: (value) {
                  //     context.read<HomescreenController>().getAllProducts(
                  //         context,
                  //         category: value == "All" ? '' : value.toString());
                  //     dropvalue = value as String?;
                  //     setState(() {});
                  //   },
                  // ),
                  DropdownButton(
                    value: dropvalue ?? 'ALL',
                    items: provobj.categorieslist.map((category) {
                      return DropdownMenuItem(
                        value: category,
                        child: Text(category.toUpperCase()),
                      );
                    }).toList(),
                    onChanged: (value) {
                      dropvalue = value as String?;
                      setState(() {}); // Update dropdown state
                      context.read<HomescreenController>().getAllProducts(
                          context,
                          category: value == 'ALL' ? '' : value.toString());
                    },
                  ),
                ],
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: provobj.allproducts!.categories!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 20,
                    mainAxisExtent: 250, // Increased height for better layout
                  ),
                  itemBuilder: (context, index) {
                    final product = provobj.allproducts!.categories![index];
                    return InkWell(
                      onTap: () {
                        // Handle product click
                      },
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Image.network(
                                product.strCategoryThumb!,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.strCategory ?? "No name",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    product.strCategoryDescription ??
                                        "No description available",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: TextButton(
                                            onPressed: () {
                                              final productData = {
                                                'id': product
                                                    .idCategory, // Ensure `id` is a unique identifier
                                                'name': product.strCategory,
                                                'description': product
                                                    .strCategoryDescription,
                                                'image':
                                                    product.strCategoryThumb,
                                              };

                                              context
                                                  .read<
                                                      AddToCartScreenController>()
                                                  .addToCart(productData);
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                    content: Text(
                                                        '${product.strCategory} added to cart!')),
                                              );
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        AddToCartScreen(),
                                                  ));
                                            },
                                            child: Text('Add to cart')),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
