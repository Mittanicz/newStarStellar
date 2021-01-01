Vue.component('s-input', {
    props: {
      type: String,
      name: String,
      label: String,
      maxlength : Number,
      id: String,
      value: [String, Number],
    },
    template: `
    <div class="c-formRow">
      <label class="c-label" :for="name">{{ label }}</label>
      <div class="c-formRow__wrapper">
        <input
          :type="type"
          :maxlength="maxlength"
          class="c-input"
          :name="name"
          :id="id"
          :value="value"
        />
      </div>
    </div>
    `,
    data () {return {}},
})
