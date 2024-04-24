import 'package:flutter/material.dart';
import 'package:upi_india/upi_india.dart';

class MonitoryDonation extends StatefulWidget {
  final double amount;
  const MonitoryDonation({super.key, required this.amount});

  @override
  State<MonitoryDonation> createState() => _MonitoryDonationState();
}

class _MonitoryDonationState extends State<MonitoryDonation> {
  final UpiIndia _upiIndia = UpiIndia();
  List<UpiApp>? apps;

  @override
  void initState() {
    _upiIndia.getAllUpiApps(mandatoryTransactionId: false,allowNonVerifiedApps: true).then((value) {
      setState(() {
        apps = value;
      });
    }).catchError((e) {
      apps = [];
    });
    super.initState();
  }

  Future<UpiResponse> initiateTransaction(UpiApp app, double amount) async {
    return _upiIndia.startTransaction(
      app: app,
      receiverUpiId: "rishu.supragya@apl",
      receiverName: 'Supragya Sharma',
      transactionRefId: 'NGO-Connect-Donation-001',
      transactionNote: 'Donation for NGO-Connect',
      amount: amount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Container(
            height: double.infinity,
            width: double.infinity,
            child: apps!.isEmpty
                ? const Center(
                    child: Text(
                    "No UPI Apps Found!",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      ),
                  ))
                : ListView.builder(
                    itemCount: apps?.length ?? 0,
                    itemBuilder: (context, index) {
                      final app = apps![index];
                      return Padding(
                        padding: const EdgeInsets.all(15),
                        child: ListTile(
                          leading: Image.memory(app.icon),
                          title: Text(app.name),
                          onTap: () async {
                            final response =
                                await initiateTransaction(app, widget.amount);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  response.status.toString(),
                                  style: const TextStyle(fontSize: 20),
                                ),
                                duration: const Duration(seconds: 10),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  )),
      ),
    );
  }
}
