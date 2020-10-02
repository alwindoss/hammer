<template>
    <v-navigation-drawer v-model="drawer" app clipped>
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
</template>

<script>
export default {
    props: {
        navItems: Array,
    }
}
</script>