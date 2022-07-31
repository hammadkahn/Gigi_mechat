import 'package:flutter/material.dart';
import 'package:gigi_app/models/merchant_model.dart';

import '../../../services/user_merchant_services.dart';

class DetailsCardWidget extends StatefulWidget {
  const DetailsCardWidget(
      {Key? key,
      required this.merchantId,
      required this.token,
      required this.data})
      : super(key: key);
  final String merchantId;
  final MerchantData data;
  final String token;

  @override
  State<DetailsCardWidget> createState() => _DetailsCardWidgetState();
}

class _DetailsCardWidgetState extends State<DetailsCardWidget> {
  SingleMerchant? merchantData;

  Future<void> getMerchantProfile() async {
    final result = await UserMerchantServices()
        .singleMerchantProfile(id: widget.merchantId, token: widget.token);

    setState(() {
      merchantData = result;
    });
  }

  static const baseUrl = 'https://gigiapi.zanforthstaging.com/';

  @override
  void initState() {
    // getMerchantProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 217,
      width: 141,
      margin: const EdgeInsets.only(right: 8),
      decoration: const BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            child: widget.data.profilePicture != null &&
                    widget.data.profilePicture!.isNotEmpty
                ? Image.network(
                    '$baseUrl${widget.data.profilePicturePath!}/${widget.data.profilePicture}',
                    height: 120,
                    width: 120)
                : Image.asset(
                    'assets/images/menu.png',
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
          ),
          Text(
            widget.data.name!,
            style: const TextStyle(
                fontFamily: 'Mulish',
                fontSize: 12,
                fontWeight: FontWeight.w700),
          ),
          Row(
            children: [
              Image.asset(
                'assets/images/menu_location.png',
                width: 8,
                height: 8,
              ),
              const Text(
                'Beauty Parlor - Baku, Azerbaijan',
                style: TextStyle(
                    fontFamily: 'Mulish',
                    fontSize: 7,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF848484)),
              ),
            ],
          ),
          Row(
            children: [
              Image.asset('assets/images/rating.png', width: 6, height: 6),
              Text(
                widget.data.averageRating.toString(),
                style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 7,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF5F5F5F)),
              ),
              const Text(
                '(0 reviews)',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 4,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF5F5F5F)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
