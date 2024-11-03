import 'package:vashoz/features/category/category.dart';

import '../../../../core/config/config.dart';
import '../../../../core/shared/shared.dart';
import '../bloc/find_products_bloc.dart';
import 'tab_bar_view.dart';
import 'tab_bar_widget.dart';

class ProductsFragment extends StatefulWidget {
  const ProductsFragment({super.key});

  @override
  State<ProductsFragment> createState() => _ProductsFragmentState();
}

class _ProductsFragmentState extends State<ProductsFragment> with TickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    // context.watch<FindAllCategoriesBloc>().stream.listen((event) {
    //   if (event is FindAllCategoriesDone) {
    //     controller = TabController(length: event.categories.length, vsync: this);
    //     setState(() {});
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Scaffold(
          backgroundColor: theme.backgroundSecondary,
          appBar: AppBar(
            backgroundColor: theme.backgroundSecondary,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new_outlined, color: theme.textPrimary),
              onPressed: () {},
            ),
            centerTitle: true,
            title: Text(
              'Products',
              style: context.textStyle15SemiBold(color: theme.textPrimary),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.tune, color: theme.textPrimary),
                onPressed: () {},
              ),
            ],
          ),
          body: BlocListener<FindAllCategoriesBloc, FindAllCategoriesState>(
            listener: (context, state) {
              if (state is FindAllCategoriesDone) {
                controller = TabController(length: state.categories.length, vsync: this);
                setState(() {});
              }
            },
            child: Column(
              children: [
                TabBarWidget(controller: controller),
                BlocProvider(
                  create: (context) => sl<FindProductsBloc>(),
                  child: TabBarViewWidget(
                    controller: controller,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
