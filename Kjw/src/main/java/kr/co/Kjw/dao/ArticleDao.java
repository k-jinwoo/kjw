package kr.co.Kjw.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.co.Kjw.bean.ArticleBean;
import kr.co.Kjw.bean.FileBean;
import kr.co.Kjw.db.DBConfig;
import kr.co.Kjw.db.Sql;

public class ArticleDao {

	private static ArticleDao instance = new ArticleDao();

	private ArticleDao() {
	}

	public static ArticleDao getInstance() {
		return instance;
	}

	// getPageGroup
	public int[] getPageGroup(int currentPage, int lastPageNum) {
		int groupCurrent = (int) Math.ceil(currentPage / 10.0);
		int groupStart = (groupCurrent - 1) * 10 + 1;
		int groupEnd = groupCurrent * 10;

		if (groupEnd > lastPageNum) {
			groupEnd = lastPageNum;
		}
		int[] groups = { groupStart, groupEnd };

		return groups;
	}

	// getPageStartNum
	public int getPageStartNum(int total, int start) {
		return total - start;
	}

	// getLimitStartNum
	public int getLimitStart(int currentPage) {
		return (currentPage - 1) * 10;
	}

	// getCurrentPage
	public int getCurrentPage(String pg) {
		int currentPage = 1;

		if (pg != null) {
			currentPage = Integer.parseInt(pg);
		}
		return currentPage;
	}

	// getLastPageNum
	public int getLastPageNum(int total) {
		int lastPageNum = 0;

		if (total % 10 == 0) {
			lastPageNum = total / 10;
		} else {
			lastPageNum = total / 10 + 1;
		}
		return lastPageNum;
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
			if (rs.next()) {
				total = rs.getInt(1);
			}
			// 6단계
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return total;
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
			while (rs.next()) {
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

		} catch (Exception e) {
			e.printStackTrace();
		}
		return articles;
	}// Select Articles End

	// Select Article
	public ArticleBean selectArticle(String seq) {

		ArticleBean article = new ArticleBean();
		FileBean fb = new FileBean();

		try {
			// 1,2단계
			Connection conn = DBConfig.getInstance().getConnection();
			// 3단계
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_ARTICLE);
			psmt.setString(1, seq);
			// 4단계
			ResultSet rs = psmt.executeQuery();
			// 5단계
			if (rs.next()) {
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

				// 추가필드
				fb.setSeq(rs.getInt(12));
				fb.setParent(rs.getInt(13));
				fb.setOriName(rs.getString(14));
				fb.setNewName(rs.getString(15));
				fb.setDownload(rs.getInt(16));
				fb.setRdate(rs.getString(17));

				article.setFb(fb);
			}
			// 6단계
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return article;
	}

	// view - delete
	public void deleteArticle(String seq) {
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.DELETE_ARTICLE);
			psmt.setString(1, seq);

			psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// updateArticleHit
	public void updateArticleHit(String seq) {
		try {
			// 1,2단계
			Connection conn = DBConfig.getInstance().getConnection();
			// 3단계
			PreparedStatement psmt = conn.prepareStatement(Sql.UPDATE_ARTICLE_HIT);
			psmt.setString(1, seq);
			// 4단계
			psmt.executeUpdate();
			// 5단계
			// 6단계
			conn.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// selectFile
	public FileBean selectFile(String seq) {
		FileBean fb = new FileBean();
		
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_FILE);
			psmt.setString(1, seq);
			
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()) {
				fb.setSeq(rs.getInt(1));
				fb.setParent(rs.getInt(2));
				fb.setOriName(rs.getString(3));
				fb.setNewName(rs.getString(4));
				fb.setDownload(rs.getInt(5));
				fb.setRdate(rs.getString(6));
			}
			conn.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return fb;
	}
	
	// updateFileDownload
	public void updateFileDownload(String seq) {
		try {
			// 1,2단계
			Connection conn = DBConfig.getInstance().getConnection();
			// 3단계
			PreparedStatement psmt = conn.prepareStatement(Sql.UPDATE_FILE_DOWNLOAD);
			psmt.setString(1, seq);
			// 4단계
			psmt.executeUpdate();
			// 5단계
			// 6단계
			conn.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	// updateArticle
	public void updateArticle(String title, String content, String seq) {
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.UPDATE_ARTICLE);
			psmt.setString(1, title);
			psmt.setString(2, content);
			psmt.setString(3, seq);
			
			psmt.executeUpdate();
			conn.close();
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
