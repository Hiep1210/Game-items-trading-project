/*
*Programmer: Nguyễn Hoàng Hiệp 
*Description: This file describes the actions of the model GameItems
 */
package dao;

import Context.DBContext;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import model.GameItems;
import model.MarketItems;

/**
 *
 * @author Inspiron
 */
public class GameItemsDAO {
    public static ArrayList<GameItems> getAllGameItems(){
         ArrayList<GameItems> list = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "Select * from GameItems";
                Statement call = con.createStatement();
                ResultSet rs = call.executeQuery(sql);
                //assign value for object items then return it
                while (rs.next()) {
                    list.add(new GameItems(rs.getInt(1), rs.getString(2), rs.getString(3),
                            rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)));
                }
                call.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
    public static ArrayList<GameItems> Filter (String type, String rarity, String exterior){
        ArrayList<GameItems> list = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT * FROM game_items_trading.gameitems where true ";
                if(type !=null){
                    sql += " and type = '"+type+"'";
                }
                if(rarity != null){
                    sql += " and rarity = '"+rarity+"'";
                }
                if(exterior !=null){
                    sql += " and exterior = '"+exterior+"'";
                }
                Statement call = con.createStatement();
                ResultSet rs = call.executeQuery(sql);
                //assign value for object items then return it
                while (rs.next()) {
                    list.add(new GameItems(rs.getInt(1), rs.getString(2), rs.getString(3),
                            rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)));
                }
                call.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
    public static ArrayList<GameItems> Search (String []name){
         ArrayList<GameItems> list = new ArrayList<>();
        try {
            DBContext db = new DBContext();
            Connection con = db.getConnection();
            if (con != null) {
                String sql = "SELECT * FROM game_items_trading.gameitems where true ";
                for (int i = 0; i < name.length; i++) {
                    sql += " and (item_name Like '%"+name[i]+"%' or skin_name like '%"+name[i]+"%') ";
                }
                Statement call = con.createStatement();
                ResultSet rs = call.executeQuery(sql);
                //assign value for object items then return it
                while (rs.next()) {
                    list.add(new GameItems(rs.getInt(1), rs.getString(2), rs.getString(3),
                            rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)));
                }
                call.close();
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
    public static void main(String[] args) {
        Filter("Pistol", "Covert", "Well-Worn");
        String name[] = {"Eagle", "Code"};
        Search(name);
    }
}
