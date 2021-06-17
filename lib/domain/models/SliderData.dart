import 'package:intro_slider/slide_object.dart';
import 'package:whatsappy/presentation/utils/resources/Colors.dart';
import 'package:whatsappy/presentation/utils/widgets/Slider.dart';

class SliderHolder {
  static List<Slide> getSliderList() {
    List<Slide> slides = [];
    slides.add(customSlider(
        title: "Create Links",
        description:
            "Create clickable links for your whatsApp account and share them with anyone to send you a message with one click!",
        imagePath: "assets/images/logo_light.png",
        backgroundColor: colorGoogleRed));

    slides.add(customSlider(
        title: "Save Messages",
        description:
            "No need to rewrite the same message on & on, with text messaging templates, you can create any number of pre-set messages and send them to multiple people at once.",
        imagePath: "assets/images/logo_light.png",
        backgroundColor: colorGoogleGreen));

    slides.add(customSlider(
        title: "Integrated with Call History",
        description:
            "In your recent call history, you can choose a number, then click Share and choose whatsappy to open a newWhatsApp conversation with this number.",
        imagePath: "assets/images/logo_light.png",
        backgroundColor: colorGoogleBlue));

    return slides;
  }
}
