package com.project.tmartweb.application.services.order;

import com.project.tmartweb.application.responses.Statistical;
import com.project.tmartweb.application.responses.VNPayResponse;
import com.project.tmartweb.application.services.base.IBaseService;
import com.project.tmartweb.domain.dtos.OrderDTO;
import com.project.tmartweb.domain.entities.Cart;
import com.project.tmartweb.domain.entities.Order;
import com.project.tmartweb.domain.enums.OrderStatus;
import com.project.tmartweb.domain.paginate.PaginationDTO;
import jakarta.servlet.http.HttpServletRequest;

import java.sql.Timestamp;
import java.util.List;
import java.util.UUID;

public interface IOrderService extends IBaseService<Order, OrderDTO, UUID> {
    List<Order> findByUserId(UUID userId, OrderStatus status, String keyword);

    double totalMoneyOrder(List<Cart> carts, double discount);

    void FeedbackOrder(UUID orderId);

    VNPayResponse createOrder(OrderDTO orderDTO, HttpServletRequest request);

    int orderReturn(HttpServletRequest request);

    List<Statistical> statisticals(int year);

    void sendMailCreateOrder(Order order);

    void sendMailShippedOrder(Order order);

    PaginationDTO<Order> getAllByFilter(
            Timestamp startDate,
            Timestamp endDate,
            OrderStatus status,
            Integer page,
            Integer perPage
    );
}
