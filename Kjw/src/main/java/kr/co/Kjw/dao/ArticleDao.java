package kr.co.Kjw.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.co.Kjw.bean.ArticleBean;
import kr.co.Kjw.db.DBConfig;
import kr.co.Kjw.db.Sql;

public class ArticleDao {

	private static ArticleDao instance = new ArticleDao();
	private ArticleDao() {}
	
	public static ArticleDao getInstance() {
		return instance;
	}
	
	// Select Count Article
	public int selectCountArticle(String cate) {
		int total = 0;
		
		try {
			// 1,2단계
			Connection conn = DBConfig.getInstance().getConnection();
			// 3단계
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_COUNT_ARTICLE);
			psmt.setString(1, cate);
			// 4단계
			ResultSet rs = psmt.executeQuery();
			// 5단계
			if(rs.next()) {
				total = rs.getInt(1);
			}
			// 6단계
			conn.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return total;
	}
	
	// getLastPageNum
	public int getLastPageNum(int total) {
		int lastPageNum = 0;
		
		if(total % 10 == 0) {
			lastPageNum = total / 10;
		}else {
			lastPageNum = total / 10 + 1;
		}
		return lastPageNum;
	}
	
	// getCurrentPage
	public int getCurrentPage(String pg) {
		int currentPage = 1;
		
		if(pg != null) {
			currentPage = Integer.parseInt(pg);
		}
		return currentPage;
	}
	
	// getLimitStartNum
	public int getLimitStart(int currentPage) {
		return (currentPage - 1) * 10;
	}
	
	// getPageStartNum
	public int getPageStartNum(int total, int start) {
		return total - start;
	}
	
	// getPageGroup
	public int[] getPageGroup(int currentPage, int lastPageNum) {
		int groupCurrent = (int) Math.ceil(currentPage / 10.0);
		int groupStart = (groupCurrent - 1) * 10 + 1;
		int groupEnd = groupCurrent * 10;
		
		if(groupEnd > lastPageNum) {
			groupEnd = lastPageNum;
		}
		int[] groups = {groupStart, groupEnd};
		
		return groups;
	}
	
	// Select Articles
	public List<ArticleBean> selectArticles(String cate, int start) {
		List<ArticleBean> articles = new ArrayList<>();
		
		try {
			// 1,2단계
			Connection conn = DBConfig.getInstance().getConnection();
			// 3단계
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_ARTICLES);
			psmt.setString(1, cate);
			psmt.setInt(2, start);
			// 4단계
			ResultSet rs = psmt.executeQuery();
			// 5단계
			while(rs.next()) {
				ArticleBean article = new ArticleBean();
				article.setSeq(rs.getInt(1));
				article.setParent(rs.getInt(2));
				article.setComment(rs.getInt(3));
				article.setCate(rs.getString(4));
				article.setTitle(rs.getString(5));
				article.setContent(rs.getString(6));
				article.setFile(rs.getInt(7));
				article.setHit(rs.getInt(8));
				article.setUid(rs.getString(9));
				article.setRegip(rs.getString(10));
				article.setRdate(rs.getString(11));
				article.setNick(rs.getString(12));
				
				articles.add(article);
			}
			// 6단계
			conn.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return articles;
	}// Select Articles End
	
}
