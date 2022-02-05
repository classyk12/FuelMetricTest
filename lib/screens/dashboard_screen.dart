import 'package:flutter/material.dart';
import 'package:fuelmetrics_flutter_project/controllers/home-controller.dart';
import 'package:fuelmetrics_flutter_project/enums/loading-enum.dart';
import 'package:fuelmetrics_flutter_project/utils.dart/themes.dart';
import 'package:fuelmetrics_flutter_project/widgets/common.dart';
import 'package:fuelmetrics_flutter_project/widgets/detail-widget.dart';
import 'package:fuelmetrics_flutter_project/widgets/large_button.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  final HomeController _homeController = Get.put(HomeController());

  DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryGreen,
        title: Text('Home'),
        elevation: 0,
      ),
      body: Obx(() {
        if (_homeController.status.value == LoadingEnum.loading) {
          return Center(child: Loader());
        } else if (_homeController.status.value == LoadingEnum.done) {
          if (_homeController.showDrivers.value == false) {
            return _companyDetail();
          } else {
            if (_homeController.getDriverstatus.value == LoadingEnum.loading) {
              return Center(child: Loader());
            } else if (_homeController.getDriverstatus.value ==
                LoadingEnum.done) {
              return _driversList();
            } else {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Unable to get drivers '),
                  SizedBox(height: 10),
                  InkWell(
                      onTap: () {
                        _homeController.getCompanyDrivers();
                      },
                      child: Icon(Icons.refresh,
                          size: 30, color: Colors.grey[400]))
                ],
              ));
            }
          }
        } else {
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Unable to get company details'),
              SizedBox(height: 10),
              InkWell(
                  onTap: () {
                    _homeController.getCompanyDetails();
                  },
                  child: Icon(Icons.refresh, size: 30, color: Colors.grey[400]))
            ],
          ));
        }
      }),
    );
  }

  Widget _companyDetail() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 55.0, horizontal: 10),
      child: ListView(
        children: [
          detailCard(
              'Company Name', _homeController.companyData.value.company!.name!),
          detailCard('Company Address',
              _homeController.companyData.value.company!.address!),
          detailCard('City', _homeController.companyData.value.company!.city!),
          detailCard(
              'State', _homeController.companyData.value.company!.country!),
          detailCard('Business Type',
              _homeController.companyData.value.company!.businessType!),
          detailCard(
              'Rc No', _homeController.companyData.value.company!.rcNumber!),
          detailCard('Phone',
              _homeController.companyData.value.company!.contactPhone!),
          SizedBox(height: 20),
          Divider(),
          SizedBox(height: 20),
          Button(
              height: 50,
              title: 'View Drivers',
              onPressed: () {
                _homeController.showDrivers.value = true;
                _homeController.getCompanyDrivers();
              }),
          SizedBox(height: 20),
          Button(
              height: 50,
              title: 'Add Driver',
              onPressed: () => Get.toNamed('/addDriver', arguments: ''))
        ],
      ),
    );
  }

  Widget _driversList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 35),
      child: ListView(
          //  physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) =>
                    Divider(color: Colors.grey[500]),
                itemCount: _homeController.drivers.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var item = _homeController.drivers[index];
                  return InkWell(
                    onTap: () =>
                        Get.toNamed('/driver-details', arguments: item),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${item.name!} - (${item.code})'),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Email: ${item.email!}'),
                              InkWell(
                                onTap: () => _homeController.removeDriver(
                                    item.id!, index),
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 5),
                          Text('Phone: ${item.phone!}'),
                        ]),
                  );
                }),
            SizedBox(height: 40),
            Button(
                height: 50,
                title: 'View Company Details',
                onPressed: () {
                  _homeController.showDrivers.value = false;
                }),
            SizedBox(height: 50),
          ]),
    );
  }
}
