function CheckAddGame() {

	var gameId = document.getElementById("gameId");
	var name = document.getElementById("name");
	var unitPrice = document.getElementById("unitPrice");
	var description = document.getElementById("description");
	
	// 게임 아아디 체크
	if (!check(/^ISBN[0-9]{4,11}$/, gameId,
			"[게임 코드]\nISBN과 숫자를 조합하여 5~12자까지 입력하세요\n첫 글자는 반드시 ISBN로 시작하세요"))
		return false;
		
	// 게임명 체크	
	if (name.value.length < 4 || name.value.length > 12) {
		alert("[게임명]\n최소 4자에서 최대 50자까지 입력하세요");
		//name.select();
		name.focus();
		return false;
	}
	
	// 게임 가격 체크
	if (unitPrice.value.length == 0 || isNaN(unitPrice.value)) {
		alert("[가격]\n숫자만 입력하세요");
		//unitPrice.select();
		unitPrice.focus();
		return false;
	}

	if (unitPrice.value < 0) {
		alert("[가격]\n음수를 입력할 수 없습니다");
		//unitPrice.select();
		unitPrice.focus();
		return false;
	} 
	
	// 설명 입력 체크
	if (description.value.length < 20) {
		alert("[상세설명]\n최소 20자이상 입력하세요");
		//description.select();
		description.focus();
		return false;
	}
	
	function check(regExp, e, msg) {

		if (regExp.test(e.value)) {
			return true;
		}
		alert(msg);
		//e.select();
		e.focus();
		return false;
	}

	 document.newGame.submit()
}

function CheckAddReview() {

	var name = document.getElementById("name");
	var rating = document.getElementById("rating");
	var review = document.getElementById("review");
	
	/*if (rating.value < 0) {
		alert("[평점]\n음수를 입력할 수 없습니다");
		rating.focus();
		return false;
	}
	
	alert("[평점]\n최대 5점까지만 입력할 수 있습니다.");
	if (rating.value > 5) {
		alert("[평점]\n최대 5점까지만 입력할 수 있습니다.");
		rating.focus();
		return false;
	}
	
	alert("[리뷰]\n최소 10자이상 입력하세요");
	// 설명 입력 체크
	if (review.value.length < 10) {
		alert("[리뷰]\n최소 10자이상 입력하세요");
		review.focus();
		return false;
	}
	
	
	if (review.value.search("별별") != -1) {
		aleart("[리뷰]\n욕설과 비난은 제제 대상입니다.");
		review.focus();
		return false;
	}
	
	function check(regExp, e, msg) {

		if (regExp.test(e.value)) {
			return true;
		}
		alert(msg);
		//e.select();
		e.focus();
		return false;
	}*/
	 document.newReview.submit()
}
