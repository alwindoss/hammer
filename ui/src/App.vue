<template>
  <v-app id="inspire">
    <v-navigation-drawer
      v-model="drawer"
      app
    >
      <v-list dense >
        <v-list-item v-for="(navItem, index) in navItems" :key="index" link :to="navItem.to">
          <v-list-item-action>
            <v-icon>{{navItem.icon}}</v-icon>
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>{{navItem.title}}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>

    <v-app-bar app>
      <v-app-bar-nav-icon @click="drawer = !drawer"></v-app-bar-nav-icon>

      <v-toolbar-title>Hammer</v-toolbar-title>
    </v-app-bar>

    <v-main>
      <router-view></router-view>
    </v-main>
  </v-app>
</template>

<script>
  export default {
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
        to: "/logbook",
        title: "Log Book",
        icon: "mdi-bandcamp"
      },
      // {
      //   to: "/lessonplan",
      //   title: "Lesson Plans",
      //   icon: "mdi-ballot"
      // },
      // {
      //   to: "/student",
      //   title: "Students",
      //   icon: "mdi-account-group"
      // },
    ]
  }),
  created() {
    this.$vuetify.theme.dark = false;
  },
  }
</script>