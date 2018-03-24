<template>
  <section class='search-main'>
    <div class='content'>
      <div class='subsection'>
        <div style='margin: 25px 10px;'>
          <span class='subsection-title' style='vertical-align: middle;'>What are you looking for? Fill in the ones that apply.</span>
        </div>
        <div style='margin: 10px 0;'>
          <span class='landsat_takesoff_flight-flightno'>Flight No: </span>
          <input type='text' v-model='flight_no'></input>
        </div>
        <div style='margin: 10px 0;'>
          <span class='landsat_takesoff_flight-airline'>Airline: </span>
          <input type='text' v-model='airline'></input>
        </div>
        <div>
          <span class='landsat_takesoff_flight-date'>Date: </span>
          <input type='text' v-model='date'></input>
        </div>
        <div style='margin: 10px 0;'>
          <span class='landsat_takesoff_flight-destination'>Departure: </span>
          <input type='text' v-model='departure'></input>
        </div>
        <div style='margin: 10px 0;'>
          <span class='landsat_takesoff_flight-destination'>Destination: </span>
          <input type='text' v-model='destination'></input>
        </div>
        <div id='attributes'>
          Choose to display:
          <input type="checkbox" id="flight_no" value="flight_no" v-model="colsSelected">
          <label for="flight_no">Flight No</label>
          <input type="checkbox" id="airline" value="airline" v-model="colsSelected">
          <label for="airline">Airline</label>
          <input type="checkbox" id="date" value="date" v-model="colsSelected">
          <label for="date">Date</label>
          <input type="checkbox" id="landsAt_airport" value="landsAt_airport" v-model="colsSelected">
          <label for="landsAt_airport">Destination</label>
          <input type="checkbox" id="takesOff_airport" value="takesOff_airport" v-model="colsSelected">
          <label for="takesOff_airport">Departure</label>
          <br>
        </div>
        <div>
          <br>
          <button type='button' class='button--grey' style='margin-left: 15px;' @click='search()'>Search</button>
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
                <br>
              </tr>
              <tr v-for="search in searched">
                <nuxt-link :to="{ path: `search/${ search.flight_no.trim() }/${ search.airline.trim() }/${ search.date.trim() }`, }">
                  View seats
                </nuxt-link>
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
      flight_no: '',
      airline: '',
      departure: '',
      checked: '',
      colsSelected: [],
      rows: [],
      columns: [],
      queryParams: {},
      searched: [],
      i: 0
    }
  },

  computed: {
    link: function () {
      return this.i++
    }
  },

  methods: {
    search () {
      let self = this

      self.queryParams = {
        landsAt_airport: self.destination.toUpperCase(),
        date: self.date,
        flight_no: self.flight_no,
        airline: self.airline,
        takesOff_airport: self.departure.toUpperCase()
      }

      for (const param of Object.keys(self.queryParams)) {
        if (self.queryParams[param] === '') {
          delete self.queryParams[param]
        } else {
          self.queryParams[param] = "'" + self.queryParams[param] + "'"
        }
      }

      axios.post('/api/search/flights', {
        headers: {
          'Content-Type': 'application/json'
        },
        data: {
          queryParams: self.queryParams,
          colsSelected: self.colsSelected
        }
      }).then((res) => {
        self.rows = res.data
        self.columns = Object.keys(self.rows[0])
      }).catch((e) => {
        alert(e) // TODO - what to do with empty result?
      })

      axios.post('/api/search/flights', {
        headers: {
          'Content-Type': 'application/json'
        },
        data: {
          queryParams: self.queryParams,
          colsSelected: ['flight_no', 'airline', 'date']
        }
      }).then((res) => {
        self.searched = res.data
      }).catch((e) => {
        alert(e)
      })
    }
  }
}
</script>

<style scoped>

</style>