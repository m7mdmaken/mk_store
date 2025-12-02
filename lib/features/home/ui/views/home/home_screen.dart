import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk_stationery/core/constants.dart';
import 'package:mk_stationery/features/home/ui/views/home/widgets/catigory_selector.dart';
import 'package:mk_stationery/features/home/ui/views/home/widgets/home_grid_builder.dart';
import 'package:mk_stationery/features/home/ui/views/home/widgets/home_products_grid.dart';

import 'package:mk_stationery/core/theming/color_manager.dart';
import 'package:mk_stationery/features/home/data/models/product/product.dart';
import 'package:mk_stationery/features/home/logic/cubit/products_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;
  List<Product> _searchedProducts = [];
  Timer? _debounce;

  @override
  void dispose() {
    _searchController.dispose();
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _isSearching ? searchingAppBar() : defaultAppBar(),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<ProductsCubit>().fetchProducts();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategorySelector(
              onCategorySelected: (category) {
                context.read<ProductsCubit>().fetchProductsByCategory(category);
              },
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                child: homeScreenBlocBuilder(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar searchingAppBar() {
    return AppBar(
      title: _buildSearchField(),
      backgroundColor: ColorsManager.background,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: ColorsManager.textDark),
        onPressed: () {
          _searchController.clear();
          setState(() {
            _isSearching = false;
          });
        },
      ),
    );
  }

  AppBar defaultAppBar() {
    return AppBar(
      backgroundColor: ColorsManager.background,
      elevation: 0,
      leading: SizedBox(),
      title: Text('MK Store', style: TextStyle(color: ColorsManager.textDark)),
      actions: [
        IconButton(
          onPressed: () {
            setState(() {
              _isSearching = true;
            });
          },
          icon: Icon(Icons.search, color: ColorsManager.textDark),
        ),
        IconButton(
          icon: Icon(Icons.shopping_cart, color: ColorsManager.textDark),
          onPressed: () {},
        ),
        const SizedBox(width: kDefaultPaddin / 2),
      ],
    );
  }

  BlocBuilder<ProductsCubit, ProductsState> homeScreenBlocBuilder() {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return HomeGridBuilder();
        } else if (state is ProductsLoaded) {
          final products = state.products;
          final displayList =
              _searchController.text.isEmpty ? products : _searchedProducts;
          return HomeProductsGrid(productsList: displayList);
        } else if (state is ProductsError) {
          return errorWidget(state, context);
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget errorWidget(ProductsError state, BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(state.apiErrorModel.message ?? 'Something went wrong'),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => context.read<ProductsCubit>().fetchProducts(),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  void _addSearchedItemsToSearchedList(String searchedProduct) {
    // debounce to reduce filtering frequency while typing
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      final query = searchedProduct.toLowerCase();
      final cubitState = context.read<ProductsCubit>().state;
      final products =
          cubitState is ProductsLoaded ? cubitState.products : <Product>[];
      setState(() {
        _searchedProducts =
            products
                .where((p) => (p.title ?? '').toLowerCase().contains(query))
                .toList();
      });
    });
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      cursorColor: ColorsManager.textDark,
      decoration: InputDecoration(
        hintText: 'Search products...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: ColorsManager.textDark, fontSize: 16),
        suffixIcon:
            _searchController.text.isEmpty
                ? null
                : IconButton(
                  icon: Icon(Icons.clear, color: ColorsManager.textDark),
                  onPressed: () {
                    _searchController.clear();
                    setState(() {
                      _searchedProducts = [];
                    });
                  },
                ),
      ),
      style: TextStyle(color: ColorsManager.textDark),
      onChanged: _addSearchedItemsToSearchedList,
    );
  }
}
