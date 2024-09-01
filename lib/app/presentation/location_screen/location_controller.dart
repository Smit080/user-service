import '../../utils/all_dependency.dart';

class LocationController extends GetxController {
  FocusNode focusNode = FocusNode();
  List<int> selectedCat = [];
  List<String> catList = ["All", "Haircut", "Facial"];
  RxString search = "".obs;
  TextEditingController searchController = TextEditingController();
  final Completer<GoogleMapController> controller =
      Completer<GoogleMapController>();

  CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
}
