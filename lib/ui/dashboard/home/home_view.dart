import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health/ui/dashboard/dashboard_viewModel.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await ref.read(dashboardViewModelProvider).getAddressList();
    });
    super.initState();
  }

  late DashboardViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    _viewModel = ref.watch(dashboardViewModelProvider);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Address",style: TextStyle(fontSize: 28),),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.more_vert_rounded))
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.blue.shade200,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none)),
              ),
              const SizedBox(
                height: 32,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _viewModel.hospitals.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: InkWell(
                        onTap: () {
                          generateGoogleMapsLink(
                              streetAddress:
                                  _viewModel.hospitals[index].streetAddress ??
                                      "",
                              city: _viewModel.hospitals[index].city ?? "",
                              state: _viewModel.hospitals[index].state ?? "",
                              zipCode:
                                  _viewModel.hospitals[index].zipCode ?? "");
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    _viewModel.hospitals[index].name ?? "",
                                    style: const TextStyle(fontSize: 18),
                                  )),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  const Icon(Icons.location_on_rounded)
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(_viewModel.getAddressFromHospitalData(
                                  _viewModel.hospitals[index]))
                            ],
                          ),
                        ),
                      ),
                    );
                  })
            ],
          ),
        ));
  }

  static void generateGoogleMapsLink({
    required String streetAddress,
    required String city,
    required String state,
    required String zipCode,
  }) async {
    print("$streetAddress, $city, $state $zipCode");
    String query = Uri.encodeFull("$streetAddress, $city, $state, $zipCode");
    Uri googleMapsUrl = Uri.parse("https://maps.google.com/maps?q=$query");

    try {
      await launchUrl(googleMapsUrl);
    } catch (e) {
      print('Could not launch $googleMapsUrl');
    }
  }
}
