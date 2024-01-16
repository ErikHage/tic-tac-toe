<template>
  <v-row v-for="(row, rowIndex) of content" :key="rowIndex" class="board-row">
    <v-col v-for="(cell, cellIndex) of row" cols="4" :key="cellIndex">
      <v-card
          :class="getCardClasses()"
          height="120px"
          @click="placeMark(rowIndex, cellIndex)"
          :disabled="!isCellClickable(cell)">
        <v-card-text>
          <span :class="getCellTextClasses(cell)">{{ cell }}</span>
        </v-card-text>
      </v-card>
    </v-col>
  </v-row>
</template>

<script>
import { X, O, BLANK } from '@/js/constants';

export default {
  name: 'GameBoard',
  props: ['content', 'isDisabled', 'placeMark'],
  data: () => ({

  }),
  methods: {
    getCardClasses() {
      let classes = ["d-flex", "align-center", "justify-center"];

      if (this.isDisabled) {
        classes.push("disabled-cell");
      }

      return classes.join(" ");
    },
    getCellTextClasses(cell) {
      let classes = ["board-cell"];
      if (cell === X) {
        classes.push("cell-x");
      } else if (cell === O) {
        classes.push("cell-o");
      }

      return classes.join(" ");
    },
    isCellClickable(cell) {
      return cell === BLANK && !this.isDisabled;
    },
  },
}
</script>
<style>
.board-cell {
  font-size: 60px;
  cursor: pointer;
}

.cell-x {
  color: #f00;
}

.cell-o {
  color: #00f;
}

.disabled-cell {
  background-color: grey !important;
}
</style>