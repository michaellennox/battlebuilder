<template>
  <div>
    <h1>{{warscroll.name}}</h1>
    <warscroll-card :initial-warscroll="warscroll"></warscroll-card>
  </div>
</template>

<script>
import WarscrollCard from './components/WarscrollCard.vue'

export default {
  props: ['warscroll'],
  components: { WarscrollCard }
}
</script>

<style scoped>

</style>
