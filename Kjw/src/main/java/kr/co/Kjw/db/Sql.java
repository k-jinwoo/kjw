package kr.co.Kjw.db;

public class Sql {

	public static final String SELECT_TERMS = "SELECT * FROM `BOARD_TERMS`";
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
	public static final String SELECT_MEMBER = "SELECT * FROM `BOARD_MEMBER` WHERE `uid`=? AND `pass`=PASSWORD(?)";
	public static final String SELECT_COUNT_UID = "SELECT COUNT(`uid`) FROM `BOARD_MEMBER` WHERE `uid`=?";
	
}
