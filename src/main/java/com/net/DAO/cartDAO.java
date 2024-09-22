package com.net.DAO;

import java.util.List;

import com.net.Bean.AddBookBean;
import com.net.Bean.Cart;

public interface cartDAO {
public boolean addCart(Cart c);

public List<Cart> getBookByUser(String uname);
}
