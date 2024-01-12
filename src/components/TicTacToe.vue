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

        <h2 v-if="this.isTie === true">Tie Game</h2>
        <h2 v-else-if="this.winner !== null">{{currentPlayer}} is the winner!</h2>
        <h3 v-else>Current Player is {{ currentPlayer }}</h3>
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
                    :disabled="cell !== this.BLANK || this.isTie || this.winner !== null">
                  {{ cell }}
                </v-card>
              </v-col>
            </v-row>
          </v-col>
          <v-col cols="4"></v-col>
        </v-row>
      </v-col>
    </v-row>

    <v-row justify="center">
      <v-btn @click="reset">Reset</v-btn>
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
  data: () => ({
    X: X,
    O: O,
    BLANK: BLANK,
    logo,
    currentPlayer: X,
    winner: null,
    isTie: false,
    board: [
      [BLANK, BLANK, BLANK],
      [BLANK, BLANK, BLANK],
      [BLANK, BLANK, BLANK]
    ],
  }),
  methods: {
    place(x, y) {
      this.board[x][y] = this.currentPlayer;
      if (this.checkWin()) {
        this.win();
        return;
      }
      if (this.checkTie()) {
        this.tie();
        return;
      }
      this.switchPlayer();
    },
    switchPlayer() {
      this.currentPlayer = this.currentPlayer === this.X ? this.O : this.X;
    },
    checkWin: function () {
      const mark = this.currentPlayer;

      for (let i = 0; i < 3; i++) {
        if (this.board[i].every(cell => cell === mark)) {
          return true;
        }
        if (this.board.every(row => row[i] === mark)) {
          return true;
        }
        if (this.board[0][0] === mark && this.board[1][1] === mark && this.board[2][2] === mark) {
          return true;
        }
        if (this.board[0][2] === mark && this.board[1][1] === mark && this.board[2][0] === mark) {
          return true;
        }
      }
      return false;
    },
    checkTie() {
      for (let i = 0; i < 3; i++) {
        for (let j = 0; j < 3; j++) {
          if (!this.board[i][j]) {
            return false;
          }
        }
      }
      return true;
    },
    win() {
      this.winner = this.currentPlayer;
    },
    tie() {
      this.isTie = true;
    },
    reset() {
      this.winner = null;
      this.isTie = false;
      this.board = [
        [BLANK, BLANK, BLANK],
        [BLANK, BLANK, BLANK],
        [BLANK, BLANK, BLANK]
      ];
    }
  },
  name: 'TicTacToe',
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