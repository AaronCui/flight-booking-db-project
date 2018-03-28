<template>
    <section class='additional-searches'>
        <div class='content'>
            <div class='subsection'>
                <div style='margin: 25px 10px;'>
                    <span class='subsection-title' style='vertical-align: middle;'>Search flights and seats by...</span>
                </div>
                <div style='margin: 10px 0;'>
                    <span class='confirm-departure'>Departure: </span>
                    <input type='text' v-model='takesoff'/>
                </div>
                <div style='margin: 10px 0;'>
                    <span class='confirm-destination'>Destination: </span>
                    <input type='text' v-model='landsat'/>
                </div>
                <div style='margin: 10px 0;'>
                    <span class='confirm-seat-class'>Seat class: </span>
                    <select v-model="seatChoice">
                        <option v-for="seat in seatclasses" v-bind:value="seat.text">
                            {{ seat.text }}
                        </option>
                    </select>
                </div>
                <div>
                    <span class='confirm-'>Price range: </span>
                    <input type='text' v-model='seat_price_lower' placeholder="100000"/>
                    to
                    <input type='text' v-model='seat_price_upper' placeholder="200000"/>
                </div>
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
                        <td >
                            <nuxt-link :to="{ path: `/book`,
                  query: { seat_no: row.seat_no.trim(), flight_no: row.flight_no.trim(), airline: row.airline.trim(), date: row.date.trim() }}">
                                Book
                            </nuxt-link>
                        </td>
                        <br>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div>
            <nuxt-link class='button--grey' style='margin-top: 20px; margin-left: 10px;' :to="{ path: `/users/${email}/search`, params: { email: email }}">Back To Flight Search</nuxt-link>
            <nuxt-link class='button--grey' style='margin-top: 20px; margin-left: 10px;' :to="{ path: `/users/${email}`, params: { email: email }}">Back To Main Page</nuxt-link>
        </div>
    </section>
</template>

<script>
  import axios from '~/plugins/axios'

  export default {
    asyncData ({ params }) {
      return {
        email: params.email
      }
    },
    data () {
      return {
        landsat: '',
        takesoff: '',
        seatChoice: '',
        seatclasses: [
          {text: 'first'},
          {text: 'business'},
          {text: 'economy'}
        ],
        seat_price_upper: '',
        seat_price_lower: '',
        queryParams: {},
        rows: [],
        columns: []
      }
    },

    methods: {
      search () {
        let self = this

        self.queryParams = {
          landsAt_airport: self.landsat,
          takesOff_airport: self.takesoff,
          seat_class: self.seatChoice
        }

        for (const param of Object.keys(self.queryParams)) {
          if (self.queryParams[param] === '') {
            delete self.queryParams[param]
          } else {
            if (typeof self.queryParams[param] === 'string') {
              self.queryParams[param] = `'${self.queryParams[param]}'`
            }
          }
        }

        axios.post('/api/search/additional/lookup', {
          headers: {
            'Content-Type': 'application/json'
          },
          data: {
            queryParams: self.queryParams,
            seat_price_lower: self.seat_price_lower,
            seat_price_upper: self.seat_price_upper
          }
        })
          .then(res => {
            if (res.data.length === 0) {
              alert('No results found!')
            } else {
              self.rows = res.data
              self.columns = Object.keys(self.rows[0])
            }
          })
          .catch(e => {
            alert('Something went wrong. Please try again.')
          })
      }
    },

    head () {
      return {
        title: 'Additional searches'
      }
    }
  }
</script>

<style scoped>

</style>