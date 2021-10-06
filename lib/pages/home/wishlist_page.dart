import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/providers/page_provider.dart';
import 'package:shamo/providers/wishlist_provider.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/wishlist_card.dart';

class WishlistPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    WishListProvider wishListProvider = Provider.of<WishListProvider>(context);
    PageProvider pageProvider = Provider.of<PageProvider>(context);

    Widget header(){
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text(
            'Favorite Shoes'
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyWishlist(){
      return Expanded(
        child: Container(
          width: double.infinity,
          color: backgroundColor3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/image_wishlist.png',
                width: 74,
              ),
              SizedBox(
                height: 23,
              ),
              Text(
                ' You don\'t have dream shoes?',
                style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Let\'s find your favorite shoes',
                style: secondaryTextStyle,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 44,
                child: TextButton(
                    onPressed: (){},
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 24
                        ),
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                        )
                    ),
                    child: GestureDetector(
                      onTap: (){
                        pageProvider.currentIndex = 0;
                      },
                      child: Text(
                        'Explore Store',
                        style: primaryTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: medium
                        ),
                      ),
                    )
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget content(){
      return Expanded(
          child: Container(
            color: backgroundColor3,
            child: ListView(
              padding: EdgeInsets.symmetric(
                  horizontal: defaultMargin
              ),
              children: wishListProvider.wishList
                  .map((product) => WishlistCard(product))
                  .toList()
            ),
          )
      );
    }

    return Column(
      children: [
        header(),
        wishListProvider.wishList.length == 0 ? emptyWishlist() : content()
      ],
    );
  }
}
