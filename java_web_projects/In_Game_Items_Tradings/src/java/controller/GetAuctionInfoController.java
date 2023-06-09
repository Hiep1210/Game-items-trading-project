/*
*Programmer: Trần Thế Hùng 
*Description: This file get the detailed information of an auction.
 */
package controller;

import dao.AuctionDAO;
import dao.BidDAO;
import dao.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import model.Auction;
import model.Bid;
import model.User;

/**
 *
 * @author Asus
 */
@WebServlet(name = "GetAuctionInfoController", urlPatterns = {"/GetAuctionInfoController"})
public class GetAuctionInfoController extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        getAnAuction(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        getAnAuction(request, response);
    }

    public void getAnAuction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Auction auction = null;
        String rawAuctionId = request.getParameter("auctionId");
        int auctionId;
        List<Bid> bidList;
        List<User> biddersList;
        int sellerId;
        User user;
        try {
            auctionId = Integer.parseInt(rawAuctionId);
            auction = AuctionDAO.getAuction(auctionId);
            if (auction != null) {
                /*Get bid list for auction*/
                bidList = BidDAO.getBidsFromAuctionId(auctionId);
                biddersList = new ArrayList<>();
                for (Bid bid : bidList) {
                    biddersList.add(UserDAO.GetUserInformation(bid.getBidderId()));
                }
                user = (User) request.getSession().getAttribute("user");
                /* get seller id for the auction */
                sellerId = auction.getSellerId();
                /* Guest session */
                if (user == null) {
                    request.setAttribute("isSeller", false);
                    /* User is logged in */
                } else {
                    request.setAttribute("isSeller", sellerId == user.getId());
                }
                /* Check if user has aready bid in auction and if is highest bidder  */
                checkIfUserIsBidder(request, response, bidList, user);

                if (auction.getEndingDate().isBefore(LocalDateTime.now())) {
                    request.setAttribute("isEnded", true);
                } else {
                    request.setAttribute("isEnded", false);
                }

                User seller = UserDAO.GetUserInformation(auction.getSellerId());
                request.setAttribute("auction", auction);
                request.setAttribute("seller", seller);
                request.setAttribute("biddersList", biddersList);
                request.setAttribute("bidList", bidList);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid id");
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            request.getRequestDispatcher("auctionInfo.jsp").forward(request, response);
        }
    }

    public void checkIfUserIsBidder(HttpServletRequest request, HttpServletResponse response,
            List<Bid> bidList, User user) {
        if (user != null) {
            for (Bid bid : bidList) {
                if (bid.getBidderId() == user.getId()) {
                    if (bidList.get(0).getBidderId()== user.getId()) {
                        request.setAttribute("isHighestBidder", true);
                    } else {
                        request.setAttribute("isHighestBidder", false);
                    }
                    request.setAttribute("userBid", bid);
                    break;
                }
            }
        }
    }

}
