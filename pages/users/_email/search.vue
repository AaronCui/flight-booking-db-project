<template>
    <section class='search-main'>
        <div class='content'>
            <div class='subsection'>
                <div style='margin: 25px 10px;'>
                    <span class='subsection-title' style='vertical-align: middle;'>What are you looking for? Fill in the ones that apply. </span>
                    <span> TESTING (DELETE AFTER): Your email is {{user.email}} and access_level is {{user.access_level}} </span>
                </div>
                <div style='margin: 10px 0;'>
                    <span class='landsat_takesoff_flight-flightno'>Flight No: </span>
                    <input type='text' v-model='flight_no'/>
                </div>
                <div style='margin: 10px 0;'>
                    <span class='landsat_takesoff_flight-airline'>Airline: </span>
                    <input type='text' v-model='airline'/>
                </div>
                <div>
                    <span class='landsat_takesoff_flight-date'>Date: </span>
                    <input type='text' v-model='date'/>
                </div>
                <div style='margin: 10px 0;'>
                    <span class='landsat_takesoff_flight-destination'>Departure: </span>
                    <input type='text' v-model='departure'/>
                </div>
                <div style='margin: 10px 0;'>
                    <span class='landsat_takesoff_flight-destination'>Destination: </span>
                    <input type='text' v-model='destination'/>
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
                        <tr v-for='(row, index) in rows'>
                            <td v-for='col in columns'>{{row[col]}}</td>
                            <td>
                                <nuxt-link :to="{ path: `open-seats`,
                    query: { flightno: searched[index].flight_no.trim(), airline: searched[index].airline.trim(), date: searched[index].date.trim() }}">
                                    View seats
                                </nuxt-link>
                            </td>
                            <br>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div>
            Not what you were looking for?
            <br>
            <nuxt-link class='button--grey' style='margin-top: 15px; margin-left: 10px;' :to="{ path: `additional` }">Try Additional Searches</nuxt-link>
        </div>
        <div>
            <nuxt-link class='button--grey' style='margin-top: 15px; margin-left: 10px;' :to="{ path: `/users/${user.email}`, params: { email: user.email }}">Back To Main Page</nuxt-link>
        </div>
    </section>
</template>

<script>
  import axios from '~/plugins/axios'

  export default {
    asyncData ({ params, error }) {
      return axios.get('/api/users/' + params.email)
        .then((res) => {
          return { user: res.data }
        })
        .catch((e) => {
          error({ statusCode: 404, message: 'User not found' })
        })
    },
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
        searched: []
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
          if (res.data.length === 0) {
            alert('No results found!')
          }
          self.rows = res.data
          self.columns = Object.keys(self.rows[0])
        }).catch((e) => {
          alert(e.response.data)
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
          // error will be displayed from first POST request
        })
      }
    },

    head () {
      return {
        title: 'Search flights'
      }
    }
  }
</script>

<style scoped>

</style>