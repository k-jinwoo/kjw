package kr.co.Kjw.db;

public class Sql {

	// 약관 동의 문구 가져오기
	public static final String SELECT_TERMS = "SELECT * FROM `BOARD_TERMS`";
	
	// 회원가입
	public static final String INSERT_MEMBER = "INSERT INTO `BOARD_MEMBER` SET "
											+ "`uid`=?,"
											+ "`pass`=PASSWORD(?),"
											+ "`name`=?,"
											+ "`nick`=?,"
											+ "`email`=?,"
											+ "`hp`=?,"
											+ "`zip`=?,"
											+ "`addr1`=?,"
											+ "`addr2`=?,"
											+ "`regip`=?,"
											+ "`rdate`=NOW()";
	
	// register 체크
	public static final String SELECT_MEMBER = "SELECT * FROM `BOARD_MEMBER` WHERE `uid`=? AND `pass`=PASSWORD(?)";
	public static final String SELECT_COUNT_UID = "SELECT COUNT(`uid`) FROM `BOARD_MEMBER` WHERE `uid`=?";
	public static final String SELECT_COUNT_NICK = "SELECT COUNT(`nick`) FROM `BOARD_MEMBER` WHERE `nick`=?";
	public static final String SELECT_COUNT_EMAIL = "SELECT COUNT(`email`) FROM `BOARD_MEMBER` WHERE `email`=?";
	public static final String SELECT_COUNT_HP = "SELECT COUNT(`hp`) FROM `BOARD_MEMBER` WHERE `hp`=?";
	
	// Dao
	public static final String SELECT_ARTICLE  = "SELECT * FROM `BOARD_ARTICLE` AS a "
											   + "LEFT JOIN `JBOARD_FILE` AS b "
											   + "ON a.seq = b.parent "
											   + "WHERE a.`seq`=?";
	public static final String SELECT_ARTICLES = "SELECT a.*, b.`nick` FROM `BOARD_ARTICLE` AS a "
											   + "JOIN `JBOARD_MEMBER` AS b "
											   + "ON a.uid = b.uid "
											   + "WHERE `parent`=0 AND `cate`=? "
											   + "ORDER BY `seq` DESC "
											   + "LIMIT ?, 10";
	public static final String SELECT_COUNT_ARTICLE = "SELECT COUNT(*) FROM `BOARD_ARTICLE` WHERE `parent`=0 AND `cate`=?";
	public static final String SELECT_COUNT_BOARD_TOTAL = "SELECT COUNT(*) `BOARD_ARTICLE` WHERE `parent`= 0 AND `cate`= '?'";
	// 게시판 글작성 Sql
	public static final String INSERT_ARTICLE = "INSERT INTO `BOARD_ARTICLE` SET "
											  + "`cate`=?, "
											  + "`title`=?, "
											  + "`content`=?, "
											  + "`file`=?, "
											  + "`uid`=?, "
											  + "`regip`=?, "
											  + "`rdate`=NOW()";
	public static final String SELECT_MAX_SEQ = "SELECT MAX(`seq`) FROM `BOARD_ARTICLE`";
	public static final String INSERT_FILE = "INSERT INTO `BOARD_FILE` SET "
										   + "`parent`=?, "
										   + "`oriName`=?, "
										   + "`newName`=?, "
										   + "`rdate`=NOW()";
	
}
