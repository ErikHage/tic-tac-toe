<template>
  <v-container>
    <v-row class="text-center">
      <v-col cols="12">
        <v-img :src="logo" class="my-3" contain height="120"/>
      </v-col>

      <v-col class="mb-4">
        <h1 class="display-2 font-weight-bold mb-3">
          Let's Play Tic Tac Toe!
        </h1>

        <h3>Current Player is {{ currentPlayer }}</h3>
      </v-col>

      <v-col class="mb-5" cols="12">
        <v-row justify="center">
          <v-col cols="4"></v-col>
          <v-col class="mb-2" cols="4">
            <v-row v-for="(row, rowIndex) of board" :key="rowIndex">
              <v-col v-for="(cell, cellIndex) of row" cols="4" :key="cellIndex">
                <v-card
                    class="d-flex"
                    height="150px"
                    @click="place(rowIndex, cellIndex)"
                    :disabled="cell !== this.BLANK">
                  {{ cell }}
                </v-card>
              </v-col>
            </v-row>
          </v-col>
          <v-col cols="4"></v-col>
        </v-row>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import logo from '../assets/feralrooster.jpg';

const BLANK = '';
const X = 'X';
const O = 'O';

//https://dev.to/diseyi/implementing-tic-tac-toe-in-vue-57go

export default {
  name: 'TicTacToe',

  data: () => ({
    X: X,
    O: O,
    BLANK: BLANK,
    logo,
    currentPlayer: X,
    round: 1,
    board: [
      [BLANK, BLANK, BLANK],
      [BLANK, BLANK, BLANK],
      [BLANK, BLANK, BLANK]
    ],
  }),

  methods: {
    place(x, y) {
      this.board[x][y] = this.currentPlayer;
      this.checkBoardState();
      this.switchCurrentPlayer();
    },
    switchCurrentPlayer() {
      this.currentPlayer = this.currentPlayer === this.X ? this.O : this.X;
      this.round = this.round + 1;
    },
    checkBoardState() {
      this.checkWin();
      this.checkTie();
    },
    checkWin() {

    },
    checkTie() {
      return this.round >= 10;
    },
    reset() {
      this.round = 1;

    }
  },
}
</script>
<style>
.cell-x {
  color: #f00;
}

.cell-o {
  color: #00f;
}
</style>