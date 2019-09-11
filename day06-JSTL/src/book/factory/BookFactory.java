package book.factory;

import book.vo.Book;

/**
 * Book 인스턴스를 만들어서 
 * 리턴하는 팩토리 클래스
 * 
 * @author 304
 *
 */
public class BookFactory {

	/**
	 * 전체 데이터를 받아서 Book 객체를 만드는 팩소리 메소드
	 * @param sequence
	 * @param isbn
	 * @param title
	 * @param author
	 * @param company
	 * @param totalPage
	 * @param price
	 * @param quantity
	 * @return
	 */
	public static Book buildBook(int sequence, String isbn
			  , String title, String author, String company
			  , int totalPage, int price, int quantity) {
		
		return new Book(sequence, isbn, title, author, company
				      , totalPage, price, quantity);
	}
	
	/**
	 * 시퀀스 번호만 있는 Book 객체를 생성하는 팩토리 메소드
	 * @param sequence
	 * @return
	 */
	public static Book buildBook(int sequence) {
		
		return new Book(sequence);
	}
	
}
