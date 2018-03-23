<template>
  <section class='search-main'>
    <div class='content'>
      <div class='subsection'>
        <div style='margin: 25px 10px;'>
          <span class='subsection-title' style='vertical-align: middle;'>Search flights by...</span>
        </div>
        <div style='margin: 10px 0;'>
          <span class='landsat_takesoff_flight-destination'>Destination: </span>
          <input type='text' v-model='destination'></input>
          <span class='landsat_takesoff_flight-date'>Date: </span>
          <input type='text' v-model='date'></input>
          <button type='button' class='button--grey' style='margin-left: 15px;' @click='search1()'>Search</button>
        </div>
        <div style='margin: 8px 0;'>
          FOO
        </div>
        <div style='margin: 8px 0;'>
          <table id='flight-results'>
            <thead>
              <tr>
                <th v-for='col in columns'>{{col}}</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for='row in rows'>
                <td v-for='col in columns'>{{row[col]}}</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import axios from '~/plugins/axios'

export default {
  data () {
    return {
      destination: '',
      date: '',
      rows: [],
      columns: []
    }
  },

  methods: {
    search1 () {
      let self = this

      axios.post('/api/search/destdate', {
        headers: {
          'Content-Type': 'application/json'
        },
        data: {
          destination: self.destination.toUpperCase(), // case insensitive
          date: self.date
        }
      }).then((res) => {
        self.rows = res.data
        self.columns = Object.keys(self.rows[0])
      }).catch((e) => {
        alert(e) // TODO - what to do with empty result?
      })
    }
  }
}
</script>

<style scoped>

</style>