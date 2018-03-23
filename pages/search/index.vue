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
          <button type='button' class='button--grey' style='margin-left: 15px;' @click='search1()'>Search</button>
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
      flight_no: '',
      airline: '',
      departure: '',
      colsSelected: [],
      rows: [],
      columns: []
    }
  },

  methods: {
    search1 () {
      let self = this

      const queryParams = {
        landsAt_airport: self.destination,
        date: self.date,
        flight_no: self.flight_no,
        airline: self.airline,
        takesOff_airport: self.departure
      }

      for (const param of Object.keys(queryParams)) {
        if (queryParams[param] === '') {
          delete queryParams[param]
        } else {
          queryParams[param] = "'" + queryParams[param] + "'"
        }
      }

      axios.post('/api/search/destdate', {
        headers: {
          'Content-Type': 'application/json'
        },
        data: {
          queryParams: queryParams,
          colsSelected: self.colsSelected
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