import 'dart:io';

import 'package:ekra/features/Authentication/bloc/auth_bloc.dart';
import 'package:ekra/features/shop/bloc/product_bloc.dart';
import 'package:ekra/features/shop/models/product_model.dart';
import 'package:ekra/utils/validators/validation.dart';
import 'package:ekra/widgets/app_default_textfield.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController itemName = TextEditingController();
  final TextEditingController itemDescription = TextEditingController();
  final TextEditingController itemQuantity = TextEditingController();
  final TextEditingController itemPrice = TextEditingController();
  final TextEditingController weeklyRate = TextEditingController();
  final TextEditingController monthlyRate = TextEditingController();

  DateTime? selectedDate;
  List<File> images = [];

  @override
  Widget build(BuildContext context) {
    final ProductBloc productBloc = context.read<ProductBloc>();
    final AuthBloc authBloc = context.read<AuthBloc>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          // vertical: 32,
        ),
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/notifi.png"),
          fit: BoxFit.cover,
        )),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: ListView(
              // padding: const EdgeInsets.all(20),
              children: [
                const SizedBox(height: 15),
                const Text(
                  "Describe your Product",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 25),
                const Text(
                  "Name",
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 4,
                ),
                AppDefaultTextfield(
                  hintText: 'Excavator',
                  controller: itemName,
                  validator: (value) {
                    return KValidator.validateEmptyText('Name', value);
                  },
                ),
                const SizedBox(height: 15),
                const Text(
                  "Description*",
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(
                  height: 4,
                ),
                AppDefaultTextfield(
                  hintText: 'Make: XYZ Construction Equipment\n'
                      'Model: ABC-2000\n'
                      'Operating Weight: 20 tons\n'
                      'Engine Power: 250 horsepower\n'
                      'Bucket Capacity: 1.5 cubic meters\n'
                      'Maximum Digging Depth: 6 meters\n'
                      'Maximum Reach: 9 meters',
                  controller: itemDescription,
                  validator: (value) {
                    return KValidator.validateEmptyText('Description', value);
                  },
                  maxLines: 7,
                ),
                const SizedBox(height: 15),
                const Text(
                  "Quantity",
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 4,
                ),
                AppDefaultTextfield(
                  hintText: '1',
                  controller: itemQuantity,
                  validator: (value) {
                    return KValidator.validateEmptyText('Quantity', value);
                  },
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Price",
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Expanded(
                      child: AppDefaultTextfield(
                        hintText: 'per day',
                        controller: itemPrice,
                        validator: (value) {
                          return KValidator.validateEmptyText('Price', value);
                        },
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: AppDefaultTextfield(
                        hintText: 'per week',
                        controller: weeklyRate,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: AppDefaultTextfield(
                        hintText: 'per month',
                        controller: monthlyRate,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const Text(
                  "Availability Date",
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(
                  height: 4,
                ),
                GestureDetector(
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2025),
                    );
                    if (picked != null && picked != selectedDate) {
                      setState(() {
                        selectedDate = picked;
                      });
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.calendar_today),
                        const SizedBox(width: 10),
                        Text(
                          selectedDate == null ? 'Select Date' : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Upload photo",
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 4,
                ),
                GestureDetector(
                  onTap: () {
                    final result = FilePicker.platform.pickFiles(
                      type: FileType.image,
                      allowMultiple: true,
                    );
                    result.then((value) {
                      if (value != null) {
                        setState(() {
                          images.addAll(value.paths.map((e) => File(e!)));
                        });
                      }
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.camera_alt),
                        SizedBox(width: 10),
                        Text(
                          'Add Photo',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (images.isNotEmpty) ...[
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 16),
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: FileImage(images[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 16,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    images.removeAt(index);
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.close),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
                const SizedBox(height: 15),
                BlocConsumer<ProductBloc, ProductState>(
                  listener: (context, state) {
                    if (state is AddProductSuccess) {
                      _formKey.currentState!.reset();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Product added successfully'),
                        ),
                      );
                      itemName.clear();
                      itemDescription.clear();
                      itemPrice.clear();
                      itemQuantity.clear();
                      images.clear();
                      setState(() {});
                    } else if (state is AddProductFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Product added successfully'),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is AddProductInProgress) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ElevatedButton(
                      onPressed: () {
                        if (FirebaseAuth.instance.currentUser != null) {
                          if (_formKey.currentState!.validate()) {
                            if (images.isNotEmpty) {
                              productBloc.add(
                                AddProductEvent(
                                  product: ProductModel(
                                    name: itemName.text,
                                    description: itemDescription.text,
                                    price: double.parse(itemPrice.text),
                                    availableDate: selectedDate.toString(),
                                    user: authBloc.user,
                                    id: '',
                                    image: '',
                                    monthlyRate: double.tryParse(monthlyRate.text) ?? 0,
                                    weeklyRate: double.tryParse(weeklyRate.text) ?? 0,
                                    isFeatured: false,
                                    images: [],
                                    userId: FirebaseAuth.instance.currentUser!.uid,
                                  ),
                                  images: images,
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please add an image'),
                                ),
                              );
                            }
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please login to add product'),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xfffecf59),
                      ),
                      child: const Text(
                        "Post",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
