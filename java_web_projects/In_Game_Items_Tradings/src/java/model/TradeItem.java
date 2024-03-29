/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;

/**
 *
 * @author Inspiron
 */
public class TradeItem {
    private int id;
    private String gAcc;
    private int creatorId;
    private LocalDateTime begin;
    private LocalDateTime end;
    private User creator;

    public TradeItem(int id, String gAcc, int creatorId, LocalDateTime begin, LocalDateTime end, User creator) {
        this.id = id;
        this.gAcc = gAcc;
        this.creatorId = creatorId;
        this.begin = begin;
        this.end = end;
        this.creator = creator;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getgAcc() {
        return gAcc;
    }

    public void setgAcc(String gAcc) {
        this.gAcc = gAcc;
    }

    public int getCreatorId() {
        return creatorId;
    }

    public void setCreatorId(int creatorId) {
        this.creatorId = creatorId;
    }

    public LocalDateTime getBegin() {
        return begin;
    }

    public void setBegin(LocalDateTime begin) {
        this.begin = begin;
    }

    public LocalDateTime getEnd() {
        return end;
    }

    public void setEnd(LocalDateTime end) {
        this.end = end;
    }

    public User getCreator() {
        return creator;
    }

    public void setCreator(User creator) {
        this.creator = creator;
    }

    
    
}
