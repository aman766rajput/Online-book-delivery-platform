package com.net.DAO;

import java.util.List;

import com.net.Bean.AddBookBean;

public interface bookDAO {
   public boolean addBook(AddBookBean b);
   public List<AddBookBean> getAllbook();
   public AddBookBean getBookID(int id);
   public boolean updateEditbook(AddBookBean b);
   public boolean deleteBook(int id);
   
   public List<AddBookBean> getNewBook();
   public List<AddBookBean> getRecBook();
   public List<AddBookBean> getOldBook();
   
   public List<AddBookBean> getAllRecentBook();
   public List<AddBookBean> getAllNewBook();
   public List<AddBookBean> getAlloldBook();
   
   public boolean deleteCart(int id);
   
   
}
 