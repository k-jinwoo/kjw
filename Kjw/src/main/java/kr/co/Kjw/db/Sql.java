package kr.co.Kjw.db;

public class Sql {

	public static final String SELECT_TERMS = "SELECT * FROM `BOARD_TERMS`";
	public static final String INSERT_MEMBER = "INSERT INTO `BOARD_MEMBER` SET "
											+ "`uid`=?,"
											+ "`pass`=?,"
											+ "`name`=?,"
											+ "`nick`=?,"
											+ "`email`=?,"
											+ "`hp`=?,"
											+ "`zip`=?,"
											+ "`addr1`=?,"
											+ "`addr2`=?,"
											+ "`regip`=?,"
											+ "`rdate`=NOW()";
	
}
