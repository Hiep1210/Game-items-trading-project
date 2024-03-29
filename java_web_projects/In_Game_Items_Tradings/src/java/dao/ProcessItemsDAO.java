package dao;

import Context.DBContext;
import static dao.TradeDAO.logger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.logging.Level;
import model.ProcessItem;
import model.TradeItem;

/**
 *
 * @author Asus
 */
public class ProcessItemsDAO {

    public static boolean insertProcessItems(ProcessItem processItem) {
        boolean insertStatus = true;
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            //if connection is secured, proceed to execute query and retrieve data into and return a list
            if (con != null) {
                String sql = "INSERT INTO processitems (transactionType_id , transaction_id , sender_id,receiver_id,game_account_name,process_date) "
                        + "  SELECT ?,?,?,?,?,? "
                        + "WHERE NOT EXISTS "
                        + "  (SELECT transaction_id FROM processitems WHERE transaction_id=? AND transactionType_id = ?);";
                PreparedStatement preparedStatement = con.prepareStatement(sql);
                preparedStatement.setInt(1, processItem.getTransactionTypeIdId());
                preparedStatement.setInt(2, processItem.getTransactionId());
                preparedStatement.setInt(3, processItem.getSenderId());
                preparedStatement.setInt(4, processItem.getReceiverId());
                preparedStatement.setString(5, processItem.getGameAccountName());
                preparedStatement.setObject(6, processItem.getProcessTime());
                preparedStatement.setInt(7, processItem.getTransactionTypeIdId());
                preparedStatement.setInt(8, processItem.getTransactionId());
                // if insert command failed
                if (preparedStatement.executeUpdate() != 1) {
                    insertStatus = false;
                }
                preparedStatement.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println("Error in ProcessItems");
            System.out.println(e);
        }
        return insertStatus;
    }

    public static ArrayList<ProcessItem> getAllProcessItems() {
        ArrayList<ProcessItem> processItemList = new ArrayList<>();
        ProcessItem processItem = null;
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            //if connection is secured, proceed to execute query and retrieve data into and return a list
            if (con != null) {
                String sql = "SELECT * FROM ProcessItems "
                        + " ORDER BY id ASC";
                Statement call = con.createStatement();
                ResultSet rs = call.executeQuery(sql);
                //run a loop to save queries into model  
                while (rs.next()) {
                    processItem = new ProcessItem();
                    processItem.setId(rs.getInt("id"));
                    processItem.setTransactionTypeIdId(rs.getInt("transactionType_id"));
                    processItem.setTransactionId(rs.getInt("transaction_id"));
                    processItem.setSenderId(rs.getInt("sender_id"));
                    processItem.setReceiverId(rs.getInt("receiver_id"));
                    processItem.setGameAccountName(rs.getString("game_account_name"));
                    processItem.setProcessTime(rs.getObject("process_date", LocalDateTime.class));
                    processItemList.add(processItem);
                }
                call.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return processItemList;
    }

    public static ProcessItem getProcessItems(int processItemId) {
        ProcessItem processItem = null;
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            //if connection is secured, proceed to execute query and retrieve data into and return a list
            if (con != null) {
                String sql = "SELECT * FROM ProcessItems "
                        + " WHERE id = " + processItemId;
                Statement call = con.createStatement();
                ResultSet rs = call.executeQuery(sql);
                //run a loop to save queries into model  
                while (rs.next()) {
                    processItem = new ProcessItem();
                    processItem.setId(rs.getInt("id"));
                    processItem.setTransactionTypeIdId(rs.getInt("transactionType_id"));
                    processItem.setTransactionId(rs.getInt("transaction_id"));
                    processItem.setSenderId(rs.getInt("sender_id"));
                    processItem.setReceiverId(rs.getInt("receiver_id"));
                    processItem.setGameAccountName(rs.getString("game_account_name"));
                    processItem.setProcessTime(rs.getObject("process_date", LocalDateTime.class));
                }
                call.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return processItem;
    }

    public static boolean deleteProcessItems(int processItemId) {
        boolean deleteStatus = true;
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            String sql = "DELETE FROM ProcessItems WHERE id = ?;";
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setInt(1, processItemId);
            if (preparedStatement.executeUpdate() != 1) {
                deleteStatus = false;
                System.out.println("ERROR DELETING PROCESS ITEM "
                        + processItemId);
            }
            preparedStatement.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error in delete payment request");
        }
        return deleteStatus;
    }

    public static ArrayList<ProcessItem> getAllTradeOffersInProcess() {
        ArrayList<ProcessItem> list = new ArrayList<>();
        ProcessItem items = null;
        Connection con = null;
        PreparedStatement statement = null;
        try {
            DBContext db = new DBContext();
            con = db.getConnection();
            //if connection is secured, proceed to execute query and retrieve data into and return a list
            if (con != null) {
                String sql = "SELECT * FROM  processitems p, tradeitems t where p.transactionType_id = 3"
                        + " and t.id = p.transaction_id order by p.id desc;";
                statement = con.prepareStatement(sql);
                ResultSet rs = statement.executeQuery();
                //run a loop to save queries into model
                while (rs.next()) {
                    items = new ProcessItem(rs.getInt(4), rs.getInt(5), rs.getInt(3), 3, rs.getString(6), rs.getObject(7, LocalDateTime.class));
                    items.setObject(new TradeItem(rs.getInt(3), rs.getString(9), rs.getInt(10),
                            rs.getObject(11, LocalDateTime.class), rs.getObject(12, LocalDateTime.class), null));
                    items.setId(rs.getInt(1));
                    list.add(items);
                }
            }
            con.close();
            statement.close();
        } catch (Exception e) {
            logger.log(Level.SEVERE, e.getMessage());
        }
        return list;
    }

    public static void main(String[] args) {
        getAllTradeOffersInProcess();
    }
//    public static void main(String[] args) {
//        ProcessItem processItem = new ProcessItem(1, 2, 1, 2,"Dave", LocaDateTime. );
//
////        deleteProcessItems(1);
//        for (ProcessItem pi : getAllProcessItems()) {
//            System.out.println(pi);
//        }
//    }
}
