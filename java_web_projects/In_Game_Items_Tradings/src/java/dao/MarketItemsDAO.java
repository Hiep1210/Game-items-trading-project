/*
*Programmer: Nguyễn Hoàng Hiệp 
*Description: This file describes the actions of the model MarketItems
 */
package dao;

import Context.DBContext;
import static dao.CartDAO.logger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.logging.Level;
import model.MarketItems;

/**
 *
 * @author Inspiron
 */
public class MarketItemsDAO {

    private static final String SELECTITEMS = "select m.id,m.game_account_name,m.user_id, m.price, m.begin_date, m.end_date, g.* \n"
            + "FROM marketitems m, gameitems g \n"
            + "WHERE m.item_id = g.id AND NOW() < m.end_date\n"
            + "AND NOT EXISTS (\n"
            + "SELECT 1 FROM processitems p \n"
            + "WHERE  p.transaction_id = m.id\n"
            + "AND p.transactionType_id = 1)";

    private static final String SELECTENDEDITEMS = "select m.id,m.game_account_name,m.user_id, m.price, m.begin_date, m.end_date, g.*  "
            + "FROM marketitems m, gameitems g  "
            + "WHERE m.item_id = g.id AND NOW() > m.end_date  "
            + "AND NOT EXISTS ( "
            + "     SELECT 1 FROM processitems p   "
            + "     WHERE  p.transaction_id = m.id  "
            + "     AND p.transactionType_id = 1) ";

