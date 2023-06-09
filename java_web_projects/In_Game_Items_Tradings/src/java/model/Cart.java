/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;
import java.util.List;

/**
 *
 * @author Inspiron
 */
public class Cart extends MarketItems{
    int id;
    int buyer_id;
    
    public Cart(int id, int buyer_id, int mid, String game, int user_id, double price, LocalDateTime begindate, LocalDateTime enddate, int gid, String skin_name, String item_name, String type, String rarity, String exterior, String img) {
        super(mid, game, user_id, price, begindate, enddate, gid, skin_name, item_name, type, rarity, exterior, img);
        this.id = id;
        this.buyer_id = buyer_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getBuyer_id() {
        return buyer_id;
    }

    public void setBuyer_id(int buyer_id) {
        this.buyer_id = buyer_id;
    }
    
    public int getMarketItemId() {
        return super.getId();
    }


}
