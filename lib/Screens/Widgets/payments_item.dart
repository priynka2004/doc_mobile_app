import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healtether_clinic_app/Screens/payments/bloc/payments_bloc.dart';
import 'package:healtether_clinic_app/models/payment_model.dart/paymnets_model.dart';
import 'package:healtether_clinic_app/utils/CustomTextField.dart';

class PaymentItem extends StatefulWidget {
  const PaymentItem(
      {super.key,
      required this.index,
      required this.paymentDetails,
      this.showCheckBox = false});

  final int index;

  final PaymentModel paymentDetails;
  final bool showCheckBox;

  @override
  State<PaymentItem> createState() => _PaymentItemState();
}

class _PaymentItemState extends State<PaymentItem> {
  @override
  Widget build(BuildContext context) {
    PaymentsBloc bloc = BlocProvider.of<PaymentsBloc>(context, listen: false);
    return Container(
      child: Form(
        key: widget.paymentDetails.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Treatment ${(widget.index + 1).toString()}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 16),
                ),
                BlocListener<PaymentsBloc, PaymentsState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  child: IconButton(
                      onPressed: () {
                        bloc.add(DeleteItemEvent(index: widget.index));
                      },
                      icon: const Icon(Icons.delete)),
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            CustomTextField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Field cannot be empty';
                }
                return null;
              },
              controller: widget.paymentDetails.treatmentController,
              hintText: "Treatment",
            ),
            const SizedBox(
              height: 12,
            ),
            RowTextfield(
                "Quantity", widget.paymentDetails.quantityController, "0.0"),
            const SizedBox(
              height: 12,
            ),
            RowTextfield(
                "Amt/unit", widget.paymentDetails.amountController, "0.0"),
            const SizedBox(
              height: 12,
            ),
            RowTextfield(
                "Dst. rate ", widget.paymentDetails.rateController, "0.0"),
            const SizedBox(
              height: 16,
            ),
            Divider(
              height: 1,
              color: Colors.grey[300],
            )
          ],
        ),
      ),
    );
  }

  Widget RowTextfield(
      String Name, TextEditingController controller, String hint) {
    return Row(
      children: [
        Text(
          Name,
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: CustomTextField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Field cannot be empty';
              }
              return null;
            },
            controller: controller,
            type: TextInputType.number,
            hintText: hint,
          ),
        )
      ],
    );
  }
}