    //Function to get all items in the market 
    public static ArrayList<MarketItems> getAllMarketItems() {
        ArrayList<MarketItems> list = new ArrayList<>();
        MarketItems items = null;
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            //if connection is secured, proceed to execute query and retrieve data into and return a list
            if (con != null) {
                String sql = SELECTITEMS;
                Statement call = con.createStatement();
                ResultSet rs = call.executeQuery(sql);
                //run a loop to save queries into model
                while (rs.next()) {
                    items = new MarketItems(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDouble(4), rs.getObject(5, LocalDateTime.class),
                            rs.getObject(6, LocalDateTime.class), rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11),
                            rs.getString(12), rs.getString(13));
                    list.add(items);
                }
                call.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public static ArrayList<MarketItems> getUserMarketItems(int userId) {
        ArrayList<MarketItems> list = new ArrayList<>();
        MarketItems items = null;
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            //if connection is secured, proceed to execute query and retrieve data into and return a list
            if (con != null) {
                String sql = SELECTITEMS + " AND m.user_id = " + userId + " ";
                Statement call = con.createStatement();
                ResultSet rs = call.executeQuery(sql);
                //run a loop to save queries into model
                while (rs.next()) {
                    items = new MarketItems(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDouble(4), rs.getObject(5, LocalDateTime.class),
                            rs.getObject(6, LocalDateTime.class), rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11),
                            rs.getString(12), rs.getString(13));
                    list.add(items);
                }
                call.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public static ArrayList<MarketItems> getUserProcessItems(int userId) {
        ArrayList<MarketItems> list = new ArrayList<>();
        MarketItems items = null;
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            //if connection is secured, proceed to execute query and retrieve data into and return a list
            if (con != null) {
                String sql = "select m.id,m.game_account_name,m.user_id, m.price, m.begin_date, m.end_date, g.* \n"
                        + "FROM marketitems m, gameitems g \n"
                        + "WHERE m.item_id = g.id AND NOW() < m.end_date\n"
                        + "AND EXISTS (\n"
                        + "SELECT 1 FROM processitems p \n"
                        + "WHERE  p.transaction_id = m.id\n"
                        + "AND p.transactionType_id = 1) "
                        + "AND m.user_id = " + userId + " ";
                Statement call = con.createStatement();
                ResultSet rs = call.executeQuery(sql);
                //run a loop to save queries into model
                while (rs.next()) {
                    items = new MarketItems(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDouble(4), rs.getObject(5, LocalDateTime.class),
                            rs.getObject(6, LocalDateTime.class), rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11),
                            rs.getString(12), rs.getString(13));
                    list.add(items);
                }
                call.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public static MarketItems getMarketItem(int marketItemId) {
        MarketItems item = null;
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            //if connection is secured, proceed to execute query and retrieve data into and return a list
            if (con != null) {
                String sql = "select m.id,m.game_account_name,m.user_id, m.price, m.begin_date, m.end_date, g.* "
                        + "FROM marketitems m, gameitems g "
                        + "WHERE m.item_id = g.id AND m.id = " + marketItemId;
                Statement call = con.createStatement();
                ResultSet rs = call.executeQuery(sql);
                //run a loop to save queries into model
                while (rs.next()) {
                    item = new MarketItems(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDouble(4), rs.getObject(5, LocalDateTime.class),
                            rs.getObject(6, LocalDateTime.class), rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11),
                            rs.getString(12), rs.getString(13));
                }
                call.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return item;
    }

    public static ArrayList<MarketItems> getUnsuccessfulMarketItems() {
        ArrayList<MarketItems> list = new ArrayList<>();
        MarketItems items = null;
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            //if connection is secured, proceed to execute query and retrieve data into and return a list
            if (con != null) {
                String sql = SELECTENDEDITEMS;
                Statement call = con.createStatement();
                ResultSet rs = call.executeQuery(sql);
                //run a loop to save queries into model
                while (rs.next()) {
                    items = new MarketItems(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDouble(4), rs.getObject(5, LocalDateTime.class),
                            rs.getObject(6, LocalDateTime.class), rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11),
                            rs.getString(12), rs.getString(13));
                    list.add(items);
                }
                call.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public static boolean deletelMarketItem(int marketItemId) {
        boolean deleteStatus = true;
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            String sql = "delete from marketItems where id = " + marketItemId;
            Statement statement = con.createStatement();
            if (statement.executeUpdate(sql) < 1) {
                deleteStatus = false;
                throw new Exception();
            }
            con.close();
            statement.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return deleteStatus;
    }

    public static ArrayList<MarketItems> Filter(String priceorder, String[] type, String[] rarity, String[] exterior) {
        ArrayList<MarketItems> list = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = SELECTITEMS;
                if (type != null) {
                    sql += " and (";
                    for (int i = 0; i < type.length - 1; i++) {
                        sql += " type = '" + type[i] + "' or ";
                    }
                    sql += " type = '" + type[type.length - 1] + "') ";
                }
                if (rarity != null) {
                    sql += " and (";
                    for (int i = 0; i < rarity.length - 1; i++) {
                        sql += " rarity = '" + rarity[i] + "' or ";
                    }
                    sql += " rarity = '" + rarity[rarity.length - 1] + "') ";
                }
                if (exterior != null) {
                    sql += " and (";
                    for (int i = 0; i < exterior.length - 1; i++) {
                        sql += " exterior = '" + exterior[i] + "' or ";
                    }
                    sql += " exterior = '" + exterior[exterior.length - 1] + "') ";
                }
                if (priceorder != null) {
                    sql += " order by price " + priceorder;
                }
                Statement call = con.createStatement();
                ResultSet rs = call.executeQuery(sql);
                //assign value for object items then return it
                while (rs.next()) {
                    list.add(new MarketItems(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDouble(4), rs.getObject(5, LocalDateTime.class),
                            rs.getObject(6, LocalDateTime.class), rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11),
                            rs.getString(12), rs.getString(13)));
                }
                call.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public static ArrayList<MarketItems> Search(String[] name) {
        ArrayList<MarketItems> list = new ArrayList<>();
        MarketItems items = null;
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            //if connection is secured, proceed to execute query and retrieve data into and return a list
            if (con != null) {
                String sql = SELECTITEMS;
                for (int i = 0; i < name.length; i++) {
                    sql += " and (item_name Like '%" + name[i] + "%' or skin_name like '%" + name[i] + "%') ";
                }
                Statement call = con.createStatement();
                ResultSet rs = call.executeQuery(sql);
                //run a loop to save queries into model
                while (rs.next()) {
                    items = new MarketItems(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDouble(4), rs.getObject(5, LocalDateTime.class),
                            rs.getObject(6, LocalDateTime.class), rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11),
                            rs.getString(12), rs.getString(13));
                    list.add(items);
                }
                call.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public static void deleteUserSellingItems(int itemId) {
        Connection con = null;
        PreparedStatement statement = null;
        try {
            DBContext db = new DBContext();
            con = db.getConnection();
            String sql = "DELETE FROM MarketItems WHERE id = ?;";
            statement = con.prepareStatement(sql);
            statement.setInt(1, itemId);
            statement.executeUpdate();
        } catch (Exception e) {
            logger.log(Level.SEVERE, e.getMessage());
        } finally {
            try {
                statement.close();
                con.close();
            } catch (SQLException s) {
                logger.log(Level.SEVERE, s.getMessage());
            }
        }
    }
    
    public static void main(String[] args) {
        ArrayList<MarketItems> list = getUserProcessItems(2);
        for (MarketItems marketItems : list) {
            System.out.println(marketItems.getId());
            System.out.println(marketItems.getSkinName());
        }
    }
}
