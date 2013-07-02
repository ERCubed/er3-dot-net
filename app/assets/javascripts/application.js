// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .

function addLink() {
    if (
	window.getSelection().containsNode(
	document.getElementsByClassName('full-content')[0], true)) {
	    var body_element = document.getElementsByTagName('body')[0];
	    var selection;
	    selection = window.getSelection();
	    var oldselection = selection
	    var pagelink = "<br /><br /> Read more at <a href='http://www.ercubed.net'>ERCubed.net</a> "; //Change this if you like
	    var copy_text = selection + pagelink;
	    var new_div = document.createElement('div');
	    new_div.style.left='-99999px';
	    new_div.style.position='absolute';
	 
	    body_element.appendChild(new_div );
	    new_div.innerHTML = copy_text ;
	    selection.selectAllChildren(new_div );
	    window.setTimeout(function() {
	        body_element.removeChild(new_div );
	    },0);
	}
}
 
 
document.oncopy = addLink;


