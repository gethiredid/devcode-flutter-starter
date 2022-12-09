import 'package:devcode_flutter_starter/data/enums/enums.dart';
import 'package:devcode_flutter_starter/data/model/request/create_contact_request.dart';
import 'package:devcode_flutter_starter/data/model/response/contact_model.dart';
import 'package:devcode_flutter_starter/data/repository/contact_repository.dart';
import 'package:flutter/material.dart';
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

  ContactItem? selectedContact;

  // Input controller
  final fullnameController = TextEditingController(), phoneNumberController = TextEditingController(),
        emailController = TextEditingController();

  final contactRepository = ContactRepositoryImpl();

  void resetInput() {
    fullname('');
    phoneNumber('');
    email('');

    fullnameController.text = '';
    phoneNumberController.text = '';
    emailController.text = '';
  }

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
    final data = await contactRepository.createContact(createContactRequest(fullname.value, phoneNumber.value, email.value));
    createContactStatus(data.isLeft() ? RequestStatus.ERROR : RequestStatus.SUCCESS);

    data.fold((left) {}, (right) {
      contacts.insert(0, right);

      resetInput();
    });
  }

  void editContact() async {
    createContactStatus(RequestStatus.LOADING);
    final data = await contactRepository.editContact(createContactRequest(fullname.value, phoneNumber.value, email.value), selectedContact!);
    createContactStatus(data.isLeft() ? RequestStatus.ERROR : RequestStatus.SUCCESS);

    data.fold((left) {}, (right) {
      final selectedIndex = contacts.indexWhere((element) => element.id == selectedContact?.id);

      contacts[selectedIndex] = right;
      contacts.refresh();

      // Reset [selectedContact] to null
      selectedContact = null;

      resetInput();
    });
  }

  void prepareEditContact(ContactItem contact) {
    selectedContact = contact;

    fullname(contact.fullName);
    phoneNumber(contact.phoneNumber);
    email(contact.email);

    fullnameController.text = fullname.value;
    phoneNumberController.text = phoneNumber.value;
    emailController.text = email.value;
  }

  void deleteContact(ContactItem contact) async {
    final data = await contactRepository.deleteContact(contact);

    data.fold((l) {}, (r) {
      // TODO: Tuliskan code yang berfungsi untuk menghapus item contact yang sudah terhapus dari server.
      contacts.remove(contact);

      showDeleteDialog();
    });
  }
  
  void showDeleteDialog() {
    Get.dialog(Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Data contact berhasil dihapus', key: Key('delete-desc'), style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),),
          const SizedBox(height: 16,),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  key: const Key('btn-ok'),
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('OK', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white)),
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Colors.red,
                    // minimumSize: Size(double.infinity, minimumSize ?? 50),
                  ),
                ),
              ),
            ],
          )
        ],
      ).paddingAll(16),
    ));
  }

  @override
  void onInit() {
    getContacts();

    super.onInit();
  }

  @override
  void dispose() {
    fullnameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();

    super.dispose();
  }
}