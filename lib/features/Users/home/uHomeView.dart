import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:qcu/cosntants/colors.dart';
import 'package:qcu/features/Users/home/uCategoryView.dart';

import '../../../common/cart/CartView.dart';
import '../../../common/itemDetails/ItemView.dart';
import '../../ViewModels/FeedViewModel.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {

  TextEditingController searchCtrl = TextEditingController();

  var cat = [
    Icons.emoji_food_beverage_outlined,
    Icons.shopping_cart_outlined,
    Icons.house_outlined,
    Icons.payment_outlined,
  ];

  var cat2 = [
    Icons.book_outlined,
    Icons.chair_alt,
    Icons.lightbulb_outline,
    Icons.warehouse_outlined,
    Icons.build_outlined,
    Icons.more_horiz_outlined,
  ];

  var str = [
    "Food",
    "Shopping",
    "Rent",
    "Payment",
  ];

  var str2 = [
    "School",
    "Furniture",
    "Lights",
    "Tents",
    "Tools",
    "More"
  ];


  @override
  Widget build(BuildContext context) {

    var feed = ref.watch(feedProvider);

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 35, right: 35, top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage("assets/images/QCUlogo.jpg"),
                    ),
                    const SizedBox(width: 20,),
                    Text(
                      "Home",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        showMaterialModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          builder: (context) => const CartView(),
                        );
                      },
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        color: AppColors().primary,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        CupertinoIcons.chat_bubble_text,
                        color: AppColors().secondary,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 17,),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 23),
                    height: 125,
                    width: MediaQuery.of(context).size.width,
                    color: AppColors().primary,
                    child: Stack(
                      children: [
                        Center(
                          child: Text(
                            "Voucher Carousel",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        OverflowBox(
                          child: Transform.translate(
                            offset: const Offset(0, -60),
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.symmetric(horizontal: 40),
                              child: TextField(
                                controller: searchCtrl,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(left: 20, right: 20),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "Search",
                                  hintStyle: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: AppColors().black
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: AppColors().primary,
                                        width: 2,
                                      )
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: AppColors().primary,
                                        width: 2,
                                      )
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 25,),
                  Container(
                    height: 70,
                    margin: const EdgeInsets.symmetric(horizontal: 35),
                    padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppColors().primary,
                          width: 2,
                        )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: List.generate(cat.length, (index){
                        return InkWell(
                          onTap: () {
                            showMaterialModalBottomSheet(
                              context: context,
                              expand: true,
                              builder: (context){
                               return UCategoryView(category: str[index],);
                             },
                            );
                          },
                          child: Column(
                            children: [
                              Icon(
                                  cat[index]
                              ),
                              Text(
                                str[index],
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: AppColors().black,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Container(
                      height: 150,
                      margin: const EdgeInsets.symmetric(horizontal: 35),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: AppColors().primary,
                            width: 2,
                          )
                      ),
                      child: GridView.count(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(0),
                        crossAxisCount: 4,
                        childAspectRatio: 1,
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 0,
                        children: List.generate(cat2.length, (index){
                          return InkWell(
                            onTap: () {
                              showMaterialModalBottomSheet(
                                context: context,
                                expand: true,
                                builder: (context){
                                  return UCategoryView(category: str2[index],);
                                },
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                    cat2[index]
                                ),
                                Text(
                                  str2[index],
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: AppColors().black,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      )
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Flash Sale",
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                showMaterialModalBottomSheet(
                                  context: context,
                                  expand: true,
                                  builder: (context){
                                    return const UCategoryView(category: "Flash Sale",);
                                  },
                                );
                              },
                              child: Text(
                                "See All >>",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: AppColors().primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5,),
                        SizedBox(
                          height: 200,
                          child: feed.when(
                            data: (data){
                              return GridView.count(
                                padding: const EdgeInsets.all(0),
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 0.8,
                                children: List.generate(data.docs.length, (index){
                                  return InkWell(
                                    onTap: () {
                                      showMaterialModalBottomSheet(
                                        context: context,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          ),
                                        ),
                                        builder: (context) => ItemView(
                                          url: data.docs[index].data()["Image"],
                                          name: data.docs[index].data()["Name"],
                                          price: data.docs[index].data()["Price"],
                                          description: data.docs[index].data()["Description"],
                                          stock: data.docs[index].data()["Stock"],
                                          seller: data.docs[index].data()["Seller"],
                                          category: data.docs[index].data()["Category"],
                                          id: data.docs[index].id,
                                        ),
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(
                                            color: AppColors().primary,
                                            width: 2,
                                          )),
                                      child: Column(
                                        children: [
                                          Expanded(
                                              flex: 2,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius: const BorderRadius.only(
                                                      topLeft: Radius.circular(8),
                                                      topRight: Radius.circular(8),
                                                    ),
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            data.docs[index]
                                                                .data()["Image"]),
                                                        fit: BoxFit.cover)),
                                              )),
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  data.docs[index].data()["Name"],
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Text(
                                                  "PHP ${data.docs[index].data()["Price"]}",
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                              );
                            },
                            error: (error, stack){
                              return Center(
                                child: Text(
                                  error.toString(),
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              );
                            },
                            loading: (){
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ]
      ),
    );
  }
}
