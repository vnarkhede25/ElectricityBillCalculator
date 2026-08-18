package com.example.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "BillCalculatorServlet", urlPatterns = {"/calculate"})
public class BillCalculatorServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String unitsStr = req.getParameter("units");
        double units = 0;
        String error = null;
        try {
            units = Double.parseDouble(unitsStr);
            if (units < 0) throw new NumberFormatException("Negative");
        } catch (Exception e) {
            error = "Please enter a valid non-negative number for units.";
        }

        if (error != null) {
            req.setAttribute("error", error);
            req.getRequestDispatcher("/index.jsp").forward(req, resp);
            return;
        }

        double bill = calculateBill(units);
        req.setAttribute("units", units);
        req.setAttribute("bill", String.format("%.2f", bill));
        req.getRequestDispatcher("/result.jsp").forward(req, resp);
    }

    private double calculateBill(double units) {
        double amount = 0.0;
        double remaining = units;

        double slab1 = Math.min(remaining, 50);
        amount += slab1 * 3.50;
        remaining -= slab1;

        if (remaining > 0) {
            double slab2 = Math.min(remaining, 100);
            amount += slab2 * 4.00;
            remaining -= slab2;
        }

        if (remaining > 0) {
            double slab3 = Math.min(remaining, 100);
            amount += slab3 * 5.20;
            remaining -= slab3;
        }

        if (remaining > 0) {
            amount += remaining * 6.50;
        }

        return amount;
    }
}
