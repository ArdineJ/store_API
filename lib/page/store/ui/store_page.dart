import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_api/components/category_tile.dart';
import 'package:store_api/components/store_tile.dart';
import 'package:store_api/model/data.dart';
import 'package:store_api/shared_pref/shared_preference.dart';

import '../../detail/detail_page.dart';
import '../bloc/store_bloc.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  static const String id = "store_page";

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  final StoreBloc homeBloc = StoreBloc();
  final TextEditingController searchController = TextEditingController();
  List<DataModel> filteredData = [];

  void toDetail(DataModel dataModel) {
    Navigator.pushNamed(context, DetailPage.id, arguments: dataModel);
  }

  void categoryClicked(String? categories) {
    if (categories == null) {
      homeBloc.add(const FetchDataEvent(null));
    } else {
      homeBloc.add(FetchDataEvent(categories));
    }
  }

  void filterData(String query) {
    List<DataModel> _filteredData = [];
    if (query.isNotEmpty) {
      _filteredData = homeBloc.state.data!
          .where(
              (data) => data.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      _filteredData = homeBloc.state.data!;
    }
    setState(() {
      filteredData = _filteredData;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() {
    homeBloc.add(const FetchDataEvent(null));
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: const Text('Store Gweh'),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimSearchBar(
                textController: searchController,
                onSuffixTap: () {
                  searchController.clear();
                },
                rtl: true,
                onSubmitted: filterData,
                width: 250,
              ),
              SizedBox(
                width: 10,
              ),
              Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                child: IconButton(
                  splashRadius: 19,
                  onPressed: () {
                    Preferences.updateLogin(false);
                    Navigator.pushReplacementNamed(context, 'welcome_page');
                  },
                  icon: const Icon(
                    color: Colors.black,
                    size: 20,
                    Icons.logout_rounded,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          )
        ],
      ),
      backgroundColor: Colors.grey.shade300,
      body: BlocConsumer<StoreBloc, StoreState>(
        bloc: homeBloc,
        listener: (context, state) {
          if (state.status == StoreStatus.success) {
            setState(() {
              filteredData = state.data ?? [];
            });
          }
        },
        // listenWhen: (((previous, current) => current is FetchDataInCategory)),
        // buildWhen: (((previous, current) => current is! FetchDataInCategory)),
        builder: (context, state) {
          switch (state.status) {
            case StoreStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case StoreStatus.success:
              var categories =
                  state.data!.map((data) => data.category).toSet().toList();
              return Column(
                children: [
                  CategoryTile(
                    categories: categories,
                    onTap: categoryClicked,
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height),
                      ),
                      itemCount: filteredData.length,
                      itemBuilder: (context, index) {
                        // final data = state.data![index];
                        final data = filteredData[index];
                        return StoreTile(
                          data: data,
                          onTapDetail: () => toDetail(data),
                        );
                      },
                    ),
                  ),
                ],
              );
            default:
              return const SizedBox(
                child: Center(child: Text('Not Found')),
              );
          }
        },
      ),
      // bottomNavigationBar: Ro,
    );
  }
}
