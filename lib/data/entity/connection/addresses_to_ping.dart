import 'dart:io';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';

final addressesToPing = <AddressCheckOptions>[
  AddressCheckOptions(
    address: InternetAddress(
      '1.1.1.1', // Cloudflare
      type: InternetAddressType.IPv4,
    ),
  ),
  AddressCheckOptions(
    address: InternetAddress(
      '2606:4700:4700::1111', // Cloudflare
      type: InternetAddressType.IPv6,
    ),
  ),
  AddressCheckOptions(
    address: InternetAddress(
      '8.8.4.4', // Google
      type: InternetAddressType.IPv4,
    ),
  ),
  AddressCheckOptions(
    address: InternetAddress(
      '2001:4860:4860::8888', // Google
      type: InternetAddressType.IPv6,
    ),
  ),
  AddressCheckOptions(
    address: InternetAddress(
      '208.67.222.222', // OpenDNS
      type: InternetAddressType.IPv4,
    ),
  ),
  AddressCheckOptions(
    address: InternetAddress(
      '2620:0:ccc::2', // OpenDNS
      type: InternetAddressType.IPv6,
    ),
  ),
  AddressCheckOptions(
    address: InternetAddress(
      '180.76.76.76', // Baidu
      type: InternetAddressType.IPv4,
    ),
  ),
  AddressCheckOptions(
    address: InternetAddress(
      '2400:da00::6666', // Baidu
      type: InternetAddressType.IPv6,
    ),
  ),
];
