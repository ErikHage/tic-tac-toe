<template>
  <v-container>
    <v-row class="text-center">
      <v-col cols="12">
        <v-img
          :src="logo"
          class="my-3"
          contain
          height="120"
        />
      </v-col>

      <v-col class="mb-4">
        <h1 class="display-2 font-weight-bold mb-3">
          Let's Play Tic Tac Toe!
        </h1>
      </v-col>

      <v-col
        class="mb-5"
        cols="12"
      >
        <v-row justify="center">

        </v-row>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import logo from '../assets/feralrooster.jpg'

const BLANK = '';
const X_PLACED = 'X';
const O_PLACED = 'O';

//https://dev.to/diseyi/implementing-tic-tac-toe-in-vue-57go

export default {
  name: 'TicTacToe',

  data: () => ({
    logo,
    board: [
      [BLANK, BLANK, BLANK],
      [BLANK, BLANK, BLANK],
      [BLANK, BLANK, BLANK]
    ],
  }),

  methods: {
    place(mark, x, y) {
      this.board[x][y] = mark;
    },
  },
}
</script>
