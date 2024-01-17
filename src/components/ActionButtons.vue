<template>
  <div class="mb-4">
    <v-btn @click="reset">Reset</v-btn>
  </div>
  <div class="mb-4">
    <v-btn @click="clearHistory">Clear History</v-btn>
  </div>
</template>
<script>
export default {
  name: "ActionButtons",
  props: ['reset', 'clearHistory'],
}
</script>