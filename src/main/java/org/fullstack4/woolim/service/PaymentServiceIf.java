package org.fullstack4.woolim.service;

import org.fullstack4.woolim.dto.PaymentDTO;

public interface PaymentServiceIf {
    int InsertPayment(PaymentDTO paymentDTO);
}
