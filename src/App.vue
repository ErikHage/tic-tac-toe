<template>
  <v-app>
    <v-main>
      <TicTacToe/>
    </v-main>
  </v-app>
</template>

<script>
import TicTacToe from './components/TicTacToe.vue'

export default {
  name: 'App',

  components: {
    TicTacToe,
  },

  data: () => ({
    //
  }),
}
</script>
