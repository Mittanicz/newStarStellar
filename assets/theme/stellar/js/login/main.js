$(function(){$(".flags").on("click",function(t){t.preventDefault();t=$(this).attr("class").replace(/flags(.*)/,"$1").trim();return e.setLanguage(t),!1}),LoginConfig.isMultiUniverse?$(".changeAction").each(function(){t($(this))}).on("change",function(){t($(this))}):$(".fb_login").attr("href",function(t,e){return LoginConfig.basePath+$(this).data("href")})});var t=function(t,n){var s,n=t.val();LoginConfig.unisWildcast?(s=LoginConfig.basePath.replace("://","://uni"+n+"."),t.parents("form").attr("action",function(t,e){return s+$(this).data("action")}),$(".fb_login").attr("href",function(t,e){return s+$(this).data("href")})):(t.parents("form").attr("action",function(t,e){return LoginConfig.basePath+"uni"+n+"/"+$(this).data("action")}),$(".fb_login").attr("href",function(t,e){return LoginConfig.basePath+"uni"+n+"/"+$(this).data("href")}))},e={setLanguage:function(t,e){$.cookie("lang",t),document.location.href=void 0===e?document.location.href:document.location.href+e}};jQuery.validator.setDefaults({highlight:function(t){$(t).closest(".c-formRow").addClass("has-error")},unhighlight:function(t){$(t).closest(".c-formRow").removeClass("has-error")},errorElement:"span",errorClass:"c-validationMSG",errorPlacement:function(t,e){$(e).is(":checkbox")?t.insertAfter(e.parent().next()):t.insertAfter(e.parent())}}),$(document).ready(function(){var t,e,n,s,i,a,o,c,l;for($("#navButton").click(function(){$("#navList").toggleClass("is-open"),$(this).toggleClass("is-open")}),$("*[data-sideBar]").click(function(){$("#loginSideBar").toggleClass("is-open")}),$("*[data-modal]").click(function(){var t=$(this).attr("data-modal");console.log($("#"+t)),$("#"+t).css("display","block")}),$("*[data-dismiss]").click(function(){var t=$(this).attr("data-dismiss");console.log($("#"+t)),$("#"+t).css("display","none")}),$("*[data-toggle-action]").click(function(){$("*[data-toggle-action]").removeClass("is-active"),$("*[data-toggle-content]").removeClass("is-show"),$(this).addClass("is-active");var t=$(this).attr("data-toggle-action");$("#"+t).toggleClass("is-show")}),$(".c-dropdown").click(function(){$(this).toggleClass("is-show")}),s=(t=document.getElementsByClassName("c-select")).length,e=0;e<s;e++){for(i=(a=t[e].getElementsByTagName("select")[0]).length,(o=document.createElement("DIV")).setAttribute("class","c-select__selected"),o.innerHTML=a.options[a.selectedIndex].innerHTML,t[e].appendChild(o),(c=document.createElement("ul")).setAttribute("class","c-select__list c-select__hidden"),n=1;n<i;n++)(l=document.createElement("li")).setAttribute("class","c-select__item"),l.innerHTML=a.options[n].innerHTML,l.addEventListener("click",function(t){for(var e,n,s,i=this.parentNode.parentNode.getElementsByTagName("select")[0],a=i.length,o=this.parentNode.previousSibling,c=0;c<a;c++)if(i.options[c].innerHTML==this.innerHTML){for(i.selectedIndex=c,o.innerHTML=this.innerHTML,s=(e=this.parentNode.getElementsByClassName("c-select__same")).length,n=0;n<s;n++)e[n].setAttribute("class","c-select__item");this.setAttribute("class","c-select__same");break}o.click()}),c.appendChild(l);t[e].appendChild(c),o.addEventListener("click",function(t){t.stopPropagation(),r(this),this.nextSibling.classList.toggle("c-select__hidden"),this.classList.toggle("c-select__arrow")})}function r(t){for(var e=[],n=document.getElementsByClassName("c-select__items"),s=document.getElementsByClassName("c-select__selected"),i=n.length,a=s.length,o=0;o<a;o++)t==s[o]?e.push(o):s[o].classList.remove("c-select__arrow");for(o=0;o<i;o++)e.indexOf(o)&&n[o].classList.add("c-select__hidden")}document.addEventListener("click",r)});