import 'package:flutter/material.dart';
import 'package:fuelmetrics_flutter_project/controllers/driver-detail-controller.dart';
import 'package:fuelmetrics_flutter_project/utils.dart/themes.dart';
import 'package:fuelmetrics_flutter_project/widgets/detail-widget.dart';
import 'package:get/get.dart';

class DriverDetailScreen extends StatelessWidget {
  final DriverDetailController _detailController =
      Get.put(DriverDetailController());

  DriverDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryGreen,
        title: Text('About ${_detailController.detail.value.name!}'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 15),
        child: ListView(children: [
          detailCard('Name', _detailController.detail.value.name!),
          detailCard('Phone', _detailController.detail.value.phone!),
          detailCard('Email', _detailController.detail.value.email!),
          detailCard('Code', _detailController.detail.value.code!),
          detailCard('Address', _detailController.detail.value.address!),
          detailCard('City', _detailController.detail.value.city!),
          detailCard('State', _detailController.detail.value.state!),
          detailCard('Has Vehicle Assigned',
              _detailController.detail.value.vehicleAssigned!.toString()),
          detailCard('Date Joined',
              _detailController.detail.value.dateAdded!.toIso8601String()),
          SizedBox(height: 30),
          Text(
            'Vehicle Assigned',
            style: titleTextStyle,
          ),
          Divider(),
          SizedBox(height: 10),
          _vehicleList()
        ]),
      ),
    );
  }

  Widget _vehicleList() {
    return _detailController.detail.value.vehicles!.isEmpty
        ? Center(
            child: Text(
                'No Vehicle assigned to ${_detailController.detail.value.name!}'))
        : Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) =>
                    Divider(color: Colors.grey[500]),
                itemCount: _detailController.detail.value.vehicles!.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var item = _detailController.detail.value.vehicles![index];
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Vehicle Type:  - ${item.type}'),
                        SizedBox(height: 5),
                        Text('Plate Number: ${item.plateNumber!}'),
                        SizedBox(height: 5),
                        Text('Car Make: ${item.carMake!}'),
                        SizedBox(height: 5),
                        Text('Car Model Year: ${item.carModelYear!}'),
                        SizedBox(height: 5),
                        Text('Currently Tracked: ${item.track!.toString()}'),
                      ]);
                }),
          );
  }
}
