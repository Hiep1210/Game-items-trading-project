package controller;

import dao.GameItemsDAO;
import dao.SellListDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import model.GameItems;
import model.SellItems;
import model.User;

/**
 *
 * @author VICTUS
 */
@WebServlet(name = "AddSellListController", urlPatterns = {"/addSellList"})
public class AddSellListController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        String skinName = request.getParameter("skinName");
        String exterior = request.getParameter("exterior");
        int sellTime = Integer.parseInt(request.getParameter("sellTime"));
        double price = Double.parseDouble(request.getParameter("price"));
        String gameAccount = request.getParameter("gameAccount");

        int sellerId = user.getId();
        GameItems gameItem = GameItemsDAO.getItemBySkinName(skinName, exterior);

        if (gameItem != null) {
            SellItems sellItem = new SellItems(exterior, sellTime, price, gameAccount, sellerId, gameItem.getId());

            SellListDAO.insertSellListItem(sellItem);
            int sellItemId = SellListDAO.getSellItemId(sellItem);
            SellItems sellItemInfo = SellListDAO.getSellListItemInfo(sellItemId);            
            SellListDAO.addToSellList(sellerId, sellItemId);

            PrintWriter out = response.getWriter();
            out.println("<!-- Item Card -->\n"
                    + "                                <div class=\"sell-card mb-3\" id=\"sell-card\">\n"
                    + "                                    <div class=\"row g-0\">\n"
                    + "                                        <div class=\"col-md-4\">\n"
                    + "                                            <img src=\"UI/image/" + sellItemInfo.getImg() + ".png\" class=\"img-fluid rounded\" alt=\"...\">\n"
                    + "                                        </div>\n"
                    + "                                        <div class=\"col-md-8\">\n"
                    + "                                            <div class=\"card-body\">\n"
                    + "                                                <h5 class=\"card-title mb-2\">" + sellItemInfo.getType() + " | " + sellItemInfo.getItemName() + " " + sellItemInfo.getSkinName() + " (" + sellItem.getExterior() + ")\n"
                    + "                                                </h5>\n"
                    + "                                                <p class=\"card-text mb-1\">Selling price: " + sellItemInfo.getPrice() + "</p>\n"
                    + "                                                <p class=\"card-text\">You get: $1800</p>\n"
                    + "                                            </div>\n"
                    + "                                        </div>\n"
                    + "                                        <button class=\"btn item-card-button sell-list-cart-button mt-2\">\n"
                    + "                                            <i class=\"fa-solid fa-cart-shopping\"></i>\n"
                    + "                                        </button>\n"
                    + "                                    </div>\n"
                    + "                                </div>");

        }
    }
}
