<template>
  <v-btn class="mr-4" @click="reset">Reset</v-btn>
  <v-btn @click="clearHistory">Clear History</v-btn>
</template>
<script>
export default {
  name: "ActionButtons",
  props: ['reset', 'clearHistory'],
}
</script>