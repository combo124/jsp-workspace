package dao;

import java.util.ArrayList;
import dto.Book;

public class BookRepository {
	
	private ArrayList<Book> listofBooks= new ArrayList<Book>();
	
	
	private static BookRepository instance = new BookRepository();
	
	public static BookRepository getInstance () {
		
		return instance;
		
	}
	
	
	public BookRepository() {
	    Book book1 = new Book("ISBN1234", "tetr.io", 27000);
	    book1.setAuthor("osk");
	    book1.setDescription("부담없이 즐길수 있는 테테리스");
	    book1.setPublisher("osk");
	    book1.setCategory("퍼즐 게임");
	    book1.setUnitsInStock(1000);
	    book1.setReleaseDate("2022/10/06");
	    book1.setFilename("Rectangle 1.png");
	    book1.setGameUrl("https://tetr.io/");
 
	    Book book2 = new Book("ISBN1235", "퐁", 30000);
	    book2.setAuthor("놀런 부슈널");
	    book2.setDescription("모든 비디오 게임의 어머니.");
	    book2.setPublisher("아타리");
	    book2.setCategory("스포츠");
	    book2.setUnitsInStock(1000);
	    book2.setReleaseDate("2023/01/01");
	    book2.setFilename("Rectangle 2.png");
	    book2.setGameUrl("https://www.ponggame.org/");


	    Book book3 = new Book("ISBN1236", "프로거", 30000);
	    book3.setAuthor("코나미");
	    book3.setDescription("길 건너 친구들!");
	    book3.setPublisher("세가");
	    book3.setCategory("아케이드");
	    book3.setUnitsInStock(1000);
	    book3.setReleaseDate("2023/01/01");
	    book3.setFilename("Rectangle 3.png");
	    book3.setGameUrl("https://happyhopper.org/");



	    listofBooks.add(book1);
	    listofBooks.add(book2);
	    listofBooks.add(book3);

	}
	
	public ArrayList<Book> getAllBooks(){
		return listofBooks;
		
		
	}
	
	public Book getBookById(String bookId) {
	    Book bookById = null;

	    for (int i = 0; i < listofBooks.size(); i++) {
	        Book book = listofBooks.get(i);
	        if (book != null && book.getBookId() != null && book.getBookId().equals(bookId)) {
	            bookById = book;
	            break;
	        }
	    }

	    return bookById;
	}
	
	public void addBook(Book book) {
		listofBooks.add(book);
	}

	
	
	
}