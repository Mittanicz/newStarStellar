Vue.component('s-button', {
  props: {
    disabled: Boolean,
    block: Boolean,
    link: Boolean,
    href: String,
  },
  template: `
  <button
    :class="classObject" 
    :disabled="disabled"
    v-if="!link"
  >
    <span class="top-corner"></span>
    <span class="bottom-corner"></span>
      <slot />
  </button>
  <a
    :class="classObject"
    :href="href"
    v-else
  >
    <span class="top-corner"></span>
    <span class="bottom-corner"></span>
    <slot />
  </a>
  `,
  data () {return {}},
  computed: {
    classObject: {
      get: function() {
        return {
          'c-btn': true,
          'c-btn--disabled': this.disabled,
          'c-btn--block': this.block
        }
      }
    }
  }
})