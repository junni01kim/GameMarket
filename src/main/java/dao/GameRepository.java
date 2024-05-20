package dao;

import java.util.ArrayList;
import java.util.Iterator;

import dto.Game;


public class GameRepository{
	
	
	private ArrayList<Game> listOfGames = new ArrayList<>();
	
	private static GameRepository instance = new GameRepository();

	public static GameRepository getInstance(){
		return instance;
	} 
	
	
	public GameRepository() {
	
		// 코드명은 영문 둘째짜리까지 기술
		Game game1= new Game("AE0001","에이몽어스");
		game1.setProducer("OuttererSloth");
		game1.setDescription("죽기 싫다면 찾아라, 그리고 너는 숨어라!");
		game1.setPublisher("Unique Games");
		game1.setCategory("추리");	
		game1.setReleaseDate("2018/06/15");
		game1.setFilename("ISBN1234.jpg");
		game1.setRating(5);
		game1.setReview("살다살다 이렇게 재밌는 게임은 처음봤어요!!");
		
		Game game2 = new Game("LI0001","리브바이데이라이트");
		game2.setProducer("비긴헤이비어");
		game2.setDescription("끝까지 도망쳐라, 그렇다면 살아남을 것이다!");
		game2.setPublisher("증기");
		game2.setCategory("공포");
		game2.setReleaseDate("2016/06/14");
		game2.setFilename("ISBN1235.jpg");
		game2.setRating(3);
		game2.setReview("찬구끼리는 하고 싶지만 가족끼리는 하기 싫은 게임.");
		
		Game game3 = new Game("MO0001","나만의 마블");
		game3.setProducer("엠투플레이");
		game3.setDescription("나만을 마블 나만 해");
		game3.setPublisher("인터넷마블");
		game3.setCategory("오락");
		game3.setReleaseDate("2013/06/09");
		game3.setFilename("ISBN1236.jpg");
		game3.setRating(1);
		game3.setReview("와...");
		
		Game game4 = new Game("SU001","서든방어");
		game4.setProducer("녹슨지티");
		game4.setDescription("아이고~ 깜짝이야!");
		game4.setPublisher("돈슨");
		game4.setCategory("슈팅");
		game4.setReleaseDate("2005/04/11");
		game4.setFilename("ISBN1236.jpg");
		game4.setRating(4);
		game4.setReview("추억을 떠오르게 하는 향수를 불러 일으키는 게임");
		
		listOfGames.add(game1);
		listOfGames.add(game2);
		listOfGames.add(game3);
		listOfGames.add(game4);
		
	}
	public ArrayList<Game> getAllGames() {
		return listOfGames;
	}
	public Game getGameById(String gameId) {
		Game gameById = null;

		for (int i = 0; i < listOfGames.size(); i++) {
			Game game = listOfGames.get(i);
			if (game != null && game.getGameId() != null && game.getGameId().equals(gameId)) {
				
				gameById = game;
				break;
			}
		}
		return gameById;
	}
	
	public void addGame(Game game) {
		listOfGames.add(game);
	}
	
	public void updateGame(String gameId, int rating, String review) {
		for (Iterator iterator = listOfGames.iterator(); iterator.hasNext();) {
			Game game = (Game) iterator.next();
			if(game.getGameId().equals(gameId)) {
				game.setRating(rating);
				game.setReview(review);
				break;
			}
		}
	}
}
