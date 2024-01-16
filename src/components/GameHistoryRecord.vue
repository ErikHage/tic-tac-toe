<template>
  <v-card :class="getCardClasses(game.winner)">
    <v-card-text>
      Game {{game.number}}<br/>
      <span v-if="game.winner === 'Tie'">Tie Game</span>
      <span v-else>Winner: {{game.winner}}</span>
    </v-card-text>
  </v-card>
</template>
<script>
import {O, X} from "@/js/constants";

export default {
  name: 'GameHistoryRecord',
  props: ['game'],
  methods: {
    getCardClasses(winner) {
      let classes = [];
      if (winner === X) {
        classes.push("winner-x");
      }
      if (winner === O) {
        classes.push("winner-o");
      }
      if (winner === "Tie") {
        classes.push("tie");
      }
      return classes.join(" ");
    }
  }
}
</script>
<style>

</style>