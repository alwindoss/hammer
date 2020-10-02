<template>
  <v-data-table
    :headers="headers"
    :items="logBookEntries"
    sort-by="time"
    class="elevation-1"
  >
    <template v-slot:top>
      <v-toolbar flat>
        <v-toolbar-title>Log Book</v-toolbar-title>
        <v-divider class="mx-4" inset vertical></v-divider>
        <v-spacer></v-spacer>
        <v-dialog v-model="dialog" max-width="500px">
          <template v-slot:activator="{ on, attrs }">
            <v-btn color="primary" dark class="mb-2" v-bind="attrs" v-on="on">
              New Item
            </v-btn>
          </template>
          <v-card>
            <v-card-title>
              <span class="headline">{{ formTitle }}</span>
            </v-card-title>

            <v-card-text>
              <v-container>
                <v-row>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field
                      v-model="editedItem.time"
                      label="Time"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field
                      v-model="editedItem.callSign"
                      label="Call Sign"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field
                      v-model="editedItem.band"
                      label="Band"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field
                      v-model="editedItem.mode"
                      label="Mode"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field
                      v-model="editedItem.power"
                      label="Power"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field
                      v-model="editedItem.signalOut"
                      label="Signal Out"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field
                      v-model="editedItem.signalIn"
                      label="Signal In"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field
                      v-model="editedItem.name"
                      label="Name"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field
                      v-model="editedItem.notes"
                      label="Notes"
                    ></v-text-field>
                  </v-col>
                </v-row>
              </v-container>
            </v-card-text>

            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="blue darken-1" text @click="close"> Cancel </v-btn>
              <v-btn color="blue darken-1" text @click="save"> Save </v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>
        <v-dialog v-model="dialogDelete" max-width="500px">
          <v-card>
            <v-card-title class="headline"
              >Are you sure you want to delete this item?</v-card-title
            >
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="blue darken-1" text @click="closeDelete"
                >Cancel</v-btn
              >
              <v-btn color="blue darken-1" text @click="deleteItemConfirm"
                >OK</v-btn
              >
              <v-spacer></v-spacer>
            </v-card-actions>
          </v-card>
        </v-dialog>
      </v-toolbar>
    </template>
    <template v-slot:[`item.actions`]="{ item }">
      <v-icon small class="mr-2" @click="editItem(item)"> mdi-pencil </v-icon>
      <v-icon small @click="deleteItem(item)"> mdi-delete </v-icon>
    </template>
    <template v-slot:no-data>
      <v-btn color="primary" @click="initialize"> Reset </v-btn>
    </template>
  </v-data-table>
</template>

<script>
export default {
  data: () => ({
    dialog: false,
    dialogDelete: false,
    headers: [
    //   {
    //     text: "Dessert (100g serving)",
    //     align: "start",
    //     sortable: false,
    //     value: "name",
    //   },
      { text: "Time", value: "time" },
      { text: "Call Sign", value: "callSign" },
      { text: "Band", value: "band" },
      { text: "Mode", value: "mode" },
    //   { text: "Power", value: "actions", sortable: false },
      { text: "Power", value: "power"},
      { text: "Signal Out", value: "signalOut"},
      { text: "Signal In", value: "signalIn"},
      { text: "Name", value: "name"},
      { text: "Notes", value: "notes"},
      { text: "Actions", value: "actions"},
    ],
    logBookEntries: [],
    editedIndex: -1,
    editedItem: {
      time: "",
      callSign: 0,
      band: 0,
      mode: 0,
      power: 0,
      signalOut: 0,
      signalIn: 0,
      name: 0,
      notes: 0,
    },
    defaultItem: {
      time: "",
      callSign: 0,
      band: 0,
      mode: 0,
      power: 0,
      signalOut: 0,
      signalIn: 0,
      name: 0,
      notes: 0,
    },
  }),

  computed: {
    formTitle() {
      return this.editedIndex === -1 ? "New Item" : "Edit Item";
    },
  },

  watch: {
    dialog(val) {
      val || this.close();
    },
    dialogDelete(val) {
      val || this.closeDelete();
    },
  },

  created() {
    this.initialize();
  },

  methods: {
    initialize() {
      this.logBookEntries = [
        {
          time: "Friday, 3 October 2019 (IST)",
          callSign: "vu2fi",
          band: 6.0,
          model: 24,
          power: 4.0,
          signalOut: 4.0,
          signalIn: 4.0,
          name: 4.0,
          notes: 4.0,
        },
        {
          time: "Friday, 2 October 2020 (IST)",
          callSign: "vu2XYZ",
          band: 6.0,
          model: 24,
          power: 4.0,
          signalOut: 4.0,
          signalIn: 4.0,
          name: 4.0,
          notes: 4.0,
        },
      ];
    },

    editItem(item) {
      this.editedIndex = this.desserts.indexOf(item);
      this.editedItem = Object.assign({}, item);
      this.dialog = true;
    },

    deleteItem(item) {
      this.editedIndex = this.desserts.indexOf(item);
      this.editedItem = Object.assign({}, item);
      this.dialogDelete = true;
    },

    deleteItemConfirm() {
      this.logBookEntries.splice(this.editedIndex, 1);
      this.closeDelete();
    },

    close() {
      this.dialog = false;
      this.$nextTick(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      });
    },

    closeDelete() {
      this.dialogDelete = false;
      this.$nextTick(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      });
    },

    save() {
      if (this.editedIndex > -1) {
        Object.assign(this.logBookEntries[this.editedIndex], this.editedItem);
      } else {
        this.logBookEntries.push(this.editedItem);
      }
      this.close();
    },
  },
};
</script>