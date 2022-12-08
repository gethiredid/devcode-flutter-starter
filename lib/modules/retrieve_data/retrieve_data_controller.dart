import 'package:devcode_flutter_starter/data/enums/enums.dart';
// TODO: Uncomment code di bawa ini untuk meng-import file create_contact_request.dart
// import 'package:devcode_flutter_starter/data/model/request/create_contact_request.dart';
import 'package:devcode_flutter_starter/data/model/response/contact_model.dart';
import 'package:devcode_flutter_starter/data/repository/contact_repository.dart';
import 'package:get/get.dart';

class RetrieveDataController extends GetxController {
  // .obs berarti variabel ini bersifat observable (perubahan data melalui stream)

  // Get contact variable
  final contactStatus = RequestStatus.IDLE.obs;
  final contacts = <ContactItem>[].obs;

  // Create contact variable
  final createContactStatus = RequestStatus.IDLE.obs;
  final fullname = ''.obs;
  final phoneNumber = ''.obs;
  final email = ''.obs;

  final contactRepository = ContactRepositoryImpl();

  void getContacts() async {
    contactStatus(RequestStatus.LOADING);
    final data = await contactRepository.getContact();
    // Code di bawah ini adalah inline condition atau biasa disebut ternary condition.
    // [.isLeft()] merupakan method bawaaan dari package [dartz] untuk mengetahui status error
    contactStatus(data.isLeft() ? RequestStatus.ERROR : RequestStatus.SUCCESS);

    data.fold((left) {}, (right) => contacts.assignAll(right));
  }

  void createContact() async {
    createContactStatus(RequestStatus.LOADING);
    // TODO: Uncomment code di bawah untuk memanggil method yg ada di [contactRepository].
    // final data = await contactRepository.createContact(createContactRequest(fullname.value, phoneNumber.value, email.value));
    // createContactStatus(data.isLeft() ? RequestStatus.ERROR : RequestStatus.SUCCESS);
    //
    // data.fold((left) {}, (right) => contacts.insert(0, right));
  }

  @override
  void onInit() {
    getContacts();

    super.onInit();
  }
}