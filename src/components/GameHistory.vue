<template>
  <v-row>
    <v-col class="mb-2" cols="12">
      <v-row v-for="(game) in games">
        <v-col cols="12">
          <v-card :class="getCardClasses(game.winner)">
            <v-card-text>
              Game {{game.number}}<br/>
              <span v-if="game.winner === 'Tie'">Tie Game</span>
              <span v-else>Winner: {{game.winner}}</span>
            </v-card-text>
          </v-card>
        </v-col>
      </v-row>
    </v-col>
  </v-row>
</template>
<script>
import { X, O } from '@/js/constants';

export default {
  name: 'GameHistory',
  props: ['games'],
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