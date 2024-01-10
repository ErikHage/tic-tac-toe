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
          <v-col cols="3"></v-col>
          <v-col class="mb-2" cols="6">
            <v-row v-for="(row, rowIndex) of board">
              <v-col v-for="(cell, cellIndex) of row" cols="4">
                <v-card height="100px">
                  {{ rowIndex }}, {{ cellIndex }}
                </v-card>
              </v-col>
            </v-row>
          </v-col>
          <v-col cols="3"></v-col>
        </v-row>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import logo from '../assets/feralrooster.jpg';
import {ref, reactive} from 'vue';

const BLANK = '';
const X = 'X';
const O = 'O';

//https://dev.to/diseyi/implementing-tic-tac-toe-in-vue-57go

export default {
  name: 'TicTacToe',

  data: () => ({
    logo,
    currentPlayer: X,
    board: reactive([
      [BLANK, BLANK, BLANK],
      [BLANK, BLANK, BLANK],
      [BLANK, BLANK, BLANK]
    ]),
  }),

  methods: {
    place(x, y) {
      this.board[x][y] = this.currentPlayer;
    },
  },
}
</script>
