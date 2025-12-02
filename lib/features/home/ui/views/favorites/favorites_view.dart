import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk_stationery/core/services/favorites_service.dart';
import 'package:mk_stationery/core/theming/color_manager.dart';
import 'package:mk_stationery/core/utils/nav_bar_controller.dart';
import 'package:mk_stationery/features/home/logic/cubit/products_cubit.dart';
import 'package:mk_stationery/features/home/ui/views/favorites/widgets/favorites_products_grid.dart';

class FavouritesView extends StatefulWidget {
  const FavouritesView({super.key, this.navController});

  final NavBarController? navController;

  @override
  State<FavouritesView> createState() => FavouritesViewState();
}

class FavouritesViewState extends State<FavouritesView> {
  final GlobalKey<RefreshIndicatorState> refreshKey =
      GlobalKey<RefreshIndicatorState>();

  void refreshFavourites() {
    refreshKey.currentState?.show();
  }

  Future<void> onRefresh() async {
    context.read<ProductsCubit>().fetchProducts();
  }

  void goToHome() {
    widget.navController?.resetToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: goToHome,
        ),
        title: const Text('Favourites'),
        centerTitle: true,
        backgroundColor: ColorsManager.background,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if (state is ProductsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductsLoaded) {
              final allProducts = state.products;
              final favoriteProducts = FavoritesService().getFavorites(
                allProducts,
              );

              if (favoriteProducts.isEmpty) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.favorite_border, size: 64, color: Colors.grey),
                      SizedBox(height: 16),
                      Text(
                        'No Favourites Yet',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Add items to your favorites to see them here',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                );
              }

              return FavoritesProductsGrid(productsList: favoriteProducts);
            } else if (state is ProductsError) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(state.apiErrorModel.message ?? 'Something went wrong'),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed:
                          () => context.read<ProductsCubit>().fetchProducts(),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
