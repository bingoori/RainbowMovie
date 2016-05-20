//생성자 개념
function Global(arg){
	this.context= arg;
};
//(@Overriding ==prototype 같은 개념임)
Global.prototype.setContext = function(context){
	this.context= context;
}
Global.prototype.getContext = function() {
	return this.context;
}
