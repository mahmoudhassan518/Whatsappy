import 'package:intro_slider/slide_object.dart';
import 'package:whatsappy/presentation/utils/resources/Colors.dart';
import 'package:whatsappy/presentation/utils/widgets/Slider.dart';
import 'package:get/get.dart';



class SliderHolder {
  static List<Slide> getSliderList() {
    List<Slide> slides = [];
    slides.add(customSlider(
        title: 'introOneTitle'.tr,
        description:
        'introOneContent'.tr,
        imagePath: "assets/images/logo_light.png",
        backgroundColor: colorGoogleRed));

    slides.add(customSlider(
        title: 'introTwoTitle'.tr,
        description:
        'introTwoContent'.tr,
        imagePath: "assets/images/logo_light.png",
        backgroundColor: colorGoogleGreen));

    slides.add(customSlider(
        title: 'introThreeTitle'.tr,
        description:
        'introThreeContent'.tr,
        imagePath: "assets/images/logo_light.png",
        backgroundColor: colorGoogleBlue));

    return slides;
  }
}
