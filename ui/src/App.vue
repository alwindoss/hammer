<template>
  <v-app id="inspire">
    <Nav v-bind:navItems=navItems />
    <v-app-bar app clipped-left>
      <v-app-bar-nav-icon @click.stop="drawer = !drawer"></v-app-bar-nav-icon>
      <v-toolbar-title>Hammer</v-toolbar-title>
    </v-app-bar>

    <v-main>
      <!-- <v-container class="fill-height" fluid> -->
      <v-container fluid>
        <router-view></router-view>
      </v-container>
    </v-main>

    <v-footer app>
      <span>&copy; Alwin Doss, {{ new Date().getFullYear() }}</span>
    </v-footer>
  </v-app>
</template>

<script>
import Nav from '@/components/navigation/Nav.vue';
export default {
  components: {
    Nav,
  },
  props: {
    source: String,
  },

  data: () => ({
    drawer: null,
    navItems: [
      {
        to: "/",
        title: "Home",
        icon: "mdi-view-dashboard"
      },
      {
        to: "/lesson",
        title: "Lessons",
        icon: "mdi-bandcamp"
      },
      {
        to: "/lessonplan",
        title: "Lesson Plans",
        icon: "mdi-ballot"
      },
      {
        to: "/student",
        title: "Students",
        icon: "mdi-account-group"
      },
    ]
  }),

  created() {
    this.$vuetify.theme.dark = false;
  },
};
</script>