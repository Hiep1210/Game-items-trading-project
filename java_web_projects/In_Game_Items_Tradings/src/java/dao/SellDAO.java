/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import Context.DBContext;
import static dao.GameItemsDAO.Filter;
import static dao.GameItemsDAO.Search;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import model.GameItems;

/**
 *
 * @author VICTUS
 */
public class SellDAO {

    public static ArrayList<GameItems> getAllSellItems() {
        ArrayList<GameItems> list = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT DISTINCT skin_name, item_name, type, rarity, img "
                        + "FROM GameItems "
                        + "WHERE (skin_name) IN (SELECT DISTINCT skin_name FROM GameItems)";
                Statement call = con.createStatement();
                ResultSet rs = call.executeQuery(sql);
                //assign value for object items then return it
                while (rs.next()) {
                    list.add(new GameItems(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)));
                }
                call.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public static ArrayList<GameItems> getTopTwelveItems() {
        ArrayList<GameItems> list = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT DISTINCT skin_name, item_name, type, rarity, img "
                        + "FROM GameItems "
                        + "WHERE (skin_name) IN (SELECT DISTINCT skin_name FROM GameItems) "
                        + "ORDER BY rarity, skin_name, item_name "
                        + "LIMIT 12";
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(sql);
                //assign value for object items then return it
                while (rs.next()) {
                    list.add(new GameItems(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)));
                }
                st.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public static ArrayList<GameItems> getNextTwelveItems(int amount) {
        ArrayList<GameItems> list = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT DISTINCT skin_name, item_name, type, rarity, img "
                        + "FROM GameItems "
                        + "WHERE (skin_name) IN (SELECT DISTINCT skin_name FROM GameItems) "
                        + "ORDER BY rarity, skin_name,item_name "
                        + "LIMIT 12 OFFSET ?";
                PreparedStatement st = con.prepareStatement(sql);
                st.setInt(1, amount);
                ResultSet rs = st.executeQuery();
                //assign value for object items then return it
                while (rs.next()) {
                    list.add(new GameItems(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)));
                }
                st.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public static ArrayList<GameItems> searchByName(String name) {
        ArrayList<GameItems> list = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT DISTINCT skin_name, item_name, type, rarity, img "
                        + "FROM GameItems "
                        + "WHERE (skin_name) IN (SELECT DISTINCT skin_name FROM GameItems) "
                        + "AND (skin_name) LIKE ? OR (item_name) LIKE ? OR (type) LIKE ? "
                        + "ORDER BY rarity, skin_name,item_name ";
                PreparedStatement st = con.prepareStatement(sql);
                st.setString(1, "%" + name + "%");
                st.setString(2, "%" + name + "%");
                st.setString(3, "%" + name + "%");
                ResultSet rs = st.executeQuery();
                //assign value for object items then return it
                while (rs.next()) {
                    list.add(new GameItems(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)));
                }
                st.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public static ArrayList<GameItems> sortByRarity(String order) {
        ArrayList<GameItems> list = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = null;
                if("rarest".equals(order)) {
                    sql = "SELECT DISTINCT skin_name, item_name, type, rarity, img "
                        + "FROM gameItems "
                        + "WHERE skin_name IN (SELECT DISTINCT skin_name FROM gameItems) "
                        + "ORDER BY CASE rarity "
                        + "    WHEN 'covert' THEN 1 "
                        + "    WHEN 'classified' THEN 2 "
                        + "    WHEN 'restricted' THEN 3 "
                        + "    WHEN 'mil-spec' THEN 4 "
                        + "    WHEN 'industrial' THEN 5 "
                        + "    ELSE 6 "
                        + "END;";
                } else {
                    sql = "SELECT DISTINCT skin_name, item_name, type, rarity, img "
                        + "FROM gameItems "
                        + "WHERE skin_name IN (SELECT DISTINCT skin_name FROM gameItems) "
                        + "ORDER BY CASE rarity "
                        + "    WHEN 'covert' THEN 1 "
                        + "    WHEN 'classified' THEN 2 "
                        + "    WHEN 'restricted' THEN 3 "
                        + "    WHEN 'mil-spec' THEN 4 "
                        + "    WHEN 'industrial' THEN 5 "
                        + "    ELSE 6 "
                        + "END DESC;";
                }
                PreparedStatement st = con.prepareStatement(sql);
                ResultSet rs = st.executeQuery();
                //assign value for object items then return it
                while (rs.next()) {
                    list.add(new GameItems(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)));
                }
                st.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public static void main(String[] args) {
        ArrayList<GameItems> sellItems = sortByRarity("common");
        for (GameItems sellItem : sellItems) {
            System.out.print(sellItem.getSkinName() + "\t");
            System.out.println(sellItem.getRarity());
        }
    }
}