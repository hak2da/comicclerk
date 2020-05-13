var cmntajax = (function() {

	function add(comments, callback, error) {
		console.log(JSON.stringify(comments))
		
		$.ajax({
			type : 'POST',
			url : '/Cmnts/new',
			data : JSON.stringify(comments),
			contentType : 'application/json',
			success : function(result, status, xhr) {
				console.log("성공")
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				console.log("에러")
				if (error) {
					error(er);
				}
			}
		});
		
	}

	//getList(Board_num,commentsList)
	
	function getList(BOARD_NUM, callback, error) {
		console.log("겟리스트 js"+BOARD_NUM)
		
	    $.getJSON("/Cmnts/" +BOARD_NUM+ ".json", function(data) {
	    	            //이거 실행후      //이거 실행시킨다.
	    	// 
			console.log(data+"여기는 겟 데이터 ")
	          if (callback) {
	            callback(data); // 댓글 목록만 가져오는 경우 
	          }
	        }).fail(function(xhr, status, err) {
	      if (error) {
	        error();
	      }
	    });
	  }

	
	function remove(cmnt_num, callback, error) {
		
		console.log("js 삭제: " + cmnt_num);
		
		$.ajax({
			type : 'delete',
			url : '/Cmnts/' + cmnt_num,
			success : function(deleteResult, status, xhr) {
				if (callback) {
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}

	function update(comments, callback, error) {

		console.log("cmnt_num: " + comments.cmnt_num);

		$.ajax({
			type : 'put',
			url : '/Cmnts/' + comments.cmnt_num,
			data : JSON.stringify(comments),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}

	function displayTime(timeValue) {

		var today = new Date();

		var gap = today.getTime() - timeValue;

		var dateObj = new Date(timeValue);
		var str = "";

		if (gap < (1000 * 60 * 60 * 24)) {

			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();

			return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi].join('');

		} else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1; // getMonth() is zero-based
			var dd = dateObj.getDate();

			return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/',
					(dd > 9 ? '' : '0') + dd ].join('');
		}
	};

	return {
		add : add,
		getList : getList,
		remove : remove,
		update : update,
		displayTime : displayTime
	};

})();
