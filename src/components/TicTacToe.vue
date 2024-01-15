<template>
  <v-container>
    <v-row class="text-center">
      <v-col cols="12">
        <v-img :src="logo" class="my-3" contain height="120"/>
      </v-col>

      <v-col class="mb-5" cols="12">
        <v-row justify="center">
          <v-col cols="3">
            <h2 class="mb-5">Options</h2>
            <div class="mb-4">
              <v-btn @click="reset">Reset</v-btn>
            </div>
            <div class="mb-4">
              <v-btn @click="clearHistory">Clear History</v-btn>
            </div>
          </v-col>
          <v-col cols="1"></v-col>
          <v-col class="mb-2" cols="4">
            <h1 class="display-2 font-weight-bold mb-3">
              Let's Play Tic Tac Toe!
            </h1>

            <h2 class="mb-10">{{ messageText }}</h2>
            <v-row v-for="(row, rowIndex) of board" :key="rowIndex" class="board-row">
              <v-col v-for="(cell, cellIndex) of row" cols="4" :key="cellIndex">
                <v-card
                    :class="getCardClasses()"
                    height="120px"
                    @click="place(rowIndex, cellIndex)"
                    :disabled="!isCellClickable(cell)">
                  <v-card-text>
                    <span :class="getCellTextClasses(cell)">{{ cell }}</span>
                  </v-card-text>
                </v-card>
              </v-col>
            </v-row>
          </v-col>
          <v-col cols="1"></v-col>
          <v-col cols="3">
            <h2 class="mb-5">Game History</h2>
            <game-history :games="previousGames"></game-history>
          </v-col>
        </v-row>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import logo from '../assets/feralrooster.jpg';
import {X, O, BLANK} from '@/js/constants';
import GameHistory from './GameHistory.vue';

export default {
  components: {
    GameHistory,
  },
  data: () => ({
    logo,
    currentPlayer: X,
    winner: null,
    isTie: false,
    board: [
      [BLANK, BLANK, BLANK],
      [BLANK, BLANK, BLANK],
      [BLANK, BLANK, BLANK]
    ],
    gameCount: 1,
    previousGames: [],
  }),
  computed: {
    messageText() {
      if (this.isTie) {
        return "Tie Game";
      }

      if (this.winner !== null) {
        return `${this.currentPlayer} is the winner!`;
      }

      return `Current Player: ${this.currentPlayer}`;
    }
  },
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
      this.currentPlayer = this.currentPlayer === X ? O : X;
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
    isCellClickable(cell) {
      return cell === BLANK && this.isTie === false && this.winner === null;
    },
    win() {
      this.winner = this.currentPlayer;
      this.saveGame(this.winner);
    },
    tie() {
      this.isTie = true;
      this.saveGame("Tie");
    },
    reset() {
      this.switchPlayer();
      this.gameCount = this.gameCount + 1;
      this.winner = null;
      this.isTie = false;
      this.board = [
        [BLANK, BLANK, BLANK],
        [BLANK, BLANK, BLANK],
        [BLANK, BLANK, BLANK]
      ];
    },
    clearHistory() {
      this.previousGames = [];
    },
    saveGame(winner) {
      this.previousGames.push({
        number: this.gameCount,
        winner,
        board: this.board.map(row => {
          return row.slice();
        }),
      });
    },
    getCardClasses() {
      let classes = ["d-flex", "align-center", "justify-center"];

      if (this.winner !== null || this.isTie === true) {
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

      if (this.winner !== null || this.isTie === true) {
        classes.push("disabled-cell");
      }

      return classes.join(" ");
    }
  },
  name: 'TicTacToe',
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