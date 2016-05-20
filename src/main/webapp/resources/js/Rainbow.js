/**
 * Hanbit 팩토리 즉시 실행함수
 */
(function(){
	$.fn.extend({
		global : function(arg){
			return new Global(arg);
		},

		main : function(){
			return new Main();
		},
		
		member : function(){
			return new Member();
		},
		
		purchase : function() {
			return new Purchase();
		},
		cinema : function() {
			return new Cinema();
		}
		
	});
})();