<template>
  <v-container>
    <v-row class="text-center">
      <v-col cols="12">
        <v-img :src="logo" class="my-3" contain height="120"/>
        <h1 class="mb-4">Let's Play Tic Tac Toe!</h1>
        <action-buttons
            :reset="reset"
            :clear-history="clearHistory"/>
      </v-col>

      <v-col cols="12">
        <v-row justify="space-around">
          <v-col class="mb-2" cols="12" md="5">
            <h2 class="mb-4">{{ messageText }}</h2>
            <game-board
                :content="board"
                :is-disabled="this.isTie || this.winner !== null"
                :place-mark="placeMark"/>
          </v-col>
          <v-col cols="12" md="3">
            <h2 class="mb-5">Game History</h2>
            <game-history :games="previousGames"/>
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
import GameBoard from './GameBoard.vue';
import ActionButtons from './ActionButtons.vue';

export default {
  components: {
    GameBoard,
    GameHistory,
    ActionButtons,
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
    placeMark(x, y) {
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
  },
  name: 'TicTacToe',
}
</script>
