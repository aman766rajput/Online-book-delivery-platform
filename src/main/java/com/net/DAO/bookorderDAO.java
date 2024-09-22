package com.net.DAO;

import java.util.List;

import com.net.Bean.bookorder;

public interface bookorderDAO {
public int getOrderNo();
public boolean saveOrder(List<bookorder > b);
public List<bookorder> getBook(String uname);
public List<bookorder> getBook();
}
