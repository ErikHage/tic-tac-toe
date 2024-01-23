<template>
  <v-row
      v-for="(row, rowIndex) of board"
      :key="rowIndex"
      class="board-row">
    <v-col
        class="ma-0 mt-1 pa-0 align-center justify-center"
        v-for="(cell, cellIndex) of row"
        cols="4"
        :key="cellIndex">
      <span :class="getCellTextClasses(cell)">{{ cell }}</span>
    </v-col>
  </v-row>
</template>
<script>
import {O, X} from "@/js/constants";

export default {
  name: "HistoryBoard",
  props: ['board'],
  methods: {
    getCellTextClasses(cell) {
      let classes = ["history-board-cell"];
      if (cell === X) {
        classes.push("cell-x");
      } else if (cell === O) {
        classes.push("cell-o");
      }

      return classes.join(" ");
    },
  },
}
</script>
<style>
.history-board-cell {
  font-size: 16px;
}

.cell-x {
  color: #f00;
}

.cell-o {
  color: #00f;
}
</style>