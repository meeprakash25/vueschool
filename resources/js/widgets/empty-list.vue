<template>
  <div class="card widget articles-widget">
    <div :class="['card-body', bodyClass]">
      <h4 :class="['card-title', cardTitleBg]">
        <template>{{ title }}</template>
      </h4>
      <a class="list-item">
        <h5>{{ body }}</h5>
      </a>
    </div>
  </div>
</template>

<script>

export default {
  props: {
    cardTitleBg:String,
    title: String,
    body: String,
    bodyClass: String,
    source: {
      type: String,
      default: "dashboard"
    }
  },
}
</script>