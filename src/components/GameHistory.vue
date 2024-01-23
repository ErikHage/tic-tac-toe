<template>
  <v-row>
    <v-col class="mb-2" cols="12">
      <v-row v-for="(game) in games">
        <v-col cols="9">
          <game-history-record :game="game" />
        </v-col>
        <v-col cols="3">
          <history-board :board="game.board" />
        </v-col>
      </v-row>
    </v-col>
  </v-row>
</template>
<script>
import GameHistoryRecord from '@/components/GameHistoryRecord.vue'
import HistoryBoard from "@/components/HistoryBoard.vue";

export default {
  name: 'GameHistory',
  props: ['games'],
  components: {
    HistoryBoard,
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