<template>
  <div class="card col-md-4">
    <div class="card-block">
      <h4 class="card-title">{{warscroll.name}}</h4>
      <p class="card-text" id="grand-alliance-name">
        <strong>Grand Alliance:</strong> {{warscroll.army.grand_alliance_name}}
      </p>
      <p class="card-text" id="army-name">
        <strong>Army:</strong> {{warscroll.army.name}}
      </p>
    </div>
  </div>
</template>

<script>
export default {
  props: ['initialWarscroll'],
  data: function() {
    return { warscroll: this.initialWarscroll }
  }
}
</script>

<style scoped>
  p {
    margin-bottom: 0;
  }
</style>
