<template>
  <v-row>
    <v-col class="mb-2" cols="12">
      <v-row v-for="(game) in games">
        <v-col cols="12">
          <game-history-record :game="game"></game-history-record>
        </v-col>
      </v-row>
    </v-col>
  </v-row>
</template>
<script>
import GameHistoryRecord from './GameHistoryRecord.vue'

export default {
  name: 'GameHistory',
  props: ['games'],
  components: {
    GameHistoryRecord,
  },
}
</script>
<style>
.winner-x {
  background-color: palevioletred !important;
}
.winner-o {
  background-color: lightskyblue !important;
}
.tie {
  background-color: lightgrey !important;
}
</style>