/*
 *	jquery.rounded 1.1 - 2008-04-24
 *	http://www.webtrin.net/rounded
 *	Copyright (c) Marcio Trindade
 *	Licence: GPL
 *	Use: http://jquery.com/ and http://jquery.com/plugins/project/metadata
 *	Inspired in corner.js 
 */
jQuery.fn.extend({
  rounded: function() {
		return this.each(function(){
			if(jQuery(this).is("img")){
				jQuery(this).hide();
				if(jQuery.browser.msie){
					if(document.namespaces['v'] == null) {
						var stl = document.createStyleSheet();
						stl.addRule("v\\:*", "behavior: url(#default#VML);");
						document.namespaces.add("v", "urn:schemas-microsoft-com:vml");
					}
					jQuery.roundedIe(this);
				}else{
					jQuery(this).load(function(){
						jQuery.roundedAll(this);
					});
				}
			}
		});
	}
});
jQuery.extend({
  roundedAll: function(img){
		var canvas = document.createElement("canvas");
		var $img = jQuery(img);
		var $obj = $img.parent();
		var $can = jQuery(canvas);
		$img.show();
		var w = $img.width();
		var h = $img.height();

		if (canvas.getContext) {
			var radius = $img.data().size||10;
			canvas.width = w;
			canvas.height = h;
			$can.attr("id", $img.attr("id"));
			$can.attr("alt", $img.attr("alt"));
			$can.attr("title", $img.attr("title"));
			if($img.attr("align")){
				$can.css("float", $img.attr("align"));
			}
			if($img.attr("hspace")){
				$can.css({marginLeft:$img.attr("hspace"), marginRight:$img.attr("hspace")});
			}
			if($img.attr("vspace")){
				$can.css({marginTop:$img.attr("vspace"), marginBottom:$img.attr("vspace")});
			}
			
			$img.before($can).remove();

			ctx = canvas.getContext("2d");
			ctx.clearRect(0,0,w,h);
			ctx.save();

			ctx.beginPath();
			ctx.moveTo(0,radius);
			ctx.lineTo(0,h-radius);
			ctx.quadraticCurveTo(0,h,radius,h);
			ctx.lineTo(w-radius,h);
			ctx.quadraticCurveTo(w,h,w,h-radius);
			ctx.lineTo(w,radius);
			ctx.quadraticCurveTo(w,0,w-radius,0);
			ctx.lineTo(radius,0);
			ctx.quadraticCurveTo(0,0,0,radius);
			ctx.closePath();

			ctx.clip();
			ctx.fillStyle = 'rgba(0,0,0,0)';
			ctx.fillRect(0,0,w,h);
			ctx.drawImage(img,0,0,w,h);
		}
	},
  roundedIe: function(img){
		var elem = document.createElement("var");
		var $img = jQuery(img);
		var $obj = $img.parent();
		var $ele = jQuery(elem);
		var height = $img.height();
		var width = $img.width();
		var iradius = $img.data().size||10;
		var radius = Math.max(Math.min(100,iradius/(Math.min(width,height)/100)),0)+"%";

		$img.show();

		var $group = jQuery(document.createElement("v:group"));
		$group.css({zoom:"1", margin:"-1px 0 0 -1px", padding:0, position:"relative", display: $img.css("display"), width: $img.width(), height: $img.height()});
		if($img.attr("align")){
			$group.css({float:$img.attr("align")});
		}
		if($img.attr("hspace")){
			$group.css({marginLeft:$img.attr("hspace"), marginRight:$img.attr("hspace")});
		}
		if($img.attr("vspace")){
			$group.css({marginTop:$img.attr("vspace"), marginBottom:$img.attr("vspace")});
		}
		$group.attr("coordsize", $img.width() + "," + $img.height());

		var $rect = jQuery(document.createElement("v:roundrect"));
		$rect.css({margin:"-1px 0 0 -1px", padding:0, position:"absolute", width: $img.width(), height: $img.height()});
		$rect.attr("arcsize", radius);
		$rect.attr("strokeweight", 0);
		$rect.attr("filled", "t");
		$rect.attr("stroked", "f");
		$rect.attr("fillcolor", "#ffffff");

		var $fill = jQuery(document.createElement("v:fill"));
		$fill.attr("src", $img.attr("src"));
		$fill.attr("type", "frame");

		$rect.append($fill);
		$group.append($rect);
		$ele.append($group);

		$img.before($ele).remove();
	}
});
