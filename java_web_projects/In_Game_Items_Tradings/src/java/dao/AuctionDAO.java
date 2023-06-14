/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import Context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.util.ArrayList;
import model.Auction;

/**
 *
 * @author Asus
 */
public class AuctionDAO {

    //Function to get all items in the market 
    public static ArrayList<Auction> getAuctions() {
        ArrayList<Auction> auctionList = new ArrayList<>();
        Auction auction = null;
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            //if connection is secured, proceed to execute query and retrieve data into and return a list
            if (con != null) {
                String sql = "SELECT * FROM game_items_trading.auction "
                        + " WHERE NOW() < ending_date;";
                Statement call = con.createStatement();
                ResultSet rs = call.executeQuery(sql);
                //run a loop to save queries into model
                while (rs.next()) {
                    auction = new Auction();
                    auction.setAuctionId(rs.getInt("id"));
                    auction.setSellerId(rs.getInt("seller_id"));
                    auction.setItemId(rs.getInt("item_id"));
                    auction.setLowestBid(rs.getDouble("lowest_bid"));
                    auction.setStartingDate(rs.getObject("starting_date", LocalDateTime.class));
                    auction.setEndingDate(rs.getObject("ending_date", LocalDateTime.class));
                    auction.setGameAccountName(rs.getString("game_account_name"));
                    auctionList.add(auction);
                }
                call.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return auctionList;
    }

    public static Auction getAuction(int auctionId) {
        Auction auction = null;
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            //if connection is secured, proceed to execute query and retrieve data into and return a list
            if (con != null) {
                String sql = "SELECT * FROM game_items_trading.auction "
                        + " WHERE id = " + auctionId;
                Statement call = con.createStatement();
                ResultSet rs = call.executeQuery(sql);
                //run a loop to save queries into model
                while (rs.next()) {
                    auction = new Auction();
                    auction.setAuctionId(rs.getInt("id"));
                    auction.setSellerId(rs.getInt("seller_id"));
                    auction.setItemId(rs.getInt("item_id"));
                    auction.setLowestBid(rs.getDouble("lowest_bid"));
                    auction.setStartingDate(rs.getObject("starting_date", LocalDateTime.class));
                    auction.setEndingDate(rs.getObject("ending_date", LocalDateTime.class));
                    auction.setGameAccountName(rs.getString("game_account_name"));
                }
                call.close();
                rs.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return auction;
    }

    public static boolean insertAuction(Auction auction) {
        //Return true if insert process was successfull
        boolean insertStatus = true;
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            //if connection is secured, proceed to execute query and retrieve data into and return a list
            if (con != null) {
                String sql = "INSERT INTO game_items_trading.auction ( seller_id, "
                        + " item_id, lowest_bid, starting_date,"
                        + " ending_date, game_account_name) VALUES "
                        + " ( ?, ?, ?, ?, ?, ?);";
                PreparedStatement preparedStatement = con.prepareStatement(sql);
                preparedStatement.setInt(1, auction.getSellerId());
                preparedStatement.setInt(2, auction.getItemId());
                preparedStatement.setDouble(3, auction.getLowestBid());
                preparedStatement.setObject(4, auction.getStartingDate());
                preparedStatement.setObject(5, auction.getEndingDate());
                preparedStatement.setString(6, auction.getGameAccountName());
                // if insert command failed
                if (preparedStatement.executeUpdate() != 1) {
                    insertStatus = false;
                    System.out.println("ERROR INSERTING PAYMENTREQUEST, NO ROWS AFFECTED");
                }
                preparedStatement.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println("Error in insertPaymentRequest");
            System.out.println(e);
        }
        return insertStatus;
    }

    public static boolean deleteAuctions(ArrayList<Integer> auctionIds) {
        //Return true if delete process was successfull
        boolean deleteStatus = true;
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            con.setAutoCommit(false);
            String sql = "DELETE FROM Auction WHERE id = ?;";
            PreparedStatement preparedStatement = con.prepareStatement(sql);

            //Loop through all payment request id and delete it from the table
            for (int auctionId : auctionIds) {
                preparedStatement.setInt(1, auctionId);
                if (preparedStatement.executeUpdate() != 1) {
                    con.rollback();
                    deleteStatus = false;
                    throw new Exception("ERROR DELETING AUCTION, NO CHANGES WAS COMMITED");
                }
            }
            con.commit();
            preparedStatement.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error in delete auction");
        }
        return deleteStatus;
    }

    public static void main(String[] args) {
//        insertAuction(new Auction(1, 1, 1, 10, "Dave", LocalDateTime.of(2023, 06, 01, 0, 0, 0), LocalDateTime.of(2023, 06, 20, 05, 10, 50)));
//        ArrayList<Auction> list = getAuctions();
//        for (Auction auction : list) {
//            System.out.println(auction);
//            System.out.println(auction.getEndingDate().getHour());
//            System.out.println(auction.getEndingDate().getMinute());
//            System.out.println(auction.getEndingDate().getSecond());
//        }
        ArrayList<Integer> list = new ArrayList<>() ;
        list.add(1);
        if (deleteAuctions(list)) {
            System.out.println("delete successful");
        }
        System.out.println(getAuction(1));

    }
}