import 'package:flutter/material.dart';

class HotelListScreen extends StatelessWidget {
  const HotelListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D47A1),
        elevation: 0,
        toolbarHeight: 100,
        title: Column(
          children: [
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.amber, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: const [
                  Icon(Icons.arrow_back, color: Colors.black87, size: 22),
                  SizedBox(width: 6),
                  Text(
                    "Xung quanh vị trí hiện tại",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 6),
                  Text(
                    "23 thg 10 – 24 thg 10",
                    style: TextStyle(color: Colors.black54, fontSize: 13),
                  ),
                ],
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                _ToolItem(icon: Icons.sort, label: "Sắp xếp"),
                _ToolItem(icon: Icons.filter_list, label: "Lọc"),
                _ToolItem(icon: Icons.map, label: "Bản đồ"),
              ],
            ),
          ),
          const Divider(height: 1),
          const Padding(
            padding: EdgeInsets.fromLTRB(14, 10, 0, 4),
            child: Text(
              "757 chỗ nghỉ",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: [
                _buildHotelCard(
                  image: 'assets/images/anh5.jpg',
                  name: 'aNhill Boutique',
                  rating: 9.5,
                  reviews: 95,
                  stars: 5,
                  description: 'Xuất sắc',
                  location: 'Huế - Cách bạn 0,6km',
                  room: '1 suite riêng tư: 1 giường',
                  price: 109,
                ),
                _buildHotelCard(
                  image: 'assets/images/anh6.jpg',
                  name: 'An Nam Hue Boutique',
                  rating: 9.2,
                  reviews: 34,
                  stars: 4,
                  description: 'Tuyệt hảo',
                  location: 'Cư Chính - Cách bạn 0,9km',
                  room: '1 phòng khách sạn: 1 giường',
                  price: 20,
                ),

                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                        child: Image.asset(
                          'assets/images/anh7.jpg',
                          width: 140,
                          height: 235,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 10, 12, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Tên và nút yêu thích
                              Row(
                                children: [
                                  const Expanded(
                                    child: Text(
                                      'Huế Jade Hill Villa',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const Icon(
                                    Icons.favorite_border,
                                    size: 20,
                                    color: Colors.black54,
                                  ),
                                ],
                              ),

                              const SizedBox(height: 4),

                              //Quản lý bởi host cá nhân
                              const Text(
                                'Được quản lý bởi 1 host cá nhân',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54,
                                ),
                              ),

                              const SizedBox(height: 6),

                              //Điểm đánh giá, mô tả
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.blue.shade700,
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                    child: const Text(
                                      "8,0",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  const Text(
                                    "Rất tốt · 1 đánh giá",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 6),

                              //Địa điểm
                              Row(
                                children: const [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.black54,
                                    size: 14,
                                  ),
                                  SizedBox(width: 4),
                                  Expanded(
                                    child: Text(
                                      'Cư Chính - Cách bạn 1,3km',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 8),

                              //Mô tả chi tiết bên phải
                              Align(
                                alignment: Alignment.centerRight,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: const [
                                    //Dòng in đậm
                                    Text(
                                      "1 biệt thự nguyên căn – 1.000 m²",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    SizedBox(height: 2),

                                    //Dòng mô tả nhỏ
                                    Text(
                                      "4 giường · 3 phòng ngủ · 1 phòng khách · 3 phòng tắm",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    SizedBox(height: 6),

                                    //Giá
                                    Text(
                                      "US\$285",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),

                                    // Dòng thuế
                                    Text(
                                      "Đã bao gồm thuế và phí",
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.black54,
                                      ),
                                    ),

                                    SizedBox(height: 6),

                                    //Dòng đỏ
                                    Text(
                                      "Chỉ còn 1 căn với giá này trên Booking.com",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.red,
                                      ),
                                    ),

                                    SizedBox(height: 4),

                                    //Dòng đậm “Không cần thanh toán trước”
                                    Text(
                                      "Không cần thanh toán trước",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                _buildHotelCard(
                  image: 'assets/images/anh8.jpg',
                  name: 'An Nam Hue Boutique',
                  rating: 9.2,
                  reviews: 34,
                  stars: 4,
                  description: 'Tuyệt hảo',
                  location: 'Cư Chính - Cách bạn 0,9km',
                  room: '1 phòng khách sạn: 1 giường',
                  price: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //Khai báo hàm thẻ hotel card
  static Widget _buildHotelCard({
    required String image,
    required String name,
    required double rating,
    required int reviews,
    required int stars,
    required String description,
    required String location,
    required String room,
    required int price,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(image, width: 140, height: 180, fit: BoxFit.cover),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    color: Colors.green.withOpacity(0.95),
                    child: const Center(
                      child: Text(
                        "Bao bữa sáng",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 12, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.favorite_border,
                        size: 20,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: List.generate(
                          stars,
                          (index) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 13,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade700,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Text(
                              rating.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            "$description · $reviews đánh giá",
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),

                  // Địa điểm
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.black54,
                        size: 14,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          location,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),

                  Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        RichText(
                          textAlign: TextAlign.right,
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black87,
                            ),
                            children: [
                              TextSpan(
                                text: room.split(':').first.trim(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              if (room.contains(':'))
                                TextSpan(
                                  text: ' : ${room.split(':').last.trim()}',
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "US\$$price",
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const Text(
                          "Đã bao gồm thuế và phí",
                          style: TextStyle(fontSize: 11, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ToolItem extends StatelessWidget {
  final IconData icon;
  final String label;
  const _ToolItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.black54, size: 20),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 13, color: Colors.black87),
        ),
      ],
    );
  }
}
