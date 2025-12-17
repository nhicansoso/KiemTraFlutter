import 'package:flutter/material.dart';
import 'package:kiemtragiuaky/api/api_product.dart';
import 'package:kiemtragiuaky/model/product.dart';

class MyProductsPage extends StatefulWidget {
  const MyProductsPage({super.key});

  @override
  State<MyProductsPage> createState() => _MyProductsPageState();
}

class _MyProductsPageState extends State<MyProductsPage> {
  late Future<List<Product>> _futureProducts;

  @override
  void initState() {
    super.initState();
    _futureProducts = test_api.getAllProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueAccent,
        titleSpacing: 0,
        title: Row(
          children: [
            const SizedBox(width: 10),
            const Text(
              "Shoppe fake",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                height: 35,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.grey, size: 18),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "Tìm kiếm",
                        style: TextStyle(color: Colors.grey[500], fontSize: 13),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),

      body: FutureBuilder<List<Product>>(
        future: _futureProducts,
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snap.hasError) {
            return Center(child: Text("Lỗi: ${snap.error}"));
          }

          if (!snap.hasData || snap.data!.isEmpty) {
            return const Center(child: Text("Không có sản phẩm"));
          }

          return myListView(snap.data!);
        },
      ),
    );
  }

  //danh sách sản phẩm
  Widget myListView(List<Product> lstproduct) {
    final width = MediaQuery.of(context).size.width;

    final int columns = width > 900 ? 4 : (width > 600 ? 3 : 2);

    return GridView.builder(
      padding: EdgeInsets.all(12),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        mainAxisExtent: 350,
      ),
      itemCount: lstproduct.length,
      itemBuilder: (context, index) {
        return myItems(lstproduct[index]);
      },
    );
  }

  //item sản phẩm
  Widget myItems(Product p) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ProductDetail(product: p)),
        );
      },

      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ảnh
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  p.image,
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                  errorBuilder: (c, e, s) => Container(
                    color: Colors.grey[200],
                    child: Icon(Icons.image_not_supported),
                  ),
                ),
              ),
            ),

            // Nội dung
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    p.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 6),

                  Text(
                    p.category,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 8),

                  Row(
                    children: [
                      ...List.generate(5, (index) {
                        // tạo danh sách 5 phần tử -> 5 sao
                        double rate = p.rating.rate; //lấy rate
                        return Icon(
                          index < rate.round() ? Icons.star : Icons.star_border,
                          size: 16,
                          color: Colors.amber,
                        );
                      }),
                      SizedBox(width: 4),
                      Text(
                        "${p.rating.rate}",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        "(${p.rating.count})",
                        style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                      ),
                    ],
                  ),

                  SizedBox(height: 8),

                  Text(
                    "${p.price} \$",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Chi tiết sản phẩm
class ProductDetail extends StatelessWidget {
  final Product product;

  const ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ảnh lớn
            Center(
              child: Image.network(
                product.image,
                height: 250,
                errorBuilder: (_, __, ___) =>
                    Icon(Icons.image_not_supported, size: 100),
              ),
            ),

            SizedBox(height: 20),

            Text(
              product.title,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Text(
              "Category: ${product.category}",
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),

            SizedBox(height: 10),

            Text(
              "Price: ${product.price} \$",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),

            SizedBox(height: 10),

            Row(
              children: [
                Icon(Icons.star, color: Colors.amber),
                SizedBox(width: 4),
                Text(
                  "${product.rating.rate} (${product.rating.count} reviews)",
                ),
              ],
            ),

            SizedBox(height: 20),

            Text(
              product.description,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      ),
    );
  }
}
