"use strict";Vue.component("s-input",{props:{type:String,name:String,label:String,maxlength:Number,id:String,value:[String,Number]},template:'\n    <div class="c-formRow">\n      <label class="c-label" :for="name">{{ label }}</label>\n      <div class="c-formRow__wrapper">\n        <input\n          :type="type"\n          :maxlength="maxlength"\n          class="c-input"\n          :name="name"\n          :id="id"\n          :value="value"\n        />\n      </div>\n    </div>\n    ',data:function(){return{}}});